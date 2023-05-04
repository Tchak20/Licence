<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Symptomes extends Model
{
    use HasFactory;
    protected $fillable = ['nom_symptome', 'description'];
    public function maladies()
    {
        return $this->belongsToMany(Maladies::class)->withTimestamps();
    }
}

