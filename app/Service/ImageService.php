<?php


namespace App\Service;


class ImageService
{
    public function __construct()
    {
        $this->url = env('APP_URL', 'http://127.0.0.1:8000');
        $this->url = $this->url . "/storage/";
    }

    public function urlimage($image)
    {
        $img = $this->url.$image;
        return $img;
    }

    public function multiimage($image)
    {
        $return = [];
        if ($image) {
            if (gettype($image) == 'array') {
                foreach ($image as $value) {
                    $return[] = $this->url . $value;
                }
            }
        } else {
            $return = [];
        }
        return $return;
    }
}
