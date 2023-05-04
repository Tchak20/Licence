@extends('layouts.app')
 @section('content')
<!--- Modification --->

<div class="card-content w-50 mx-auto mt-100">
      <div class="card-header">
        <h5 class="card-title">Ajouter un symptôme</h5>
      </div>
      <div class="card-body">
        <form action="{{ route('home.update', $maladie->id) }}" method="POST" enctype="multipart/form-data" >
          @csrf
          @method('put')
          <div class="mb-3">
            <label for="name" class="form-label">Nom</label>
            <input class="form-control @error('nom') is-invalid @enderror" id="name" type="text" name="nom_maladie" value="{{ old('nom_maladie', $maladie->nom_maladie) }}" placeholder="Nom de la maladie">
            @error('nom_maladie')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>

          <input type="text" hidden name="maladies_id" value="{{ $maladie->id }}" >
          <div class="mb-3">
            <label for="image" class="form-label">Select Image:</label>
            <input type="file" name="image" id="image"  class="mon-champ-de-fichier form-control @error('image) is-invalid @enderror">
            @error('image')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>

          <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" value="{{ old('description', $maladie->description) }}" placeholder="Description de la maladie"></textarea>
            @error('description')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>
           
          <div class="mb-3">
            <label for="traitement" class="form-label">Traitement</label>
            <textarea class="form-control" id="traitement" name="traitements" placeholder="Traitement">{{ old('traitements', $traitement ) }}</textarea>
            @error('traitement')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>
          <div class="mb-3">
            <label for="prevention" class="form-label">Prévention</label>
            <textarea class="form-control" id="prevention" name="prevention" placeholder="Prévention">{{ old('prevention', $prevention )}}</textarea>
            @error('prevention')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>
          <div class="mb-3">
            <label for="autres" class="form-label">Autres</label>
            <textarea class="form-control" id="autres" name="autres" placeholder="Autres...">{{ old('autres' , $autres ) }}</textarea>
            @error('autres')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>

          <div class="d-grid gap-2">
            <button class="btn btn-primary" type="submit">Envoyer</button>
          </div>
        </form>
      </div>
     
    </div>

    <script>
      document.getElementById('mon-champ-de-fichier').defaultValue = "{{ old('image'), $maladie->image }}";
    </script>
@endsection