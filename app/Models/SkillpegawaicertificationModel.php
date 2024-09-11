<?php

namespace App\Models;

use CodeIgniter\Model;
use DateTime;

class SkillpegawaicertificationModel extends Model
{
    protected $table          = 'skill_pegawai_certification';
    protected $primaryKey     = 'id';
    protected $allowedFields  = ['id', 'code', 'id_pegawai', 'id_certif', 'first_date_certif', 'last_date_certif', 'created_at', 'updated_at', 'username'];
    protected $useTimestamps   = true;
}
