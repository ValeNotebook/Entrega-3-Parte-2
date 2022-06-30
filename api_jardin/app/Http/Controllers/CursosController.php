<?php

namespace App\Http\Controllers;

use App\Models\curso;
use Illuminate\Http\Request;

class CursosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Curso::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $curso = new curso();
        $curso->cod_curso = $request-> cod_curso;
        $curso->nombre_curso = $request -> nombre_curso;
        $curso->grado = $request->grado;
        $curso->descripcion = $request->descripcion;

        if($curso->save()){
            return $curso;

        }else{
            return [];

        }
    }



    /**
     * Display the specified resource.
     *
     * @param  \App\Models\curso  $curso
     * @return \Illuminate\Http\Response
     */
    public function show(curso $curso)
    {
        return $curso;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\curso  $curso
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, curso $curso)
    {

        $curso->cod_curso       = $request->cod_curso;
        $curso->nombre_curso    =$request->nombre_curso;
        $curso->grado           =$request->grado;
        $curso->descripcion     =$request->descripcion;

        $curso->save();
        return $curso;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\curso  $curso
     * @return \Illuminate\Http\Response
     */
    public function destroy(curso $curso)
    {
        $curso->delete();
        return 'ok';
    }
}
