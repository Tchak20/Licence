<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Maladies extends Model
{
    use HasFactory;
    protected $fillable = ['nom_maladie', 'image', 'description'];
    public function symptomes()
    {
        return $this->belongsToMany(Symptomes::class)->withTimestamps();
    }

    public function fiches()
    {
    return $this->belongsTo(Fiche::class);
    }
}
