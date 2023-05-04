<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        
        Schema::disableForeignKeyConstraints();
        Schema::create('maladies_symptomes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('maladies_id');
            $table->unsignedBigInteger('symptomes_id');
            $table->timestamps();
            $table->foreign('maladies_id')->references('id')->on('maladies')->onDelete('cascade');
            $table->foreign('symptomes_id')->references('id')->on('symptomes')->onDelete('cascade');
       
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('maladies_symptomes');
    }
};
