<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateInvestmentAuctionRequest;
use App\Http\Requests\UpdateInvestmentAuctionRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\InvestmentAuction;
use Illuminate\Http\Request;
use Flash;
use Response;

class InvestmentAuctionController extends AppBaseController
{
    /**
     * Display a listing of the InvestmentAuction.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var InvestmentAuction $investmentAuctions */
        $investmentAuctions = InvestmentAuction::paginate(10);

        return view('investment_auctions.index')
            ->with('investmentAuctions', $investmentAuctions);
    }

    /**
     * Show the form for creating a new InvestmentAuction.
     *
     * @return Response
     */
    public function create()
    {
        return view('investment_auctions.create');
    }

    /**
     * Store a newly created InvestmentAuction in storage.
     *
     * @param CreateInvestmentAuctionRequest $request
     *
     * @return Response
     */
    public function store(CreateInvestmentAuctionRequest $request)
    {
        $input = $request->all();

        /** @var InvestmentAuction $investmentAuction */
        $investmentAuction = InvestmentAuction::create($input);

        Flash::success('Investment Auction saved successfully.');

        return redirect(route('investmentAuctions.index'));
    }

    /**
     * Display the specified InvestmentAuction.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var InvestmentAuction $investmentAuction */
        $investmentAuction = InvestmentAuction::find($id);

        if (empty($investmentAuction)) {
            Flash::error('Investment Auction not found');

            return redirect(route('investmentAuctions.index'));
        }

        return view('investment_auctions.show')->with('investmentAuction', $investmentAuction);
    }

    /**
     * Show the form for editing the specified InvestmentAuction.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var InvestmentAuction $investmentAuction */
        $investmentAuction = InvestmentAuction::find($id);

        if (empty($investmentAuction)) {
            Flash::error('Investment Auction not found');

            return redirect(route('investmentAuctions.index'));
        }

        return view('investment_auctions.edit')->with('investmentAuction', $investmentAuction);
    }

    /**
     * Update the specified InvestmentAuction in storage.
     *
     * @param int $id
     * @param UpdateInvestmentAuctionRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateInvestmentAuctionRequest $request)
    {
        /** @var InvestmentAuction $investmentAuction */
        $investmentAuction = InvestmentAuction::find($id);

        if (empty($investmentAuction)) {
            Flash::error('Investment Auction not found');

            return redirect(route('investmentAuctions.index'));
        }

        $investmentAuction->fill($request->all());
        $investmentAuction->save();

        Flash::success('Investment Auction updated successfully.');

        return redirect(route('investmentAuctions.index'));
    }

    /**
     * Remove the specified InvestmentAuction from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var InvestmentAuction $investmentAuction */
        $investmentAuction = InvestmentAuction::find($id);

        if (empty($investmentAuction)) {
            Flash::error('Investment Auction not found');

            return redirect(route('investmentAuctions.index'));
        }

        $investmentAuction->delete();

        Flash::success('Investment Auction deleted successfully.');

        return redirect(route('investmentAuctions.index'));
    }
}
