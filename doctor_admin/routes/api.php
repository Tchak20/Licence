<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register',[AuthController::class,'register']);
Route::get('/maladies',[AuthController::class,'index']);
Route::get('/user/{id}',[AuthController::class,'user']);
Route::get('/fiche/{id}',[AuthController::class,'getfiches']);
Route::get('/mail',[AuthController::class,'mail']);
Route::post('/login',[AuthController::class,'login']);