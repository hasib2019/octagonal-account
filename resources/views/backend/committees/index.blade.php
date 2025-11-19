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