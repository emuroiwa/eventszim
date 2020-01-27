<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\ZimEvents;

class EventsTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    use RefreshDatabase; 
    public function testExample()
    {
        $this->withoutExceptionHandling();
        $response = $this->get('api/events');

        
        $response->assertOk();
       // $this->assertCount(7,ZimEvents::all());
    }
}
