<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MaladieController;
use App\Http\Controllers\SymptomeController;
use App\Http\Controllers\MalSympController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/home/create', [App\Http\Controllers\HomeController::class, 'create'])->name('home.create');
Route::post('/home', [App\Http\Controllers\HomeController::class, 'store'])->name('home.store');
Route::get('/home/{id}', [App\Http\Controllers\HomeController::class, 'show'])->name('home.show');
Route::get('/home/{id}/edit', [App\Http\Controllers\HomeController::class, 'edit'])->name('home.edit');
Route::put('/home/{id}', [App\Http\Controllers\HomeController::class, 'update'])->name('home.update');
//Route::put('/home/{id}', [App\Http\Controllers\HomeController::class, 'update2'])->name('home.update2');
Route::delete('/home/{id}', [App\Http\Controllers\HomeController::class, 'destroy'])->name('home.destroy');
//Route::get('/home',  [App\Http\Controllers\HomeController::class, 'recherche'])->name('recherche');


Route::resource('symptomes', SymptomeController::class);
Route::resource('malsymp', MalSympController::class);
