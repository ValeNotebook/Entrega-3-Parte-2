<?php

namespace App\Http\Controllers;

use DB;
use App\Models\educadora;
use Illuminate\Http\Request;

class EducadoraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Educadora::all();
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
     * @param  \App\Models\educadora  $educadora
     * @return \Illuminate\Http\Response
     */
    public function show(educadora $educadora)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\educadora  $educadora
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, educadora $educadora)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\educadora  $educadora
     * @return \Illuminate\Http\Response
     */
    public function destroy(educadora $educadora)
    {
        //
        $educadora->delete();
        return 'ok';
    }
}
