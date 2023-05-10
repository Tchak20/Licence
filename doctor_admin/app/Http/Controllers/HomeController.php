<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Maladies;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\UploadedFile;
use App\Models\Symptomes;
use App\Models\Fiche;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $maladies = Maladies::all();
        if($maladies->count() > 0){
            $maladi = new Maladies;
            $query= Maladies::query();
            if($request->input('q')){
            $query = $request->input('q');
            $maladies = Maladies::query()
                ->where('nom_maladie', 'like', '%'.$query.'%')
                ->orderBy('nom_maladie','asc')
                ->paginate(6);
           // $maladies = $query->oldest('nom_maladie')->paginate(3);
            }
            else{
                $maladies = $query->oldest('nom_maladie')->paginate(6);
            }
     
            $idm = Maladies::all();
            return view('home', compact('maladies','idm'));
        } else {
            return view('wel');
        }
        
    }

    public function create()
    {
        return view('home.create');
    }

    public function store(Request $request)
{
    $maladie = new Maladies();
    $fiches = new Fiche();
    $maladie->nom_maladie = $request->input('nom_maladie');
    $maladie->description = $request->input('description');
    if($image = $request->file('image')){
        $imageName = $image->getClientOriginalName();
        $image->move(public_path().'/storage/',$imageName);
        $maladie['image'] = $imageName;   
    }
    $maladie->save();
    $maladie_id = $maladie->id; // Récupérer l'id de la maladie créée
    
    $fiches->traitements = $request->input('traitements');
    $fiches->maladies_id = $maladie_id; // Utiliser l'id de la maladie créée pour enregistrer la fiche
    $fiches->prevention = $request->input('prevention');
    $fiches->autres = $request->input('autres');
    $fiches->save();
    
    return redirect()->route('home')->with('info', 'Maladie créée avec succès !');
}


    public function show($id) {
        $maladie = Maladies::find($id); // récupère la maladie avec l'id correspondant
        $fiche = Fiche::where('maladies_id', $id)->first(); // récupère la fiche correspondante à la maladie
    
        // passe les données à la vue
        return view('show', [
            'maladie' => $maladie,
            'fiche' => $fiche,
        ]);
    }
    

    public function edit($id)
    {
       // $fiche = new Fiche;
        $maladie = Maladies::find($id);
        $traitement = Fiche::query()
                ->where('maladies_id', '=', $id)
                ->value('fiches.traitements');
        $prevention = Fiche::query()
                ->where('maladies_id', '=', $id)
                ->value('fiches.prevention');
        $autres = Fiche::query()
                ->where('maladies_id', '=', $id)
                ->value('fiches.autres');
        return view('edit', compact('maladie','traitement','prevention','autres'));
    }

    public function update(Request $request,  $id)
    {
    $maladie = Maladies::find($id); 
    $maladie->nom_maladie = $request->input('nom_maladie');
    $maladie->description = $request->input('description');

    // Vérifier si une nouvelle image a été uploadée
    if($image = $request->file('image')){
        // $destinationPath ='images/';
         $imageName = $image->getClientOriginalName();
         $image->move(public_path().'/storage/',$imageName);
         $maladie['image'] = $imageName;
       // $maladie->image = $request->$imageName; 
         
     }

    $maladie->save();

    // Mettre à jour la fiche associée si elle existe
    $fiche = Fiche::where('maladies_id', $maladie->id)->first();
    if ($fiche) {
        $fiche->update([
            'traitements' => $request->input('traitements'),
            'prevention' => $request->input('prevention'),
            'autres' => $request->input('autres'),
        ]);
    } else {
        Fiche::create([
            'maladies_id' => $maladie->id,
            'traitements' => $request->input('traitements'),
            'prevention' => $request->input('prevention'),
            'autres' => $request->input('autres'),
        ]);
    }

    return back()->with('info', 'Maladie et fiche mises à jour avec succès !');
}
    public function update2(Request $request, Maladies $id)
    {
        $id->update($request->all());
        $id->symptomes()->sync($request->cats);
        return back()->with('info', 'Symptome ajouté avec succès !');
    }

    public function destroy($id)
    {
        $maladie = Maladies::find($id);
        $maladie->delete();
        return redirect()->route('home')->with('info', 'Maladie supprimée avec succès !');
    }
}
