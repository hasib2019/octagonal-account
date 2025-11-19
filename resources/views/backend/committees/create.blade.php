@extends('layouts.app')

@section('content')
<form method="post" action="{{ route('committees.store') }}">
    @csrf
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="header-title">{{ _lang('Add Committee Member') }}</h4>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label class="control-label">{{ _lang('Member') }}</label>
                        <select class="form-control select2" name="member_id" required>
                            <option value="">{{ _lang('Select One') }}</option>
                            @foreach($members as $member)
                                <option value="{{ $member->id }}">{{ $member->first_name }} {{ $member->last_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">{{ _lang('Designation') }}</label>
                        <select class="form-control select2" name="designation_id" required>
                            <option value="">{{ _lang('Select One') }}</option>
                            @foreach($designations as $d)
                                <option value="{{ $d->id }}">{{ $d->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">{{ _lang('Submit') }}</button>
                </div>
            </div>
        </div>
    </div>
</form>
@endsection