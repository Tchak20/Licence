<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Maladies;
use App\Models\Symptomes;

class SymptomeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       // $query= Symptomes::query();
        $symptomes = Symptomes::query()->oldest('nom_symptome')->paginate(6);
        return view('symptome_create', compact('symptomes'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
     //  $idf = Maladies::find($id);
       // $id = $id->id;
        $symptome = new Symptomes();
        $symptome->nom_symptome = $request->input('nom_symptome');
        $symptome->save();
        return back()->with('info', 'symptome créé avec succès !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $symptome = Symptomes::find($id);
        $nom = Symptomes::query()
                ->where('id', '=', $id)
                ->value('symptomes.nom_symptome');
        return view('edit_symp', compact('nom','symptome'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $id)
    {
        $ida = Symptomes::find($id);
        $ida->update($request->all());
        return redirect()->route('symptomes.create')->with('info', 'Symptomes modifiée avec succès !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $symptome = Symptomes::find($id);
        $symptome->delete();
        return back()->with('info', 'Symptôme supprimée avec succès !');
    }

    public function destroi($id)
    {
        $maladie = Maladie::find($maladie_id);
        $maladie->symptomes()->detach($symptome_id);
        return back()->with('info', 'Symptôme supprimée avec succès !');
    }
}
