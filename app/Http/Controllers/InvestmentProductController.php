<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateInvestmentProductRequest;
use App\Http\Requests\UpdateInvestmentProductRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\InvestmentProduct;
use Illuminate\Http\Request;
use Flash;
use Response;

class InvestmentProductController extends AppBaseController
{
    /**
     * Display a listing of the InvestmentProduct.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var InvestmentProduct $investmentProducts */
        $investmentProducts = InvestmentProduct::paginate(10);

        return view('investment_products.index')
            ->with('investmentProducts', $investmentProducts);
    }

    /**
     * Show the form for creating a new InvestmentProduct.
     *
     * @return Response
     */
    public function create()
    {
        return view('investment_products.create');
    }

    /**
     * Store a newly created InvestmentProduct in storage.
     *
     * @param CreateInvestmentProductRequest $request
     *
     * @return Response
     */
    public function store(CreateInvestmentProductRequest $request)
    {
        $input = $request->all();

        /** @var InvestmentProduct $investmentProduct */
        $investmentProduct = InvestmentProduct::create($input);

        if ($request->hasFile('image_file')) {
            $imageName = $investmentProduct->id.'.jpg';//.$request->photo->extension();
            $request->image_file->storeAs('public/images/investments', $imageName);
            $investmentProduct->image_file = $imageName;
            $investmentProduct->save();
        }

        Flash::success('Investment Product saved successfully.');

        return redirect(route('investmentProducts.index'));
    }

    /**
     * Display the specified InvestmentProduct.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var InvestmentProduct $investmentProduct */
        $investmentProduct = InvestmentProduct::find($id);

        if (empty($investmentProduct)) {
            Flash::error('Investment Product not found');

            return redirect(route('investmentProducts.index'));
        }

        return view('investment_products.show')->with('investmentProduct', $investmentProduct);
    }

    /**
     * Show the form for editing the specified InvestmentProduct.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var InvestmentProduct $investmentProduct */
        $investmentProduct = InvestmentProduct::find($id);

        if (empty($investmentProduct)) {
            Flash::error('Investment Product not found');

            return redirect(route('investmentProducts.index'));
        }

        return view('investment_products.edit')->with('investmentProduct', $investmentProduct);
    }

    /**
     * Update the specified InvestmentProduct in storage.
     *
     * @param int $id
     * @param UpdateInvestmentProductRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateInvestmentProductRequest $request)
    {
        /** @var InvestmentProduct $investmentProduct */
        $investmentProduct = InvestmentProduct::find($id);

        if (empty($investmentProduct)) {
            Flash::error('Investment Product not found');

            return redirect(route('investmentProducts.index'));
        }

        $investmentProduct->fill($request->all());

        if ($request->hasFile('image_file')) {
            $imageName = $investmentProduct->id.'.jpg';//.$request->photo->extension();
            $request->image_file->storeAs('public/images/investments', $imageName);
            $investmentProduct->image_file = $imageName;
            //$investmentProduct->save();
        }

        $investmentProduct->save();

        Flash::success('Investment Product updated successfully.');

        return redirect(route('investmentProducts.index'));
    }

    /**
     * Remove the specified InvestmentProduct from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var InvestmentProduct $investmentProduct */
        $investmentProduct = InvestmentProduct::find($id);

        if (empty($investmentProduct)) {
            Flash::error('Investment Product not found');

            return redirect(route('investmentProducts.index'));
        }

        $investmentProduct->delete();

        Flash::success('Investment Product deleted successfully.');

        return redirect(route('investmentProducts.index'));
    }
}
