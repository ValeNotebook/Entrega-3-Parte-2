<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class verificador_rut implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $dv = strtoupper(substr($value,strlen($value)-1));
        $rut = substr($value,0,strlen($value)-2);

        $factor = 2;
        $suma = 0;
        for($i=strlen($rut)-1;$i>=0;$i--){
            $suma += $rut[$i] * $factor++;
            if($factor>7){
                $factor = 2;
            }
        }
        $dvCalc = 11-$suma%11;
        $dvCalc = $dvCalc==11?0:($dvCalc==10?'K':$dvCalc);

        return $dv==$dvCalc;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Rut no valido';
    }
}
