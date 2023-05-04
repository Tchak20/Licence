@extends('layouts.app')

@section('content')
@if(session()->has('info'))
<div class="bg-success text-white p-3">
{{ session('info') }}
</div>
@endif
    <div class="container py-5">
        <h1 class="text-lg font-medium text-gray-900 text-center" style="font-size: 47px">{{ __('Liste des maladies') }}</h1>
        <form class="d-flex mt-4 mx-auto" action="{{ route('home') }}" method="GET">
            <input class="form-control me-2 w-50" name="q" type="text" placeholder="Recherche" aria-label="Recherche" >
            <button class="btn btn-outline-primary" type="submit">Recherche</button>
        </form>
        <a href="{{ route('home.create') }}" class="btn btn-success mb-5 mt-4 mx-auto" data-bs-toggle="modal" data-bs-target="#exampleModal">Ajouter <i class="bi bi-plus-lg"></i></a>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            @foreach($maladies as $maladie)
                <div class="col" style="height: 350px;">
                    <div class="card h-100">
                      
                        <div class="card-body h-100">
                            <img src="{{asset('storage/'.$maladie->image)}}" class="card-img-top h-50" alt="{{ $maladie->nom }}">
                            <h3 class="card-title">{{ $maladie->nom_maladie }}</h3>
                            <p class="card-text text-truncate">{{ $maladie->description }}</p>
                            <a href="{{ route('home.show', $maladie->id)}}" class="card-link text-primary">Voir plus</a>

                            <div class="d-flex justify-content-between align-items-center">
                                <a href="{{ route('home.show', $maladie->id) }}" class="btn btn-warning" data-bs-toggle="tooltip" data-bs-placement="top" title="Voir" ><i class="bi bi-eye-fill"></i> Voir </a>
                                <a href="{{ route('home.edit', $maladie->id) }}"  class="btn btn-primary"><i class="bi bi-pencil-square"></i> Modifier </a>
                                <form action="{{ route('home.destroy', $maladie->id) }}" method="post">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-danger" type="submit" data-bs-toggle="tooltip" data-bs-placement="top" title="Supprimer"><i class="bi bi-trash3"></i> Supprimer </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
    <footer class="mt-5">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            {{ $maladies->links('vendor.pagination.bootstrap-5') }}
        </ul>
    </nav>
</footer>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Création d'une maladie</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="{{ route('home.store') }}" method="POST" enctype="multipart/form-data" >
          @csrf
          <div class="mb-3">
            <label for="name" class="form-label">Nom</label>
            <input class="form-control @error('nom') is-invalid @enderror" id="name" type="text" name="nom_maladie" value="" placeholder="Nom de la maladie">
            @error('nom_maladie')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>

          <div class="mb-3">
            <label for="image" class="form-label">Select Image:</label>
            <input type="file" name="image" id="image" class="form-control @error('image) is-invalid @enderror">
            @error('image')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>

          <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" placeholder="Description de la maladie"></textarea>
            @error('description')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>
          
          @foreach($idm as $idma)
           
           @endforeach
           <input type="text" hidden name="maladies_id" value="
           <?php 
           if($idm){
             echo ($idma->id + 1); 
            }else{
              echo (1);
            }
          ?>
           " >
           
          <div class="mb-3">
            <label for="traitement" class="form-label">Traitement</label>
            <textarea class="form-control" id="traitement" name="traitements" placeholder="Traitement">{{ old('traitements') }}</textarea>
            @error('traitement')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>
          <div class="mb-3">
            <label for="prevention" class="form-label">Prévention</label>
            <textarea class="form-control" id="prevention" name="prevention" placeholder="Prévention">{{ old('prevention') }}</textarea>
            @error('prevention')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>
          <div class="mb-3">
            <label for="autres" class="form-label">Autres</label>
            <textarea class="form-control" id="autres" name="autres" placeholder="Autres...">{{ old('autres') }}</textarea>
            @error('autres')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>

          <div class="d-grid gap-2">
            <button class="btn btn-primary" type="submit">Envoyer</button>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
      </div>
    </div>
  </div>
</div>


@endsection
