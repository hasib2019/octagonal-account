<div class="container py-3">
    <div class="d-flex justify-content-between align-items-center mb-5">
        <h1 class="mb-0">Committee <span class="text-uppercase text-primary bg-light px-2">Members</span>
            ( কমিটির <span class="text-uppercase text-primary bg-light px-2">সদস্য</span> )
        </h1>
        <a href="/executive" class="btn btn-primary">Executive Members ( কার্যনির্বাহী সদস্য )</a>
    </div>
    @php($committees = \App\Models\Committee::with(['member','designation'])->orderBy('designation_id')->get())
    <div class="row g-4">
        @foreach($committees as $index => $cm)
        @php($member = $cm->member)
        @php($designation = $cm->designation)
        <div class="col-md-6 col-lg-2 wow fadeIn" data-wow-delay="{{ number_format(0.1 + ($index % 6)*0.2, 1) }}s">
            <div class="team-item position-relative overflow-hidden">
                <img class="img-fluid w-100" src="{{ isset($member->photo) ? asset('uploads/profile/'.$member->photo) : asset('assets/img/user.jpg') }}" alt="{{ $member->first_name }} {{ $member->last_name }}">
                <div class="team-overlay">
                    <small class="d-block mb-1">{{ $member->first_name_bn ?? ($member->first_name.' '.$member->last_name) }}</small>
                    <small class="d-block mb-1">{{ $designation->name }}</small>
                    <div class="d-flex justify-content-center">
                        @if(isset($member->facebook))
                        <a class="btn btn-outline-primary btn-sm-square border-2 me-2" href="{{ $member->facebook }}" target="_blank">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        @endif
                        @if(isset($member->linkedin))
                        <a class="btn btn-outline-primary btn-sm-square border-2 me-2" href="{{ $member->linkedin }}" target="_blank">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
