<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Fiche extends Model
{
    use HasFactory;
    protected $fillable = ['maladies_id', 'traitements', 'prevention', 'autres'];
    public function maladies()
    {
    return $this->belongsTo(Maladie::class);
    }
}
