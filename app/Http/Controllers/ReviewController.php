<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateReviewRequest;
use App\Models\Review;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{

    /**
     * @OA\Post(
     * path="/api/review/",
     * summary="Заполнить отзыв",
     * description="Заполнить отзыв",
     * operationId="createreview",
     * tags={"review"},
     * @OA\RequestBody(
     *    required=true,
     *    description="Апи Токен",
     *    @OA\JsonContent(
     *       required={"api_token, start, text"},
     *       @OA\Property(property="api_token", type="string", format="string", example="Zx9HfKnJ1DZETiScaA0nU8Xm5E2yTPJGHDAXSsfdgfW8ioc6Pxzof3FotPQQ"),
     *       @OA\Property(property="start", type="string", format="string", example="1"),
     *       @OA\Property(property="text", type="string", format="string", example="1"),
     *  ),
     * ),
     * @OA\Response(
     *    response=200,
     *    description="CallBack",
     *        )
     *     )
     * )
     */
    public function create(CreateReviewRequest $request)
    {
        $id = Auth::id();
        $review = Review::create([
            'user' => $id,
            'stars' => $request->stars,
            'content' => $request->text
        ]);

        return response($review, 201);
    }
    /**
     * @OA\Get(path="/api/review/",
     *   tags={"review"},
     *   operationId="reviewindex",
     *   summary="Отзывы показы",
     * @OA\Response(
     *    response=200,
     *    description="",
     *   )
     * )
     */
    public function view()
    {
        $review = Review::leftjoin('users', 'users.id', '=', 'reviews.user')
            ->select('reviews.*', 'users.avatar', 'users.FIO')
            ->get();
        return response($review, 200);
    }
}
