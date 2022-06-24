<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEducadorasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('educadoras', function (Blueprint $table) {
            $table->string('rut_educadora',10)->primary();
            $table->string('nombre_tia',20);
            $table->string('apellido',20);
            $table->softDeletes();

            //$table->string('fecha_nacimiento');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('educadoras');
    }
}
