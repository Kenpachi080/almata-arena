<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePortfoliosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('portfolios', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('categoryID');
            $table->unsignedBigInteger('subcategoryID');
            $table->foreign('categoryID')->references('id')->on('categoryes');
            $table->foreign('subcategoryID')->references('id')->on('sub_categoryes');
            $table->string('name');
            $table->text('avatar');
            $table->text('image');
            $table->text('descriptionClient');
            $table->text('descriptionProject');
            $table->text('tasks');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('portfolios');
    }
}
