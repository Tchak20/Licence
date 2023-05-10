@extends('layouts.app')

@section('content')
@if(session()->has('info'))
<div class="bg-success text-white p-3">
{{ session('info') }}
</div>
@endif
    <div class="container py-5" style="">
        <div class="card col-md-10 m-auto mb-5" style="padding:20px;">

            <h1>lionel</h1>
        </div>
    </div>
    <footer class="mt-5">
    
</footer>



@endsection
