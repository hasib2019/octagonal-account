<?php

namespace App\Http\Controllers;

use App\Models\Committee;
use App\Models\Designation;
use App\Models\Member;
use Illuminate\Http\Request;

class CommitteeController extends Controller
{
    public function index()
    {
        $committees = Committee::with(['member', 'designation'])->orderBy('designation_id')->get();
        return view('backend.committees.index', compact('committees'));
    }

    public function create()
    {
        $designations = Designation::where('status', 1)->orderBy('name')->get();
        $members = Member::orderBy('first_name')->get();
        return view('backend.committees.create', compact('designations', 'members'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'member_id' => 'required|exists:members,id',
            'designation_id' => 'required|exists:designations,id',
        ]);
        Committee::create($data);
        return redirect()->route('committees.index')->with('success', _lang('Committee member added'));
    }

    public function destroy(Committee $committee)
    {
        $committee->delete();
        return back()->with('success', _lang('Committee member removed'));
    }
}