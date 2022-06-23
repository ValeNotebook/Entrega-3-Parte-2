<?php

namespace App\Http\Controllers;

use App\Models\grado;
use Illuminate\Http\Request;

class GradosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return grado::all();
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
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\grado  $grado
     * @return \Illuminate\Http\Response
     */
    public function show(grado $grado)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\grado  $grado
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, grado $grado)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\grado  $grado
     * @return \Illuminate\Http\Response
     */
    public function destroy(grado $grado)
    {
        //
    }
}
