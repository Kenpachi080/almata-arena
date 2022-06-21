<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Service\ImageService;

class ItemController extends Controller
{
    /**
     * @var ImageService
     */
    private $imageservice;

    public function __construct(ImageService $service)
    {
        $this->imageservice = $service;
    }

    /**
     * @OA\Post(
     * path="/api/items/",
     * summary="Вытащить все товары",
     * description="Вытащить все товары",
     * operationId="viewitem",
     * tags={"items"},
     * @OA\RequestBody(
     *    required=true,
     *    description="Апи Токен",
     *    @OA\JsonContent(
     *       required={"name,  category, popular"},
     *      @OA\Property(property="category", type="string", format="string", example="1"),
     *       @OA\Property(property="popular", type="string", format="string", example="Урна"),
     *       @OA\Property(property="name", type="string", format="string", example="1"),
     *  ),
     * ),
     * @OA\Response(
     *    response=200,
     *    description="CallBack",
     *        )
     *     )
     * )
     */
    public function view(Request $request)
    {
        $item = Item::orderBy('id', 'desc');
        if ($request->category) {
            $response = $item->where('category', '=', $request->category);
        }
        if ($request->name) {
            $response = $item->where('name', 'LIKE', "%$request->name%");
        }
        if ($request->popular) {
            $response = $item->orderBy('popular', "DESC");
        }
        $response = $item->get();
        foreach ($response as $block) {
            $block->image = $this->imageservice->urlimage($block->image);
        }
        return response($response, 200);
    }

    /**
     * @OA\Post(
     * path="/api/items/single",
     * summary="Вытащить отдельный товар",
     * description="Вытащить отдельный товар",
     * operationId="singleitem",
     * tags={"items"},
     * @OA\RequestBody(
     *    required=true,
     *    description="Апи Токен",
     *    @OA\JsonContent(
     *       required={"id"},
     *       @OA\Property(property="id", type="string", format="string", example="1"),
     *  ),
     * ),
     * @OA\Response(
     *    response=200,
     *    description="CallBack",
     *        )
     *     )
     * )
     */
    public function singleview(Request $request)
    {
        $item = Item::where('items.id', '=', $request->id)
            ->leftjoin('color_items', 'color_items.item', '=', 'items.id')
            ->select('color_items.name as colorname', 'color_items.image', 'items.name as itemname', 'items.articul'
                , 'items.price', 'items.description', 'items.description', 'items.logo', 'items.popular')->first();
        $item->image = $this->imageservice->urlimage($item->image);
        $item->logo = $this->imageservice->urlimage($item->logo);
        return response($item, 200);
    }
}
