<?php

namespace App\Models;

use CodeIgniter\Model;
use DateTime;

class SkillcertificationModel extends Model
{
    protected $table          = 'skill_certification';
    protected $primaryKey     = 'id';
    protected $useSoftDeletes = true;
    protected $allowedFields  = ['id', 'code', 'name_skill', 'id_type', 'id_section', 'status', 'status_message', 'active', 'created_at', 'updated_at', 'username'];
    protected $useTimestamps   = true;
}
