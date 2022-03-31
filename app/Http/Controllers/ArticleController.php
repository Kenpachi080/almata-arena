<?php

namespace App\Http\Controllers;

use App\Http\Requests\CommentRequest;
use App\Http\Requests\ViewCommentRequest;
use App\Models\Articles;
use App\Models\CommentArticle;

class ArticleController extends Controller
{


    public function __construct()
    {
        $this->url = env('APP_URL', 'http://127.0.0.1:8000');
    }

    public function viewArticle()
    {
        $article = Articles::all();
        foreach ($article as $value) {
            $value->image = $this->url . '/storage/' . $value->image;
        }
        return response($article, 200);
    }

    public function viewComment(ViewCommentRequest $request)
    {
        $comments = CommentArticle::where('articleID', '=', $request->articleID)->get();
        if (count($comments) > 0) {
            return response($comments, 200);
        } else {
            return response([
                'message' => 'Комментариев нет'
            ], 204);
        }
    }

    public function commentAdd(CommentRequest $request)
    {
        $article = Articles::where('id', '=', $request->articleID)->first();
        if ($article) {
            $comments = CommentArticle::create([
                'fio' => $request->fio,
                'content' => $request->context,
                'articleID' => $request->articleID
            ]);
            return response(['message' =>'Коментарий был создан'], 201);
        } else {
            return response([
                'message' => 'Не была найдена статья'
            ], 204);
        }
    }
}
