<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{EducadoraController,EventoController,NinosController,GradosController,CursosController};


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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

//Route::get('/educadoras',[EducadorasController::class,'index']);
Route::apiResource('/educadoras',EducadoraController::class);
Route::apiResource('/eventos',EventoController::class);
Route::apiResource('/ninos',NinosController::class);
Route::apiResource('/curso',CursosController::class)->parameters(['cursos'=>'curso']);
