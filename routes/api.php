<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ArticleController as Articles;
use App\Http\Controllers\PortfolioController as PortfolioController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/article', [Articles::class, 'viewArticle']);
Route::get('/comment', [Articles::class, 'viewComment']);
Route::get('/portfolio', [PortfolioController::class, 'view']);
Route::post('/comment', [Articles::class, 'commentAdd']);
