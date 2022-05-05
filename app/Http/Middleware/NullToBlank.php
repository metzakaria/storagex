<?php

namespace App\Http\Middleware;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\JsonResponse;
use Closure;

class NullToBlank
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $output = $next($request);
        //print_r($output);
       /* if($output instanceof JsonResponse){
            $outputArray =  json_decode($output, true);
            //$outputArray=array("a"=>"red","b"=>"green");
            print_r($output);die();
            array_walk_recursive($outputArray, function ($item, $key) {
                //$item = $item === null ? '' : $item;
            });
            //return $outputArray;
        }*/
        return $output;
    }
}