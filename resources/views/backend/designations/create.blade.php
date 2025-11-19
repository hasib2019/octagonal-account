@extends('layouts.app')

@section('content')
<form method="post" action="{{ route('designations.store') }}">
    @csrf
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="header-title">{{ _lang('Add Designation') }}</h4>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label class="control-label">{{ _lang('Name') }}</label>
                        <input type="text" class="form-control" name="name" value="{{ old('name') }}" required>
                    </div>
                    <div class="form-group">
                        <label class="control-label">{{ _lang('Used Option') }}</label>
                        <input type="text" class="form-control" name="used_option" value="{{ old('used_option') }}">
                    </div>
                    <div class="form-group">
                        <label class="control-label">{{ _lang('Status') }}</label>
                        <select class="form-control" name="status">
                            <option value="1">{{ _lang('Active') }}</option>
                            <option value="0">{{ _lang('Inactive') }}</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">{{ _lang('Submit') }}</button>
                </div>
            </div>
        </div>
    </div>
</form>
@endsection