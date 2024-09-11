<?php

namespace App\Models;

use CodeIgniter\Model;

class SkilllogModel extends Model
{
    protected $table            = 'skilllogs';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    // protected $returnType       = 'array';
    // protected $useSoftDeletes   = false;
    protected $allowedFields    = [];

    protected array $casts = [];
    protected array $castHandlers = [];

    // Dates
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    // Callbacks
    protected $allowCallbacks = true;
    protected $afterInsert    = [];
    protected $afterUpdate    = [];
    protected $afterFind      = [];
    protected $afterDelete    = [];
}
