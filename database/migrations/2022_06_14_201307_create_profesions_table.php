<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfesionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('profesions', function (Blueprint $table) {
            $table->id();
            $table->text('title');
            $table->text('image1');
            $table->text('title1');
            $table->text('content1');
            $table->text('image2');
            $table->text('title2');
            $table->text('content2');
            $table->text('image3');
            $table->text('title3');
            $table->text('content3');
            $table->text('image4');
            $table->text('title4');
            $table->text('content4');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('profesions');
    }
}
