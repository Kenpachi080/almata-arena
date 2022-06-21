<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateColorItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('color_items', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('item');
            $table->foreign('item')->references('id')->on('items')->onDelete('cascade');
            $table->string('name');
            $table->text('image');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('color_items');
    }
}
