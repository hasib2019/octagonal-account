<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('members', function (Blueprint $table) {
            if (!Schema::hasColumn('members', 'first_name_bn')) {
                $table->string('first_name_bn', 100)->nullable()->after('last_name');
            }
            if (!Schema::hasColumn('members', 'last_name_bn')) {
                $table->string('last_name_bn', 100)->nullable()->after('first_name_bn');
            }

            if (!Schema::hasColumn('members', 'father_name')) {
                $table->string('father_name', 100)->nullable()->after('last_name_bn');
            }
            if (!Schema::hasColumn('members', 'mother_name')) {
                $table->string('mother_name', 100)->nullable()->after('father_name');
            }

            if (!Schema::hasColumn('members', 'nid_number')) {
                $table->string('nid_number', 20)->nullable()->unique()->after('mother_name');
            }
            if (!Schema::hasColumn('members', 'birth_date')) {
                $table->date('birth_date')->nullable()->after('nid_number');
            }
            if (!Schema::hasColumn('members', 'religion')) {
                $table->string('religion', 50)->nullable()->after('birth_date');
            }
            if (!Schema::hasColumn('members', 'marital_status')) {
                $table->enum('marital_status', ['single', 'married', 'divorced', 'widowed'])->nullable()->after('religion');
            }
            if (!Schema::hasColumn('members', 'profession')) {
                $table->string('profession', 100)->nullable()->after('marital_status');
            }
            if (!Schema::hasColumn('members', 'education')) {
                $table->string('education', 100)->nullable()->after('profession');
            }
            if (!Schema::hasColumn('members', 'monthly_income')) {
                $table->decimal('monthly_income', 10, 2)->nullable()->after('education');
            }

            if (!Schema::hasColumn('members', 'permanent_address')) {
                $table->text('permanent_address')->nullable()->after('address');
            }

            if (!Schema::hasColumn('members', 'nominee_name')) {
                $table->string('nominee_name', 100)->nullable()->after('permanent_address');
            }
            if (!Schema::hasColumn('members', 'nominee_relation')) {
                $table->string('nominee_relation', 50)->nullable()->after('nominee_name');
            }
            if (!Schema::hasColumn('members', 'nominee_nid')) {
                $table->string('nominee_nid', 20)->nullable()->after('nominee_relation');
            }
            if (!Schema::hasColumn('members', 'nominee_address')) {
                $table->text('nominee_address')->nullable()->after('nominee_nid');
            }

            if (!Schema::hasColumn('members', 'shares_count')) {
                $table->integer('shares_count')->default(2)->after('nominee_address');
            }
            if (!Schema::hasColumn('members', 'reference_member_code')) {
                $table->string('reference_member_code', 50)->nullable()->after('shares_count');
            }
            if (!Schema::hasColumn('members', 'nid_image')) {
                $table->string('nid_image', 191)->nullable()->after('photo');
            }
            if (!Schema::hasColumn('members', 'status')) {
                $table->tinyInteger('status')->default(0)->comment('0=Pending, 1=Active, 2=Inactive')->after('nid_image');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('members', function (Blueprint $table) {
            $table->dropColumn([
                'first_name_bn', 'last_name_bn', 'father_name', 'mother_name',
                'nid_number', 'birth_date', 'religion', 'marital_status',
                'profession', 'education', 'monthly_income', 'permanent_address',
                'nominee_name', 'nominee_relation', 'nominee_nid', 'nominee_address',
                'shares_count', 'reference_member_code', 'nid_image', 'status'
            ]);
        });
    }
};
