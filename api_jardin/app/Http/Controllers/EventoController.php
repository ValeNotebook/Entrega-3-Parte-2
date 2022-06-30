<?php

namespace App\Http\Controllers;

use App\Models\evento;
use App\Models\educadora;
use App\Models\nino;
use Illuminate\Http\Request;

class EventoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return evento::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        //
        $evento = new evento();
        $evento->nino = $request-> nino;
        $evento->tia = $request->tia;
        $evento->descripcion = $request->descripcion;

        if($evento->save()){
            return $evento;

        }else{
            return [];

        }
    }

    public function getEventoByNinoId(Request $request){
        $input = $request->all();
        $filtro = $input["filtro"];
        $evento = evento::where("nino",$filtro)->get();
        return $evento;
    }

    public function getEventoPorId(Request $request){
        $input = $request->all();
        $filtro = $input["filtro"];
        $evento = evento::where("cod_evento",$filtro)->get();
        return $evento;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\evento  $evento
     * @return \Illuminate\Http\Response
     */
    public function show(evento $evento)
    {
        return $evento;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\evento  $evento
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, evento $evento)
    {
        $evento->cod_evento = $request->cod_evento;
        $evento->nino = $request-> nino;
        $evento->tia = $request->tia;
        $evento->descripcion = $request->descripcion;

        $evento->save();
        return $evento;


    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\evento  $evento
     * @return \Illuminate\Http\Response
     */
    public function destroy(evento $evento)
    {
        //
        $evento->delete();
        return 'ok';
    }
}
