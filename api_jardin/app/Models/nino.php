<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class nino extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'ninos';
    protected $primaryKey = 'rut_nino';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;
}
