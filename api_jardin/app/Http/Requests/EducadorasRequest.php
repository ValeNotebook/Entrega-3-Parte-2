<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\verificador_rut;

class EducadorasRequest extends FormRequest
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

            'rut_educadora'=>['bail','unique:educadoras,rut_educadora','required','regex:/^(\d{7,8}-[\dkK])$/',new verificador_rut],
            'nombre_tia'=>'required','string','alpha',
            'apellido'=>'required|string'

        ];
    }
    public function messages()
    {
        return [
            'rut_educadora.unique'=>'El Rut Ingresado ya Existe',
            'rut_educadora.required'=>'Debe ingresar un Rut',
            'rut_educadora.regex' => 'Indique el RUT sin puntos, con guión y con dígito verificador',
            'nombre_tia.required'=>'Debe ingresar un Nombre',
            'nombre_tia.string'=>'error de string',
            'nombre_tia.alpha'=>'Solo ingrese letras',
            'apellido.required'=>'Debe ingresar un Apellido',
            'apellido.string'=>'No Se permiten Caracteres'
        ];
    }


}
