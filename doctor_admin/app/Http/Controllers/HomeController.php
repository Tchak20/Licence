<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Maladies;
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
        $fiches->traitements = $request->input('traitements');
        $fiches->maladies_id = $request->input('maladies_id');
        $fiches->prevention = $request->input('prevention');
        $fiches->autres = $request->input('autres');
        if($image = $request->file('image')){
            // $destinationPath ='images/';
             $imageName = $image->getClientOriginalName();
             $image->move(public_path().'/storage/',$imageName);
             $maladie['image'] = $imageName;
           // $maladie->image = $request->$imageName; 
             
         }
        // $maladie->image = $request->$input; 
        // Enregistrer la maladie dans la base de données
        
        $maladie->save();
        $fiches->save();
        return redirect()->route('home')->with('info', 'Maladie créée avec succès !');
    }

    public function show($id)
    {
        $symptomes = Symptomes::all();
        $traitements = Fiche::query()
            ->where('maladies_id', '=', $id)
            ->value('fiches.traitements');
        $prevention = Fiche::query()
                ->where('maladies_id', '=', $id)
                ->value('fiches.prevention');
        $autres = Fiche::query()
                ->where('maladies_id', '=', $id)
                ->value('fiches.autres');
        $maladies = Maladies::find($id);
        $maladies->with('symptomes')->get();
        return view('show', compact('maladies','symptomes','traitements','prevention','autres'));
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

    public function update(Request $request, Maladies $id)
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
