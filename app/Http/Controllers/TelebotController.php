<?php

namespace App\Http\Controllers;

use App\Models\Driver;
use App\Models\Place;
use Illuminate\Http\Request;

class TelebotController extends Controller
{
    public string $token = '6210096609:AAH2ESiGb1qYXQtMRYHkyd8rEJ4YwKIpxHk';

    public function index(Request $request)
    {
        $json = $request->all();
        file_put_contents(__DIR__ . '/debug-telebot.txt', print_r($json, true));
        if (!isset($json['update_id'])) {
            return false;
        }

        if (!empty($json['callback_query']['data'])) {
            $this->callbackHandler($json);
        } else {
            $this->messageHandler($json);
        }

        return true;
    }

    public function callbackHandler($json)
    {
        $id = $json['callback_query']['from']['id'];
        $fields = 'callback_query_id=' . $json['callback_query']['id'] . '&text=';
        $this->curl('answerCallbackQuery', $fields);

        $chatId = $json['callback_query']['from']['id'];

        $place     = explode('_', $json['callback_query']['data']);
        $placeName = 'Вы выбрали место: ' . $place[2] . "\n\nТеперь нажмите кнопку 'Отправить геолокацию' и подтвердите отправку.\n\n";

        $driver = Driver::where('chat_id', $id)->first();

        if ($driver) {
            $driver->place_id = $place[1];
            $driver->save();
        }

        $keyboard = [
            "keyboard"          =>
                [
                    [
                        [
                            "text"             => "Отправить геолокацию",
                            "request_location" => true
                        ]
                    ]

                ],
            "one_time_keyboard" => true,
            "resize_keyboard"   => true

        ];

        $fields = 'chat_id=' . $chatId . '&text=' . rawurlencode($placeName) . '&reply_markup=' . json_encode($keyboard);
        $this->curl('sendMessage', $fields);

        file_put_contents(__DIR__ . '/debug-telebot-action_01.txt', print_r($placeName, true));
    }

    public function curl($method, $fields)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://api.telegram.org/bot' . $this->token . "/$method");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        $result = curl_exec($ch);
        curl_close($ch);

        file_put_contents(__DIR__ . '/debug-telebot-curl.txt', print_r(json_decode($result), true));
    }

    public function messageHandler($json)
    {
        if (!empty($json['my_chat_member'])) {
            $id = $json['my_chat_member']['from']['id'];
        } else {
            $id = $json['message']['from']['id'];
        }


        if (!empty($json['message']['location'])) {
            $this->updateDriver($json);
        } else {
            $driver = Driver::where('chat_id', $id)->first();
            if (empty($driver) || empty($driver->area_id)) {
                $this->createNewDriver($json);


                $fields = 'chat_id=' . $id . '&text=' . rawurlencode('Данные водителя требуют подтвержденияю Обратитесь к администратору');
                $this->curl('sendMessage', $fields);
            } else {
                $this->sendPlaces($id);
            }


        }
    }


    public function updateDriver($json) {
        file_put_contents(__DIR__ . '/debug-telebot-location.txt', print_r($json['message']['location'], true));

        $id = $json['message']['from']['id'];

        $location = $json['message']['location'];
        $lat = $location['latitude'];
        $lng = $location['longitude'];

        $driver = Driver::where('chat_id', $id)->first();

        if ($driver) {
            $driver->latitude = $lat;
            $driver->longitude = $lng;
            $driver->save();
        }


        $keyboard = [
            "keyboard"          =>
                [
                    [
                        [
                            "text" => "Выбрать следующее место",
                        ]
                    ]

                ],
            "one_time_keyboard" => true,
            "resize_keyboard"   => true

        ];

        $fields = 'chat_id=' . $id . '&text=' . rawurlencode('Когда прибудите на следующую точку - нажмите кнопку "Выбрать следующее место"') . '&reply_markup=' . json_encode($keyboard);
        $this->curl('sendMessage', $fields);
    }

    public function sendPlaces($id)
    {
        $places = $this->getPlaces($id);

        $keys = [];
        foreach ($places as $place) {
            $keys[] = [
                [
                    'text'          => $place->name,
                    'callback_data' => 'action_' . $place->id . '_' . $place->name
                ]
            ];
        }

        $keyboard = [
            "resize_keyboard" => true,
            "inline_keyboard" => $keys
        ];

        $text = 'Выберите место:';

        $fields = 'chat_id=' . $id . '&text=' . rawurlencode($text) . '&reply_markup=' . json_encode($keyboard);
        $this->curl('sendMessage', $fields);
    }

    public function getPlaces(int $telegram_id)
    {
        $driver = Driver::where('chat_id', $telegram_id)->first();

        if (empty($driver)) {
            return [];
        }

        $places = Place::where('area_id', $driver->area_id)->get(['id', 'name']);

        return $places;
    }

    public function createNewDriver($json)
    {
        $id = $json['message']['from']['id'];

        $driver = Driver::where('chat_id', $id)->first();

        if (!empty($driver)) {
            return false;
        }

        //$driverName = $json['message']['from']['first_name'] ?? '' . ' ' . $json['message']['from']['last_name'] ?? '' . '(' . $json['message']['from']['username'] ?? '' . ')';
        $driverName = $json['message']['from']['first_name'];

        $driver = new Driver();
        $driver->name = $driverName;
        $driver->email = 'udefined@mail.com';
        $driver->phone = '';
        $driver->chat_id = $id;
        $driver->driver_no = 0;
        $driver->car_no = 0;
        $driver->area_id = 0;
        $driver->latitude = 0.0;
        $driver->longitude = 0.0;
        $driver->place_id = 0;
        $driver->save();
    }
}
