<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
	return View::make('hello');
});

Route::get('/env', function()
{
  return App::environment();
});

Route::get('/xdebug', function()
{
  var_dump(['foo' => 'bar']);
});

Route::get('/phpinfo', function()
{
  phpinfo();
});

Route::get('/postgres', function()
{
  Schema::dropIfExists('users');

  Schema::create('users', function ($t) {
    $t->increments('id');
    $t->string('name');
  });

  DB::table('users')->insert(['name' => 'Wayne']);

  return DB::table('users')->get();
});

Route::get('/redis', function()
{
  return Cache::remember('test', 5, function () {
    return Carbon\Carbon::now();
  });
});
