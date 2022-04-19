<?php

namespace App\Http\Controllers;

use App\Models\About;
use App\Models\News;
use App\Models\Project;
use App\Models\ReviewCard;
use App\Models\ReviewTitle;
use App\Models\ServicesCard;
use App\Models\ServicesTitle;
use App\Models\Title;
use Illuminate\Http\Request;

class IndexController extends Controller
{

    /**
     * @var mixed
     */
    private $lang;

    public function __construct(Request $request)
    {
        if (isset($request->lang)) {
            $this->lang = $request->lang;
        } else {
            $this->lang = 'ru';
        }
        $this->url = env('APP_URL', '127.0.0.1:8000') . '/storage/';
    }


    public function title()
    {
        $title = Title::where('lang', '=', $this->lang)->first();
        $title->header_logo = $this->url($title->header_logo);
        $title->header_background = $this->url($title->header_background);
        $title->footer_logo = $this->url($title->footer_logo);
        $title->footer_background = $this->url($title->footer_background);
        return response($title, 200);
    }

    public function about()
    {
        $about = About::where('lang', '=', $this->lang)
            ->select('id', 'header_content', 'title_mission', 'mission', 'footer_content')
            ->first();
        return response($about, 200);
    }

    public function news()
    {
        $news = News::where('lang', '=', $this->lang)->get();
        foreach ($news as $block) {
            $block->preview_photo = $this->url($block->preview_photo);
        }
        return response($news, 200);
    }

    public function review()
    {
        $review_title = ReviewTitle::where('lang', '=', $this->lang)->first();
        $review_card = ReviewCard::where('lang', '=', $this->lang)->get();
        foreach ($review_card as $card) {
            $card->photo = $this->url($card->photo);
        }
        $resoonse = [
            'title' => $review_title,
            'card' => $review_card,
        ];

        return response($resoonse, 200);
    }

    public function service()
    {
        $service_title = ServicesTitle::where('lang', '=', $this->lang)->first();
        $service_card = ServicesCard::where('lang', '=', $this->lang)->get();
        foreach ($service_card as $card) {
            $card->preview_photo = $this->url($card->preview_photo);
            $card->photo = $this->url($card->photo);
        }
        $response = [
            'service_title' => $service_title,
            'service_card' => $service_card,
        ];

        return response($response, 200);
    }

    public function singleservice($id)
    {
        $service = ServicesCard::where('lang', '=', $this->lang)
            ->where('id', '=', $id)
            ->first();
        if (!$service) {
            return response('Нету сервиса', 404);
        }
        $service->preview_photo = $this->url($service->preview_photo);
        $service->photo = $this->url($service->photo);
        $project = Project::where('lang', '=', $this->lang)
            ->where('service', '=', $id)
            ->get();
        if ($project) {
            foreach ($project as $item) {
                $item->photos = json_decode($item->photos);
                $photos = [];
                foreach ($item->photos as $photo) {
                    $photos[] = $this->url($photo);
                }
                $item->photos = $photos;
            }
        }
        $response = [
            'service' => $service,
            'project' => $project
        ];
        return response($response, 200);
    }

    public function project()
    {
        $project = Project::where('lang', '=', $this->lang)
            ->select('id', 'title', 'photos')
            ->get();
        foreach ($project as $item) {
            $item->photos = json_decode($item->photos);
            $photos = [];
            foreach ($item->photos as $photo) {
                $photos[] = $this->url($photo);
            }
            $item->photos = $photos;
        }
        return response($project, 200);
    }

    public function singleporject($id)
    {
        $project = Project::where('lang', '=', $this->lang)->where('id', '=', $id)->first();
        if (!$project) {
            return response('Нету проекта', 404);
        }
        $project->photos = json_decode($project->photos);
        $photos = [];
        foreach ($project->photos as $photo) {
            $photos[] = $this->url($photo);
        }
        $project->photos = $photos;
        return response($project, 200);
    }


    private
    function url($image)
    {
        $return = $this->url . $image;
        return $return;
    }
}
