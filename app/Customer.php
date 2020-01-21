<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Customer extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    protected $fillable = [
        'user_id',
        'order_id',
        'fullname',
        'contact',
        'email',
        'payment_type',
        'gender',
        'marathon_type',
        'marathon_pickup',
        'tshirtsize',
        'event_id'
    ];
}

