<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\IndexController;

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
Route::get('/title', [IndexController::class, 'title']);
Route::get('/about', [IndexController::class, 'about']);
Route::get('/news', [IndexController::class, 'news']);
Route::get('/review', [IndexController::class, 'review']);
Route::get('/service', [IndexController::class, 'service']);
Route::get('/service/{id}', [IndexController::class, 'singleservice']);
Route::get('/project', [IndexController::class, 'project']);
Route::get('/project/{id}', [IndexController::class, 'singleporject']);
