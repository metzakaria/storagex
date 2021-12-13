<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Http\Requests\StockUpItemRequests;

use App\Models\StockupItem;

use Flash;
class StockUpController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $stockup = StockupItem::paginate(20);
        return view('stockup.index')->with('stocks', $stockup);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('stockup.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StockUpItemRequests $request)
    {

        $input = $request->all();

        $stockUpItem = StockupItem::create($input);

        if ($request->hasFile('item_image')) {
            $imageName = $stockUpItem->id.'.jpg';//.$request->photo->extension();
            $request->photo->storeAs('public/images/stock_items', $imageName);
            $stockUpItem->photo = $imageName;
            $stockUpItem->save();
        }

        Flash::success('Stock Item Created successfully.');

        return redirect(route('stockup.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return view('stockup.show');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        return view('stockup.edit');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
