<?php

namespace App\Http\Controllers;

use App\Models\Categoryes;
use App\Models\Portfolios;
use App\Models\SubCategoryes;
use Illuminate\Http\Request;
use phpDocumentor\Reflection\Types\Object_;

class PortfolioController extends Controller
{

    public function __construct()
    {
        $this->url = env('APP_URL', 'http://127.0.0.1:8000');
    }

    public function view()
    {
        $porfolio = Portfolios::all();
        foreach ($porfolio as $value) {
            $value->avatar = $this->url . '/storage/' . $value->avatar;
            $value->image = $this->url . '/storage/' . $value->image;
        }
        return response($porfolio, 200);
    }

    public function categoryes()
    {
        $categoryes = Categoryes::all();
        foreach ($categoryes as $value) {
            $subcategoryes = SubCategoryes::where('categoryID', '=', $value->id)->get();
            $value->subcategory = $subcategoryes;
        }
        return response($categoryes, 200);
    }
}
