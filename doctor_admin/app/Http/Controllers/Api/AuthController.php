<?php

namespace App\Http\Controllers\Api;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;
use App\Mail\Partage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash; 
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function index(Request $request)
    {
        try {
            $maladies = DB::table('maladies')
            ->join('maladies_symptomes', 'maladies.id', '=', 'maladies_symptomes.maladies_id')
            ->join('symptomes', 'symptomes.id', '=', 'maladies_symptomes.symptomes_id')
            ->select('maladies.id','nom_maladie','description','image',DB::raw('GROUP_CONCAT(nom_symptome SEPARATOR ", ") as symptomes'))
            ->groupBy('maladies.id','description', 'nom_maladie', 'image')
            ->get();

            return response()->json($maladies);


        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function user($id)
    {
        try {
            $user = User::find($id);
            return response()->json($user);
        } catch (Exception $e) {
            return response()->json(['error' => 'User not found'], 404);
        }
    }
    public function getfiches($idMaladie)
    {
        try { 
            $fiche = DB::table('fiches')
            ->where('maladies_id',$idMaladie)
            ->first();
            return response()->json($fiche);
        } catch (Exception $e) {
            return response()->json(['error' => 'fiche not found'], 404);
        }
    }
    public function mail()
    {
        try {
           Mail::to('codingp952@gmail.com')->send(new Partage());
        } catch (Exception $e) {
            return response()->json(['error' => 'User not found'], 404);
        }
    }

    public function register(Request $request){
        $validator = Validator::make($request->all(), [
            'nom' =>  'bail|required|between:3,20|alpha',
            'email' => 'bail|required|email|unique:users,email',
            'password' => 'required|min:8',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => false,
            ], 422);
        }else{
            $passuser = $request->password;
            $password =bcrypt($passuser);
            $request->request->add(['password'=> $password]);
            $create = User::create($request->all());
            return response()->json([
                'success' => true,
                'user' => $create
            ]);
        }
 
     }
     public function login(Request $request){
        $input = $request->only('email', 'password');
        $jwt_token = null;
    if ($jwt_token = Auth::attempt($input)) {
        $user = Auth::user();
        return response()->json([
            'success' => true,
            'token' => $jwt_token,
            'user' => $user
        ]);
        } 
        return response()->json([
            'success' => false,
            'message' => 'Invalid Email or Password',],401);
        
    }
}
