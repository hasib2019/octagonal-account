<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Committee extends Model
{
    use HasFactory;

    protected $fillable = ['member_id', 'designation_id'];

    public function member()
    {
        return $this->belongsTo(Member::class);
    }

    public function designation()
    {
        return $this->belongsTo(Designation::class);
    }
}