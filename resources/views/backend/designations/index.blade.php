@extends('layouts.app')

@section('content')
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h4 class="header-title">{{ _lang('Designations') }}</h4>
                <a href="{{ route('designations.create') }}" class="btn btn-primary">{{ _lang('Add New') }}</a>
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
                                <th>{{ _lang('Name') }}</th>
                                <th>{{ _lang('Used Option') }}</th>
                                <th>{{ _lang('Status') }}</th>
                                <th>{{ _lang('Actions') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($designations as $designation)
                            <tr>
                                <td>{{ $designation->id }}</td>
                                <td>{{ $designation->name }}</td>
                                <td>{{ $designation->used_option }}</td>
                                <td>{{ $designation->status ? _lang('Active') : _lang('Inactive') }}</td>
                                <td>
                                    <a href="{{ route('designations.edit', $designation) }}" class="btn btn-sm btn-info">{{ _lang('Edit') }}</a>
                                    <form method="post" action="{{ route('designations.destroy', $designation) }}" class="d-inline">
                                        @csrf
                                        @method('DELETE')
                                        <button class="btn btn-sm btn-danger" onclick="return confirm('Delete?')">{{ _lang('Delete') }}</button>
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