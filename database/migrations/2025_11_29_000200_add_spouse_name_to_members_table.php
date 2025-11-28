<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        if (!Schema::hasColumn('members', 'spouse_name')) {
            Schema::table('members', function (Blueprint $table) {
                $table->string('spouse_name', 100)->nullable()->after('marital_status');
            });
        }
    }

    public function down(): void
    {
        if (Schema::hasColumn('members', 'spouse_name')) {
            Schema::table('members', function (Blueprint $table) {
                $table->dropColumn('spouse_name');
            });
        }
    }
};

