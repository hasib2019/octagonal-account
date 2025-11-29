@extends('layouts.app')

@section('content')
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h4 class="header-title">{{ _lang('Executive Committee') }}</h4>
                <a href="{{ route('committees.create') }}" class="btn btn-primary">{{ _lang('Add Member to Committee') }}</a>
            </div>
            <div class="card-body">
                <div class="card mb-4">
                    <div class="card-header">
                        <span class="panel-title">{{ _lang('Committee Information') }}</span>
                    </div>
                    <div class="card-body">
                        <form method="post" action="{{ route('committees.info.update') }}" class="validate" autocomplete="off">
                            @csrf
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">{{ _lang('Formation Date') }}</label>
                                        <input type="date" class="form-control" name="committee_formation_date" value="{{ get_option('committee_formation_date') }}">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">{{ _lang('Tenure (Years)') }}</label>
                                        <input type="number" min="1" max="10" class="form-control" name="committee_tenure_years" value="{{ get_option('committee_tenure_years') }}">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">{{ _lang('Next Election Date') }}</label>
                                        <input type="date" class="form-control" name="committee_next_election_date" value="{{ get_option('committee_next_election_date') }}">
                                    </div>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" class="btn btn-success btn-xs"><i class="ti-save"></i> {{ _lang('Save') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
                @if(session('success'))
                    <div class="alert alert-success">{{ session('success') }}</div>
                @endif
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>{{ _lang('Member') }}</th>
                                <th>{{ _lang('Designation') }}</th>
                                <th>{{ _lang('Actions') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($committees as $item)
                            <tr>
                                <td>{{ $item->id }}</td>
                                <td>{{ $item->member->first_name }} {{ $item->member->last_name }}</td>
                                <td>{{ $item->designation->name }}</td>
                                <td>
                                    <form method="post" action="{{ route('committees.destroy', $item) }}" class="d-inline">
                                        @csrf
                                        @method('DELETE')
                                        <button class="btn btn-sm btn-danger" onclick="return confirm('Remove?')">{{ _lang('Remove') }}</button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
