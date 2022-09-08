import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const apiKey = "b192b4353d08916ac52e790c7f51c077";
const authority = "api.openweathermap.org";
const unencodedPath = "/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String city) async {
    final Map<String, String> queryParams = {
      "q": city,
      "appid": apiKey,
    };

    final url = Uri.https(authority, unencodedPath, queryParams);

    final NetworkHelper networkHelper = NetworkHelper(url);

    final data = await networkHelper.getData();

    return data;
  }

  Future<dynamic> getLocationWeather() async {
    final locationObject = Location();
    await locationObject.getCurrentPosition();

    final Map<String, String> queryParams = {
      "lat": locationObject.latitude.toString(),
      "lon": locationObject.longitude.toString(),
      "appid": apiKey,
    };

    final url = Uri.https(authority, unencodedPath, queryParams);

    final NetworkHelper networkHelper = NetworkHelper(url);

    final data = await networkHelper.getData();

    return data;
  }

  String? getWeatherIcon(int? condition) {
    if (condition == null) return null;
    if (condition < 300) return "😊";
    if (condition < 400) return "😂";
    if (condition < 500) return "🤣";
    if (condition < 600) return "❤";
    if (condition < 700) return "😒";
    if (condition < 800) return "💕";
    if (condition < 804) return "✌";

    return "😘";
  }

  String? getMessage(int? temp) {
    if (temp == null) return null;

    if (temp > 300) return "😊";
    if (temp > 290) return "🤷♂";
    if (temp > 280) return "😁";

    return "😘";
  }
}
