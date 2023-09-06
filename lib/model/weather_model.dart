
import 'package:intl/intl.dart';
import 'package:weather_app/res/assets/images/image_assets.dart';

class WeatherModel{

  static double lon=0;
  static double lat=0;
  static String weather="";
  static double temp=0;
  static double feelTemp=0;
  static double maxTemp=0;
  static double minTemp=0;
  static int pressure=0;
  static int humidity=0;
  static String icon="";
  // static int weatherId=0;
  static String locationName="";
  static String sunrise="";
  static String sunset="";
  static double wind =0;
  static String weatherImage = ImageAssets.rainyWeatherImage;

  static void dataFromJson(Map json) {
    WeatherModel.lon= json['coord']["lon"] ?? 0;
    WeatherModel.lat= json['coord']["lat"] ?? 0;
    WeatherModel.weather=json['weather'][0]['description'].toUpperCase() ?? '';
    WeatherModel.temp= json['main']['temp'] - 273 ?? 0;
    WeatherModel.feelTemp= json['main']['feels_like'] - 273 ?? 0.0;
    WeatherModel.maxTemp= json['main']['temp_max'] - 273 ?? 0.0;
    WeatherModel.minTemp=json['main']['temp_min'] - 273 ?? 0.0;
    WeatherModel.pressure= json['main']['pressure'] ?? 0;
    WeatherModel.humidity=json['main']['humidity'] ?? 0;
    WeatherModel.icon = json['weather'][0]['icon'] ?? '';
    // WeatherModel.weatherId=json['weather'][0]['id'] ?? '';
    WeatherModel.locationName=json['name'].toUpperCase() ?? 'Current Location';
    WeatherModel.sunrise=DateFormat.Hms().format(DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise']*1000)).toString() ?? '';
    WeatherModel.sunset=DateFormat.Hms().format(DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset']*1000)).toString() ?? '';
    WeatherModel.wind=json['wind']['speed'] ?? '';
    weatherImageLogic(WeatherModel.icon);
  }

  static void weatherImageLogic(String icon){
    if(icon == '01d' || icon == '02d' || icon == '01n' || icon == '02n'){
      WeatherModel.weatherImage = ImageAssets.sunnyWeatherImage;
    }else if(icon == '03d' || icon == '04d' || icon == '03n' || icon == '04n'){
      WeatherModel.weatherImage = ImageAssets.cloudyWeatherImage;
    }else if(icon == '09d' || icon == '10d' || icon == '11d' || icon == '09n' || icon == '10n' || icon == '11n'){
      WeatherModel.weatherImage = ImageAssets.rainyWeatherImage;
    }else if(icon == '13d' || icon == '13n'){
      WeatherModel.weatherImage = ImageAssets.snowWeatherImage;
    }else if(icon == '50d' || icon == '50n'){
      WeatherModel.weatherImage = ImageAssets.windyWeatherImage;
    }else{
      WeatherModel.weatherImage = ImageAssets.sunnyWeatherImage;
    }
  }

}