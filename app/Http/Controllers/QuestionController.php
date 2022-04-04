<?php

namespace App\Http\Controllers;

use App\Http\Requests\QuestionRequest;
use App\Models\MainQuestion;
use App\Models\MostAnswer;
use App\Mostmainchild;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    public function main()
    {
        $question = "Выберите желаемую услугу:";
        $answer = MainQuestion::all();
        $response = [
            'question' => $question,
            'answer' => $answer,
        ];
        return response($response, 200);
    }

    public function child(QuestionRequest $request)
    {
        $question = Mostmainchild::where('mostmainchilds.main_question_id', '=', $request->main)
            ->leftjoin('child_questions', 'child_questions.id', '=', 'mostmainchilds.child_question_id')
            ->select('child_questions.*')
            ->paginate(1);
        if (count($question) < 1) {
            return response([
                'message' => 'Закончились вопросы'
            ], 204);
        }
        $question_id = $question->first()->id;
        $answer = MostAnswer::where('most_answers.child_question_id', '=', $question_id)
            ->leftjoin('answers', 'answers.id', '=', 'most_answers.answer_id')
            ->select('answers.*')
            ->get();;
        $response = [
            'question' => $question,
            'answer' => $answer
        ];
        return response($response, 200);
    }
}
