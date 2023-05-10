@extends('layouts.app')

@section('content')
@if(session()->has('info'))
    <div id="infos" class="bg-success text-white p-3">
    {{ session('info') }}
    </div>
    @endif
<div class="container">
        <!-- Bloc en haut avec l'image ronde et la description -->
        <div class="row py-5">
            <div class="col-md-3 card" style="padding:10px;">
                <img src=" {{asset('storage/'.$maladie->image)}}" class=" img-fluid" alt="Image ronde">
            </div>
            <div class="col-md-1">
            </div>
            <div class="col-md-8 card">
                <h1> {{ $maladie->nom_maladie }}</h1>
                <p class="w-100"> {{ $maladie->description }}</p>
            </div>
            <div class="row" >
                <div class="col-md-5 card" style="min-heighh:100px; margin-top:30px;padding:10px;">
                    <h2>Traitement</h2>
                    @if(isset($fiche->traitements))
                        <p>Traitements : {{ $fiche->traitements }}</p>
                    @else
                        <p> Non spécifiés</p>
                    @endif
                </div>
                <div class="col-md-1" style="">
                   
                </div>
                <div class="col-md-6 card" style="min-heighh:100px; margin-top:30px; padding:10px;">
                    <h2>Préventions</h2>
                    @if(isset($fiche->prevention))
                        <p>Traitements : {{ $fiche->prevention }}</p>
                    @else
                        <p>Non spécifiés</p>
                    @endif
                </div>
            </div>
            <div class="col-md-12 card" style="min-heighh:100px; margin-top:30px;padding:10px;">
                <h2>Autres Informations</h2>
                @if(isset($fiche->autres))
                    <p> {{ $fiche->autres }}</p>
                @else
                    <p> Non spécifiés</p>
                @endif
            </div>
        </div>
        <!-- Bloc en bas avec la liste d'éléments et les boutons -->
        <div class="row w-100">
            <div class="col align-item-right">
                <table class="table shadow">
                    <thead>
                        <tr>
                            <th scope="col">Symptomes</th>
                            <th scope="col"></th>
                            <th scope="col">Actions</th>
                            <th scope="col"><a href="" class="btn btn-success mb-5 " data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-toggle="tooltip" data-bs-placement="top" title="Ajouter">Ajouter un Symptome<i class="bi bi-plus-lg"></i></a></th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($maladie->symptomes as $symptome)

                        <tr>
                        <td>{{$symptome->nom_symptome}}</td>
                           
                                <td>
                                </td>
                                <td>
                                <form action="{{ route('malsymp.destroy', $symptome->id) }}" method="POST"> <button type="submit" class="btn btn-danger">
                                @csrf
                                @method('delete')
                                <i class="bi bi-trash"></i> Retirer
                                </button> </form>
                            </td>
                        </tr>
                        @endforeach
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ajouter un Symptomes</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="{{ route('home.update2', $maladie) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('put')
           
        <div class="field">
            <label class="label">Symptomes</label>
            <div class="select is-multiple w-100">
            <select name="cats[] " class="w-100" multiple>
            @foreach($symptomes as $symptome)
            <option value="{{ $symptome->id }}" {{ in_array($symptome->id, old('cats') ?:  $maladie->symptomes->pluck('id')->all()) ? 'selected' : '' }}>{{ $symptome->nom_symptome }}</option>
            @endforeach
            </select>
        </div>
        
        <a href="{{ route('symptomes.create') }}" class="btn btn-primary">nouveau symptôme</a>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
            <button type="submit" class="btn btn-primary">Envoyer</button>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>

@endsection