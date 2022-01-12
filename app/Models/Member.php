<?php

namespace App\Models;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;
/**
 * Class Member
 * @package App\Models
 * @version November 8, 2021, 3:37 pm UTC
 *
 * @property string $full_name
 * @property integer $state_id
 * @property integer $lga_id
 * @property string $photo
 * @property string $email
 * @property string $mobile
 * @property string $address
 * @property string $security_question
 * @property string $security_ans
 * @property string $bvn
 * @property integer $bank_id
 * @property string $account_no
 * @property string $account_name
 * @property boolean $is_verified
 * @property string $dob
 * @property integer $identity_type_id
 * @property string $identity_image
 * @property boolean $is_active
 * @property boolean $is_deleted
 * @property string $referral_code
 * @property string $cur_bal
 * @property string $prev_bal
 * @property integer $user_id
 * @property string $cur_invest_bal
 * @property string $prev_invest_bal
 * @property integer $storagex_bank_id
 * @property string $storagex_acct_no
 * @property boolean $disable_wallet_bal
 */
class Member extends Model
{

    use HasFactory;

    public $table = 'members';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'full_name',
        'state_id',
        'lga_id',
        'photo',
        'email',
        'mobile',
        'address',
        'security_question',
        'security_ans',
        'bvn',
        'bank_id',
        'account_no',
        'account_name',
        'is_verified',
        'dob',
        'identity_type_id',
        'identity_image',
        'is_active',
        'is_deleted',
        'referral_code',
        'cur_bal',
        'prev_bal',
        'user_id',
        'cur_invest_bal',
        'prev_invest_bal',
        'storagex_bank_id',
        'storagex_acct_no',
        'disable_wallet_bal'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'full_name' => 'string',
        'state_id' => 'integer',
        'lga_id' => 'integer',
        'photo' => 'string',
        'email' => 'string',
        'mobile' => 'string',
        'address' => 'string',
        'security_question' => 'string',
        'security_ans' => 'string',
        'bvn' => 'string',
        'bank_id' => 'integer',
        'account_no' => 'string',
        'account_name' => 'string',
        'is_verified' => 'boolean',
        'dob' => 'string',
        'identity_type_id' => 'integer',
        'identity_image' => 'string',
        'is_active' => 'boolean',
        'is_deleted' => 'boolean',
        'referral_code' => 'string',
        'cur_bal' => 'string',
        'prev_bal' => 'string',
        'user_id' => 'integer',
        'cur_invest_bal' => 'string',
        'prev_invest_bal' => 'string',
        'storagex_bank_id' => 'integer',
        'storagex_acct_no' => 'string',
        'disable_wallet_bal' => 'boolean'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'full_name' => 'required|string|max:250',
        'photo' => 'nullable|string|max:255',
        'account_no' => 'nullable|string|max:11',
    ];

    /**
     * The "booted" method of the model.
     *
     * @return void
     */
    protected static function booted()
    {
        static::updating(function ($member) {
          if($member->isDirty('full_name') || $member->isDirty('mobile') ){
            $member->updateUserModel();
          }
          foreach($member->getAttributes() as $key => $value){
            $member->$key = ($value === '')?null:$value;
          }
        });

        static::updated(function ($member) {
          if($member->isDirty('bank_id') || $member->isDirty('account_no')  || $member->isDirty('account_name') ){
            $member->verifyBank();
          }
        });

        static::retrieved(function($member) {
          foreach($member->getAttributes() as $key => $value){
            $member->$key = ($value === null)?'':$value;
          }
      });
    }

    /**
     * update user table
     */

     public function updateUserModel(){
       User::find($this->user_id)->update([
        'full_name' => $this->full_name,
        'phone'     => $this->mobile
       ]);
     }

      /**
     * update user table
     */

    public function verifyBank(){
      //
    }
    /**
     * Get the user associated with the member.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Get the state associated with the member.
     */
    public function state()
    {
        return $this->belongsTo(State::class, 'state_id');
    }

    /**
     * Get the lga associated with the member.
     */
    public function lga()
    {
        return $this->belongsTo(Lga::class, 'lga_id');
    }

    /**
     * Get the identity type associated with the member.
     */
    public function identity_type()
    {
        return $this->belongsTo(IdentityType::class, 'identity_type_id');
    }

     /**
     * Get the bank  associated with the member.
     */
    public function bank()
    {
        return $this->belongsTo(Bank::class, 'bank_id');
    }

     /**
     * Get the card  associated with the member.
     */
    public function debit_card()
    {
        return $this->hasOne(DebitCard::class, 'member_id');
    }

    /**
     * generate referral code
     */
    //return role id by code
    public static function makeReferralCode(){
        $random_string = strtoupper(Str::random(5));
        // after creating, check if string is already used
        while(Member::where('referral_code', $random_string )->exists()){
            $random_string = strtoupper(Str::random(5));
        }
        return $random_string;
      }


      /**
       * grant access
       */
      public static function grantAccess(Member $member,$password,$security_ans=""){
          //$member = Member::find($memberid);
          if(Hash::check($password, $member->user->password) == false){
            return false;
          }

          if($security_ans != "" && ($security_ans != $member->security_ans)){
            return false;
          }
          return true;
      }

      /**
       * charge member wallet
       */
      public function debitWallet($amount){
        return true;
      }

      /**
       * location
       */
      public function location(){
        return "Lagos";
      }
}
