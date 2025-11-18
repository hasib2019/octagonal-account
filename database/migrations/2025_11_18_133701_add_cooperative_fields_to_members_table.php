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
            // Bengali name fields
            $table->string('first_name_bn', 100)->nullable()->after('last_name');
            $table->string('last_name_bn', 100)->nullable()->after('first_name_bn');
            
            // Family information
            $table->string('father_name', 100)->nullable()->after('last_name_bn');
            $table->string('mother_name', 100)->nullable()->after('father_name');
            
            // Personal information
            $table->string('nid_number', 20)->nullable()->unique()->after('mother_name');
            $table->date('birth_date')->nullable()->after('nid_number');
            $table->string('religion', 50)->nullable()->after('birth_date');
            $table->enum('marital_status', ['single', 'married', 'divorced', 'widowed'])->nullable()->after('religion');
            $table->string('profession', 100)->nullable()->after('marital_status');
            $table->string('education', 100)->nullable()->after('profession');
            $table->decimal('monthly_income', 10, 2)->nullable()->after('education');
            
            // Address fields
            $table->text('permanent_address')->nullable()->after('address');
            
            // Nominee information
            $table->string('nominee_name', 100)->nullable()->after('permanent_address');
            $table->string('nominee_relation', 50)->nullable()->after('nominee_name');
            $table->string('nominee_nid', 20)->nullable()->after('nominee_relation');
            $table->text('nominee_address')->nullable()->after('nominee_nid');
            
            // Cooperative specific fields
            $table->integer('shares_count')->default(2)->after('nominee_address');
            $table->string('reference_member_code', 50)->nullable()->after('shares_count');
            $table->string('nid_image', 191)->nullable()->after('photo');
            $table->tinyInteger('status')->default(0)->comment('0=Pending, 1=Active, 2=Inactive')->after('nid_image');
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
