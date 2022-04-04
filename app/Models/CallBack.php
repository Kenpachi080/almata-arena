<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CallBack extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $fillable = ['name', 'contacts', 'task'];
}
