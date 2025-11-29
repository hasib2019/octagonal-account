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

    public function infoUpdate(Request $request)
    {
        $data = $request->validate([
            'committee_formation_date' => 'nullable|date',
            'committee_tenure_years' => 'nullable|integer|min:1|max:10',
            'committee_next_election_date' => 'nullable|date',
        ]);

        if (isset($data['committee_formation_date'])) {
            update_option('committee_formation_date', $data['committee_formation_date']);
        }
        if (isset($data['committee_tenure_years'])) {
            update_option('committee_tenure_years', $data['committee_tenure_years']);
        }
        if (isset($data['committee_next_election_date'])) {
            update_option('committee_next_election_date', $data['committee_next_election_date']);
        }

        $message = _lang('Committee information updated successfully');
        if (!$request->ajax()) {
            return redirect()->route('committees.index')->with('success', $message);
        }
        return response()->json(['result' => 'success', 'action' => 'update', 'message' => $message]);
    }
}
