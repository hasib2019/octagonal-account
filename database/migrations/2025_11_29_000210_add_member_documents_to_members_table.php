<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('members', function (Blueprint $table) {
            if (!Schema::hasColumn('members', 'signature_image')) {
                $table->string('signature_image', 191)->nullable()->after('nid_image');
            }
            if (!Schema::hasColumn('members', 'address_certificate_image')) {
                $table->string('address_certificate_image', 191)->nullable()->after('signature_image');
            }
        });
    }

    public function down(): void
    {
        Schema::table('members', function (Blueprint $table) {
            if (Schema::hasColumn('members', 'signature_image')) {
                $table->dropColumn('signature_image');
            }
            if (Schema::hasColumn('members', 'address_certificate_image')) {
                $table->dropColumn('address_certificate_image');
            }
        });
    }
};

