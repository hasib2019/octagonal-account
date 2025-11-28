<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\Member;
use App\Models\SavingsProduct;
use App\Models\SavingsAccount;
use App\Models\Transaction;
use App\Models\User;

class FrontendController extends Controller
{
    public function landing()
    {
        return view('welcome');
    }

    public function showRegistration()
    {
        return view('registration');
    }

    public function executive()
    {
        $designations = \App\Models\Designation::with(['committees.member'])
            ->where('status', 1)
            ->orderBy('name')
            ->get();
        return view('executive', compact('designations'));
    }

    public function openAccount(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'nullable|email|unique:members|max:191',
            'country_code' => 'required_with:mobile',
            'photo' => 'nullable|image',
            'permanent_address' => 'nullable|string',
            'nid_image' => 'nullable|image',
            'savings_product_id' => 'nullable|exists:savings_products,id',
        ]);

        if ($validator->fails()) {
            return redirect(url('/#create-account'))
                ->withErrors($validator)
                ->withInput();
        }

        $photo = 'default.png';
        if ($request->hasFile('photo')) {
            $file = $request->file('photo');
            $photo = time() . $file->getClientOriginalName();
            $file->move(public_path() . "/uploads/profile/", $photo);
        }

        $nid_image = null;
        $profilDir = public_path() . "/uploads/profile/";
        if (!is_dir($profilDir)) {
            @mkdir($profilDir, 0775, true);
        }
        if ($request->hasFile('nid_image')) {
            $file = $request->file('nid_image');
            $nid_image = time() . $file->getClientOriginalName();
            $file->move($profilDir, $nid_image);
        }

        DB::beginTransaction();

        $member = new Member();
        $member->first_name = $request->input('first_name');
        $member->last_name = $request->input('last_name');
        $member->branch_id = $request->input('branch_id');
        $member->email = $request->input('email');
        $member->country_code = $request->input('country_code');
        $member->mobile = $request->input('mobile');
        $member->business_name = $request->input('business_name');
        $member->member_no = 'M' . now()->format('YmdHis');
        $member->gender = $request->input('gender');
        $member->city = $request->input('city');
        $member->state = $request->input('state');
        $member->zip = $request->input('zip');
        $member->address = $request->input('address');
        $member->permanent_address = $request->input('permanent_address');
        $member->credit_source = $request->input('credit_source');
        $member->photo = $photo;
        $member->nid_image = $nid_image;
        $member->status = 0;
        $member->save();

        if ($request->filled('savings_product_id')) {
            $last = DB::table('savings_accounts')->orderByDesc('id')->value('account_number');
            $nextNumeric = is_numeric($last) ? (int) $last + 1 : (DB::table('savings_accounts')->count() + 1);
            $generatedAccount = str_pad($nextNumeric, 7, '0', STR_PAD_LEFT);

            $savingsaccount = new SavingsAccount();
            $savingsaccount->account_number = $generatedAccount;
            $savingsaccount->member_id = $member->id;
            $savingsaccount->savings_product_id = $request->input('savings_product_id');
            $savingsaccount->status = 0;
            $savingsaccount->opening_balance = 0;
            $savingsaccount->description = $request->input('description');
            $savingsaccount->save();
        }

        DB::commit();

        return redirect(url('/#create-account'))
            ->with('success', _lang('Your request has been submitted. We will contact you soon.'))
            ->withInput([]);
    }

    public function submitRegistration(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
            'first_name_bn' => 'required',
            'last_name_bn' => 'required',
            'father_name' => 'required',
            'mother_name' => 'required',
            'nid_number' => 'required|unique:members,nid_number',
            'birth_date' => 'required|date',
            'gender' => 'required|in:male,female',
            'religion' => 'required',
            'marital_status' => 'required|in:single,married,divorced,widowed',
            'spouse_name' => 'nullable|required_if:marital_status,married|string|max:100',
            'profession' => 'required',
            'education' => 'required',
            'monthly_income' => 'required|numeric',
            'mobile' => 'required',
            'email' => 'nullable|email|unique:members',
            'permanent_address' => 'required',
            'present_address' => 'nullable',
            'nominee_name' => 'required',
            'nominee_relation' => 'required',
            'nominee_nid' => 'required',
            'nominee_address' => 'required',
            'shares_count' => 'required|integer|min:2',
            'reference_member_code' => 'nullable',
            'credit_source' => 'nullable',
            'photo' => 'nullable|image',
            'nid_image' => 'nullable|image',
            'signature_image' => 'nullable|image',
            'address_certificate_image' => 'nullable|image',
            'password' => 'nullable|min:6',
            'savings_product_id' => 'nullable|exists:savings_products,id',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $profilDir = public_path() . "/uploads/profile/";
        $photo = 'default.png';
        if ($request->hasFile('photo')) {
            $file = $request->file('photo');
            $photo = time() . $file->getClientOriginalName();
            $file->move($profilDir, $photo);
        }
    
        $nid_image = null;
        if ($request->hasFile('nid_image')) {
            $file = $request->file('nid_image');
            $nid_image = time() . $file->getClientOriginalName();
            $file->move($profilDir, $nid_image);
        }

        $signature_image = null;
        if ($request->hasFile('signature_image')) {
            $file = $request->file('signature_image');
            $signature_image = time() . $file->getClientOriginalName();
            $file->move($profilDir, $signature_image);
        }

        $address_certificate_image = null;
        if ($request->hasFile('address_certificate_image')) {
            $file = $request->file('address_certificate_image');
            $address_certificate_image = time() . $file->getClientOriginalName();
            $file->move($profilDir, $address_certificate_image);
        }

        DB::beginTransaction();

        $member = new Member();
        $member->first_name = $request->input('first_name');
        $member->last_name = $request->input('last_name');
        $member->first_name_bn = $request->input('first_name_bn');
        $member->last_name_bn = $request->input('last_name_bn');
        $member->father_name = $request->input('father_name');
        $member->mother_name = $request->input('mother_name');
        $member->nid_number = $request->input('nid_number');
        $member->birth_date = $request->input('birth_date');
        $member->religion = $request->input('religion');
        $member->marital_status = $request->input('marital_status');
        $member->spouse_name = $request->input('spouse_name');
        $member->profession = $request->input('profession');
        $member->education = $request->input('education');
        $member->monthly_income = $request->input('monthly_income');
        $member->branch_id = $request->input('branch_id');
        $member->email = $request->input('email');
        $member->country_code = $request->input('country_code');
        $member->mobile = $request->input('mobile');
        $member->business_name = $request->input('business_name');
        $member->member_no = 'M' . now()->format('YmdHis');
        $member->gender = $request->input('gender');
        $member->city = $request->input('city');
        $member->state = $request->input('state');
        $member->zip = $request->input('zip');
        $member->address = $request->input('present_address') ?: $request->input('permanent_address');
        $member->permanent_address = $request->input('permanent_address');
        $member->nominee_name = $request->input('nominee_name');
        $member->nominee_relation = $request->input('nominee_relation');
        $member->nominee_nid = $request->input('nominee_nid');
        $member->nominee_address = $request->input('nominee_address');
        $member->shares_count = $request->input('shares_count');
        $member->reference_member_code = $request->input('reference_member_code');
        $member->credit_source = $request->input('credit_source');
        $member->photo = $photo;
        $member->nid_image = $nid_image;
        $member->signature_image = $signature_image;
        $member->address_certificate_image = $address_certificate_image;
        $member->nid = $request->input('nid_number');
        $member->status = 0;
        $member->save();

        if ($request->filled('password')) {
            $user = new User();
            $user->name = $member->first_name . ' ' . $member->last_name;
            $user->email = $member->email ?: ('member' . $member->id . '@example.com');
            $user->password = Hash::make($request->input('password'));
            $user->user_type = 'customer';
            $user->status = 1;
            $user->profile_picture = $photo;
            $user->save();
            $member->user_id = $user->id;
            $member->save();
        }

        if ($request->filled('savings_product_id')) {
            $last = DB::table('savings_accounts')->orderByDesc('id')->value('account_number');
            $nextNumeric = is_numeric($last) ? (int) $last + 1 : (DB::table('savings_accounts')->count() + 1);
            $generatedAccount = str_pad($nextNumeric, 7, '0', STR_PAD_LEFT);

            $savingsaccount = new SavingsAccount();
            $savingsaccount->account_number = $generatedAccount;
            $savingsaccount->member_id = $member->id;
            $savingsaccount->savings_product_id = $request->input('savings_product_id');
            $savingsaccount->status = 0;
            $savingsaccount->opening_balance = 0;
            $savingsaccount->description = $request->input('description');
            $savingsaccount->created_user_id = auth()->id();
            $savingsaccount->save();
        }

        DB::commit();

        if (!$request->ajax()) {
            return back()->with('success', _lang('Registration submitted successfully. We will contact you soon.'));
        } else {
            return response()->json(['result' => 'success', 'action' => 'store', 'message' => _lang('Registration submitted successfully. We will contact you soon.')]);
        }
    }
}
