@extends('layouts.app')
 @section('content')
<!--- Modification --->

<div class="card-content w-50 mx-auto mt-100">
      <div class="card-header">
        <h5 class="card-title">Ajouter un symptôme</h5>
      </div>
      <div class="card-body">
        <form action="{{ route('symptomes.update', $symptome->id) }}" method="POST" enctype="multipart/form-data" >
          @csrf
          @method('put')
          <div class="mb-3">
            <label for="name" class="form-label">Nom</label>
            <input class="form-control @error('nom') is-invalid @enderror" id="name" type="text" name="nom_symptome" value="{{ $nom }}" placeholder="Nom de la maladie">
            @error('nom_maladie')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>
          <div class="d-grid gap-2">
            <button class="btn btn-primary" type="submit">Envoyer</button>
          </div>
        </form>
      </div>
     
    </div>

@endsection