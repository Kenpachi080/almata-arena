<?php

namespace App\Http\Controllers;

use App\Http\Requests\CallBackRequest;
use App\Http\Requests\CreateVacancyRequest;
use App\Models\CallBack;
use App\Models\Job;
use App\Models\JobSkills;
use App\Models\mostjobs;
use App\Models\TypeJob;
use Illuminate\Http\Request;

class ApiController extends Controller
{
    public function callback(CallBackRequest $request)
    {
        $callback = CallBack::create([
            'name' => $request->name,
            'contacts' => $request->contacts,
            'task' => $request->task
        ]);
        return response([
            'message' => 'Заявка успешно создана'
        ], 201);
    }


    public function typejobs()
    {
        $jobs = TypeJob::all();
        return response($jobs, 200);
    }

    public function simplejob(Request $request)
    {
        $jobs = TypeJob::where('id', '=', $request->id)->get();
        $skils = mostjobs::where('mostjobs.type_job_id', '=', $request->id)
            ->leftjoin('job_skills', 'job_skills.id', '=', 'mostjobs.job_skills_id')
            ->select('job_skills.*')
            ->get();
        $response = [
            'jobs' => $jobs,
            'skills' => $skils
        ];
        return response($response, 200);
    }

    public function job(CreateVacancyRequest $request)
    {
        $job = Job::create([
            'type' => $request->type,
            'name' => $request->name,
            'contacts' => $request->contacts,
            'email' => $request->email
        ]);
        return response([
            'message' => 'Вакансия успешно подана'
        ], 201);
    }
}
