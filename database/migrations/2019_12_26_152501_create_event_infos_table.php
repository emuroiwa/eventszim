<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventInfosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_infos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('event_id')->nullable();
            $table->string('discounts')->nullable();
            $table->string('ticket_collection')->nullable();
            $table->string('refund_cancel')->nullable();
            $table->string('exchange_upgrade')->nullable();
            $table->string('duration')->nullable();
            $table->string('gps')->nullable();
            $table->longText('event_details')->nullable();
            $table->string('search_query')->nullable();
            $table->string('event_img')->nullable();
            $table->string('youtube')->nullable();
            $table->string('instagram')->nullable();
            $table->string('twitter')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_infos');
    }
}
