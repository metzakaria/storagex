<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateBankAPIRequest;
use App\Http\Requests\API\UpdateBankAPIRequest;
use App\Models\Bank;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;
use Response;

/**
 * Class BankController
 * @package App\Http\Controllers\API
 */

class BankAPIController extends AppBaseController
{
    /**
     * Display a listing of the Bank.
     * GET|HEAD /banks
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $query = Bank::query();

        if ($request->get('skip')) {
            $query->skip($request->get('skip'));
        }
        if ($request->get('limit')) {
            $query->limit($request->get('limit'));
        }

        $banks = $query->get();

        return $this->sendResponse($banks->toArray(), 'Banks retrieved successfully');
    }

    /**
     * Store a newly created Bank in storage.
     * POST /banks
     *
     * @param CreateBankAPIRequest $request
     *
     * @return Response
     */
    public function store(CreateBankAPIRequest $request)
    {
        $input = $request->all();

        /** @var Bank $bank */
        $bank = Bank::create($input);

        return $this->sendResponse($bank->toArray(), 'Bank saved successfully');
    }

    /**
     * Display the specified Bank.
     * GET|HEAD /banks/{id}
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var Bank $bank */
        $bank = Bank::find($id);

        if (empty($bank)) {
            return $this->sendError('Bank not found');
        }

        return $this->sendResponse($bank->toArray(), 'Bank retrieved successfully');
    }

    /**
     * Update the specified Bank in storage.
     * PUT/PATCH /banks/{id}
     *
     * @param int $id
     * @param UpdateBankAPIRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateBankAPIRequest $request)
    {
        /** @var Bank $bank */
        $bank = Bank::find($id);

        if (empty($bank)) {
            return $this->sendError('Bank not found');
        }

        $bank->fill($request->all());
        $bank->save();

        return $this->sendResponse($bank->toArray(), 'Bank updated successfully');
    }

    /**
     * Remove the specified Bank from storage.
     * DELETE /banks/{id}
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var Bank $bank */
        $bank = Bank::find($id);

        if (empty($bank)) {
            return $this->sendError('Bank not found');
        }

        $bank->delete();

        return $this->sendSuccess('Bank deleted successfully');
    }
}
