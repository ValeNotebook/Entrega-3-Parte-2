<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TiasAgregarRequest extends FormRequest
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
            'rut_educadora'=>'required',
            'nombre_tia'=>'required',
            'apellido'=>'required'
        ];
    }

    public function messages()
    {
        return [
            'rut_educadora.required'=>'Debe ingresar un Rut',
            'nombre_tia.required'=>'Debe ingresar un Nombre',
            'apellido.required'=>'Debe ingresar un Apellido'
        ];
    }
}
