<?php

namespace App\Http\Controllers;

use App\Models\Portfolios;
use Illuminate\Http\Request;

class PortfolioController extends Controller
{

    public function __construct()
    {
        $this->url = env('APP_URL', 'http://127.0.0.1:8000');
    }

    public function view() {
        $porfolio = Portfolios::all();
        foreach ($porfolio as $value) {
            $value->avatar = $this->url.'/storage/'.$value->avatar;
            $value->image = $this->url.'/storage/'.$value->image;
        }
        return response($porfolio, 200);
    }
}
