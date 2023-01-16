#language: ru

@negative
Функционал: Негативные проверки

  Сценарий: Error Code 615 - API request has failed.

    И по эндпоинту "current" получаем текущую погоду в городе "BlaBlaBla"
    И проверяем полученный ответ
      | error.code | 615                                                           |
      | error.type | request_failed                                                |
      | error.info | Your API request failed. Please try again or contact support. |

  Сценарий: Error Code 601 - An invalid (or missing) query value was specified.

    И по эндпоинту "current" получаем текущую погоду в городе ""
    И проверяем полученный ответ
      | error.code | 601                                                                   |
      | error.type | missing_query                                                         |
      | error.info | Please specify a valid location identifier using the query parameter. |

  Сценарий: Error Code 103 - User requested a non-existent API function.

    И по эндпоинту "blablabla" получаем текущую погоду в городе "New York"
    И проверяем полученный ответ
      | error.code | 103                               |
      | error.type | invalid_api_function              |
      | error.info | This API Function does not exist. |

  Сценарий: Error Code 603 - Historical data is not supported on the current subscription plan.

    И по эндпоинту "historical" получаем текущую погоду в городе "Kuvandyk"
    И проверяем полученный ответ
      | error.code | 603                                                                                                                       |
      | error.type | historical_queries_not_supported_on_plan                                                                                  |
      | error.info | Your current subscription plan does not support historical weather data. Please upgrade your account to use this feature. |