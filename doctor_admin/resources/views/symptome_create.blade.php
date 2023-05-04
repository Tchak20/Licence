@extends('layouts.app')

@section('content')

@if(session()->has('info'))
    <div class="bg-success text-white p-3">
    {{ session('info') }}
    </div>
@endif
    <div class="card-content w-50 mx-auto mt-100 mb-100">
      <div class="card-header">
        <h5 class="card-title">Ajouter un symptôme </h5>
      </div>
      <div class="modal-body">
        <form action="{{ route('symptomes.store') }}" method="POST" enctype="multipart/form-data" >
          @csrf
          <div class="mb-3">
            <label for="name" class="form-label">Nom</label>
            <input class="form-control @error('nom') is-invalid @enderror" id="name" type="text" name="nom_symptome"  placeholder="Nom du symptôme ">
            @error('nom_symptome')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
          </div>

          <div class="d-grid gap-2">
            <button class="btn btn-primary" type="submit">Envoyer</button>
          </div>
        </form>
      </div>
      
      <div class="row w-100 mx-auto mt-6">
            <div class="col align-item-right">
                <table class="table shadow">
                    <thead>
                        <tr>
                            <th scope="col">Elément</th>
                            <th scope="col"></th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($symptomes as $symptome)

                        <tr>
                        <td>{{$symptome->nom_symptome}}</td>
                           
                                <td>
                               <a href="{{ route('symptomes.edit', $symptome->id) }}"  data-bs-toggle="tooltip" data-bs-placement="top" title="Ajouter" data-id="$symptome->nom"> <button type="button" class="btn btn-warning">
                                    <i class="bi bi-pencil"></i> Modifier
                                </button></a>
                                </td>
                                <td>
                                <form action="{{ route('symptomes.destroy', $symptome->id) }}" method="POST">
                                @csrf
                                @method('delete')
                                   <button type="submit" class="btn btn-danger">
                                    <i class="bi bi-trash"></i> Supprimer
                                   </button> 
                                </form>
                            </td>
                        </tr>
                        @endforeach
                        
                    </tbody>
                </table>
            </div>
            <footer class="mt-5">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        {{ $symptomes->links('vendor.pagination.bootstrap-5') }}
                    </ul>
                </nav>
            </footer>
        </div>

 

@endsection