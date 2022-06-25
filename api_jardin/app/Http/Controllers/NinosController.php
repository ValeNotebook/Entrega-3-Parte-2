<?php

namespace App\Http\Controllers;

use App\Models\nino;
use Illuminate\Http\Request;

class NinosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return nino::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $nino = new nino();
        $nino->rut_nino = $request-> rut_nino;
        $nino->nombre_nino = $request->nombre_nino;
        $nino->apellido = $request->apellido;
        $nino->genero = $request->genero;
        if($nino->save()){
            return $nino;

        }else{
            return [];

        }


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\nino  $nino
     * @return \Illuminate\Http\Response
     */
    public function show(nino $nino)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\nino  $nino
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, nino $nino)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\nino  $nino
     * @return \Illuminate\Http\Response
     */
    public function destroy(nino $nino)
    {
        //
        $nino->delete();
        return 'ok';

    }
}
