<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCursosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cursos', function (Blueprint $table) {
            $table->string('cod_curso',20)->primary();
            $table->unsignedBigInteger('grado');
            $table->string('nino');
            $table->string('tia');
            $table->string('nombre_grado');
            $table->string('descripcion');
            //FK

            $table->foreign('tia')->references('rut_educadora')->on('educadoras');
            $table->foreign('nino')->references('rut_nino')->on('ninos');
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cursos');
    }
}
