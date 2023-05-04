@extends('layouts.app')

@section('content')
@if(session()->has('info'))
    <div class="bg-success text-white p-3">
    {{ session('info') }}
    </div>
    @endif
<div class="container">
        <!-- Bloc en haut avec l'image ronde et la description -->
        <div class="row py-5">
            <div class="col-md-3">
                <img src=" {{asset('storage/'.$maladies->image)}}" class="rounded-circle img-fluid" alt="Image ronde">
            </div>
            <div class="col-md-9">
                <h1> {{ $maladies->nom_maladie }}</h1>
                <p class="w-100"> {{ $maladies->description }}</p>
            </div>
            <div class="mx-auto mt-100" >
                <h2>Traitement</h2>
                <p>{{ $traitements }}</p>
                <h2>Préventions</h2>
                <p>{{ $prevention }}</p>
                <h2>Autres</h2>
                <p>{{ $autres }}</p>
            </div>
        </div>
        <!-- Bloc en bas avec la liste d'éléments et les boutons -->
        <div class="row w-100">
            <div class="col align-item-right">
                <table class="table shadow">
                    <thead>
                        <tr>
                            <th scope="col">Elément</th>
                            <th scope="col"></th>
                            <th scope="col">Actions</th>
                            <th scope="col"><a href="" class="btn btn-success mb-5 " data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-toggle="tooltip" data-bs-placement="top" title="Ajouter">Ajouter <i class="bi bi-plus-lg"></i></a></th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($maladies->symptomes as $symptome)

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
        <h5 class="modal-title" id="exampleModalLabel">Mon formulaire</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="{{ route('home.update', $maladies->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('put')
           
        <div class="field">
            <label class="label">Symptomes</label>
            <div class="select is-multiple w-100">
            <select name="cats[] " class="w-100" multiple>
            @foreach($symptomes as $symptome)
            <option value="{{ $symptome->id }}" {{ in_array($symptome->id, old('cats') ?:  $maladies->symptomes->pluck('id')->all()) ? 'selected' : '' }}>{{ $symptome->nom_symptome }}</option>
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