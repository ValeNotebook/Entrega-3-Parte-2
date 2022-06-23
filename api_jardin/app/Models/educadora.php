<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class educadora extends Model
{
    use HasFactory;

    protected $table = 'educadoras';
    protected $primaryKey = 'rut_educadoras';
}
