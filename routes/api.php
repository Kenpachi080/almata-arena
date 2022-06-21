<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\IndexController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\ItemController;

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


Route::group(['prefix' => 'auth'], function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
});

Route::group(['prefix' => 'auth', 'middleware' => "api_auth"], function () {
    Route::post('/change', [AuthController::class, 'change'])->name('change');
    Route::post('/view', [AuthController::class, 'view'])->name('authview');
});
Route::group(['prefix' => 'review'], function () {
    Route::post('/', [ReviewController::class, 'create'])->middleware('api_auth');
    Route::get('/', [ReviewController::class, 'view']);
});
Route::get('/', [IndexController::class, 'index']);
Route::get('/gallery', [IndexController::class, 'gallery']);

Route::group(['prefix' => 'items'], function () {
    Route::post('/', [ItemController::class, 'view']);
    Route::post('/single', [ItemController::class, 'singleview']);
});
