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
        //
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
    }
}
