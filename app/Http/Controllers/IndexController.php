<?php

namespace App\Http\Controllers;


use App\Models\Company;
use App\Models\Gallery;
use App\Models\Job;
use App\Models\Main;
use App\Models\News;
use App\Models\Profesion;
use App\Models\Project;
use App\Models\Recomendation;
use App\Models\Title;
use App\Models\Trist;

class IndexController extends Controller
{
    /**
     * @OA\Get(path="/api/",
     *   tags={"view"},
     *   operationId="viewIndex",
     *   summary="Информация про сайт",
     * @OA\Response(
     *    response=200,
     *    description="Возврощается полная информация про сайт",
     *   )
     * )
     */
    public function index()
    {
        $trist = Trist::first();
        $companies = Company::first();
        $galery = Gallery::first();
        $main = Main::first();
        $news = News::all();
        $proffeshion = Profesion::first();
        $project = Project::first();
        $recomendation = Recomendation::all();
        $title = Title::first();
        $job = Job::all();
        $data = [
            'trist' => $trist,
            'companies' => $companies,
            'galery' => $galery,
            'main' => $main,
            'news' => $news,
            'proffeshion' => $proffeshion,
            'project' => $project,
            'recomendation' => $recomendation,
            'title' => $title,
            'job' => $job,
        ];

        return response($data, 200);
    }

    /**
     * @OA\Get(path="/api/gallery",
     *   tags={"view"},
     *   operationId="viewgalerry",
     *   summary="Информация про сайт",
     * @OA\Response(
     *    response=200,
     *    description="Возврощается полная информация про сайт",
     *   )
     * )
     */
    public function gallery()
    {
        return response(Gallery::all(), 200);
    }

}
