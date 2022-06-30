<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\verificador_rut;

class NinosRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'rut_nino'=>['bail','unique:ninos,rut_nino','required','regex:/^(\d{7,8}-[\dkK])$/',new verificador_rut],
            'nombre_nino'=>'required','string',
            'apellido'=>'required|string',
            'genero'=>'required|size:1'
        ];
    }

    public function messages()
    {
        return [
            'rut_nino.unique'=>'El Rut Ingresado ya Existe',
            'rut_nino.required'=>'Debe ingresar un Rut',
            'rut_nino.regex' => 'Indique el RUT sin puntos, con guión y con dígito verificador',
            'nombre_nino.required'=>'Debe ingresar un Nombre',
            'nombre_nino.string'=>'error de string',
            'apellido.required'=>'Debe ingresar un Apellido',
            'apellido.string'=>'No Se permiten Caracteres',
            'genero.required'=>'Indique F para Femenino o M para Masculino',
            'genero.size'=>'Solo indique F o M'
        ];
    }
}
