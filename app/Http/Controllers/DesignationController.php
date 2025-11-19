<?php

namespace App\Http\Controllers;

use App\Models\Designation;
use Illuminate\Http\Request;

class DesignationController extends Controller
{
    public function index()
    {
        $designations = Designation::orderBy('name')->get();
        return view('backend.designations.index', compact('designations'));
    }

    public function create()
    {
        return view('backend.designations.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:100',
            'used_option' => 'nullable|string|max:100',
            'status' => 'required|in:0,1',
        ]);
        Designation::create($data);
        return redirect()->route('designations.index')->with('success', _lang('Designation created'));
    }

    public function edit(Designation $designation)
    {
        return view('backend.designations.edit', compact('designation'));
    }

    public function update(Request $request, Designation $designation)
    {
        $data = $request->validate([
            'name' => 'required|string|max:100',
            'used_option' => 'nullable|string|max:100',
            'status' => 'required|in:0,1',
        ]);
        $designation->update($data);
        return redirect()->route('designations.index')->with('success', _lang('Designation updated'));
    }

    public function destroy(Designation $designation)
    {
        $designation->delete();
        return back()->with('success', _lang('Designation deleted'));
    }
}