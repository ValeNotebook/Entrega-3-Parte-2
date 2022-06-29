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
Route::get('educadoras/get/{id}',[EducadoraController::class,"verEducadora"]);
Route::put('educadoras/{rut_educadora}/post/{cod_curso}',[EducadoraController::class,"actualizarCursoEducadora"]);

Route::apiResource('/eventos',EventoController::class);
Route::get("eventos/get/nino",[EventoController::class,"getEventoByNinoId"]);
Route::get("eventos/get/cod_evento",[EventoController::class,"getEventoPorId"]);
Route::put('ninos/{rut_nino}/post/{cod_curso}',[NinosController::class,"actualizarCursoAlumno"]);
Route::apiResource('/ninos',NinosController::class);
Route::apiResource('/curso',CursosController::class)->parameters(['cursos'=>'curso']);
