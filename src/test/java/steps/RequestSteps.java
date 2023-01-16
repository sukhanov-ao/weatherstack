package steps;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.ru.И;
import io.restassured.response.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.junit.Assert;

import java.util.Map;

import static io.restassured.RestAssured.given;

public class RequestSteps {

    private static final Logger log = LoggerFactory.getLogger(RequestSteps.class);
    private static final String URI = "http://api.weatherstack.com/";
    private static final String ACCESS_KEY = "54df1b91d330ec1b50f577c6db80a928";

    private Response response;

    @И("^по эндпоинту \"(.*)\" получаем текущую погоду в городе \"(.*)\"$")
    public void getCurrentWeatherInCity(String endpoint, String city) {
        response = given()
                .baseUri(URI)
                .queryParam("access_key", ACCESS_KEY)
                .queryParam("query", city)
                .when()
                .get(endpoint)
                .then()
                .log().all()
                .extract().response();
    }

    @И("^проверяем полученный ответ$")
    public void verifyResponse(DataTable expectedResponse) {
        Map<String, String> expected = expectedResponse.asMap(String.class, String.class);
        expected.forEach((k, v) ->
                Assert.assertEquals("Значения не равны", v, response.jsonPath().get(k).toString()));
        log.info("Заданные параметры совпадают");
    }
}
