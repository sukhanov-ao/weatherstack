#language: ru

@positive
Функционал: Актуальная погода в городах

  Структура сценария: Погода в городе <Город>

    И по эндпоинту "current" получаем текущую погоду в городе "<Город>"
    И проверяем полученный ответ
      | location.name        | <Город>        |
      | location.country     | <Страна>       |
      | location.region      | <Регион>       |
      | location.lat         | <Широта>       |
      | location.lon         | <Долгота>      |
      | location.timezone_id | <Часовой пояс> |
      | request.unit         | m              |
      | request.type         | City           |

    Примеры:
      | Город   | Страна | Регион | Широта | Долгота | Часовой пояс  |
      | Izhevsk | Russia | Udmurt | 56.850 | 53.233  | Europe/Samara |
      | Moscow      | Russia | Moscow City | 55.752 | 37.616  | Europe/Moscow     |
      | Novosibirsk | Russia | Novosibirsk | 55.041 | 82.934  | Asia/Novosibirsk  |
      | Kemerovo    | Russia | Kemerovo    | 55.333 | 86.083  | Asia/Novokuznetsk |
      | Kazan       | Russia | Tatarstan   | 55.750 | 49.133  | Europe/Moscow     |

