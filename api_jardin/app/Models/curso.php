<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class curso extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'cursos';
    protected $primaryKey = 'cod_curso';
    public $incrementing = false;
    public $timestamps = false;
    protected $keyType = 'string';
}

