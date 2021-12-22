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
            $filenameWithExt = $request->file('item_image')->getClientOriginalName();
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extension = $request->file('item_image')->getClientOriginalExtension();
            $fileNameToStore = $filename.'_'.time().'.'.$extension;
            $path = $request->file('item_image')->storeAs('public/images/stock_items',$fileNameToStore);
            $stockUpItem->item_image = $fileNameToStore ;
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
        $stockItem = StockupItem::where('id', $id)->first();
        return view('stockup.show')->with('stockitem', $stockItem);
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
        $stockItem = StockupItem::where('id', $id)->first();

        if(empty($stockItem)){

            Flash::error('Stock Item not found');

            return redirect(route('stockup.index'));

        }

        return view('stockup.edit')->with('stockitem', $stockItem);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StockUpItemRequests $request, $id)
    {
        //
        $stockItem = StockupItem::find($id);

        if(empty($stockItem)){
            Flash::error('Stock Item not found');

            return redirect(route('stockup.index'));
        }

        $stockItem->fill($request->all());
        $stockItem->save();

        Flash::success('Stock Item Updated successfully.');

        return redirect(route('stockup.index'));


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
        $stockItem = StockupItem::find($id);
        if(empty($stockItem)){
            Flash::error('Stock Item not found');

            return redirect(route('stockup.index'));
        }

        $stockItem->delete();

        Flash::success('Stock Item Deleted successfully.');

        return redirect(route('stockup.index'));

    }
}
