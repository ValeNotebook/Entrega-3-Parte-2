<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('eventos', function (Blueprint $table) {
            $table->bigIncrements('cod_evento');
            $table->string('nino');

            $table->string('tia');
            //$table->unsignedBigInteger('grado');
            $table->string('descripcion');
            $table->softDeletes();


           // $table->foreign('grado')->references('id_grado')->on('grados');
            $table->foreign('tia')->references('rut_educadora')->on('educadoras');
            $table->foreign('nino')->references('rut_nino')->on('ninos');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('eventos');
    }
}
