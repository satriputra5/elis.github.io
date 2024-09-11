<?php

namespace App\Controllers;

use App\Models\PegawaiModel;
use App\Models\SkillcertificationModel;

class Pegawai extends BaseController
{

    protected $Pegawaimodel;
    protected $Certificationmodel;

    public function __construct()
    {
        $this->Pegawaimodel = new PegawaiModel();
        $this->Certificationmodel = new SkillcertificationModel();
    }

    public function index(): string
    {

        $jumlahpegawai = $this->Pegawaimodel->countAllResults();
        $jumlahsertif = $this->Certificationmodel->countAllResults();
        $data = user()->username;

        if ($jumlahpegawai == '0') {
            $ppegawaiberlisensi = '0';
        } else {
            $ppegawaiberlisensi = '0';
        }

        $data = [
            'halaman' => 'pegawai',
            'jmlpegawai' => $jumlahpegawai,
            'jmlcertif' => $jumlahsertif,
            'plisensi' => $ppegawaiberlisensi
        ];
        return view('pegawai/index', $data);
    }
}
