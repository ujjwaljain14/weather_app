import 'package:location/location.dart';
import '../data/network/network_api_services.dart';
import '../model/weather_model.dart';

class HomeScreenViewModel{

  static Future<String> getCurrentLocationCoordinates() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return '';
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return 'Enable Location';
      }
    }

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lon = locationData.longitude;
    WeatherModel.lat = lat ?? WeatherModel.lat;
    WeatherModel.lon = lon ?? WeatherModel.lon;

    if (lat == null || lon == null) {
      return "Couldn't fetch data";
    }else{
      getLocationData();
    }
    return '';
  }

  static Future getSearchLocationCoordinates(String location)async{
    return NetworkApiServices().getApi("http://api.openweathermap.org/geo/1.0/direct?q=$location&limit=1&appid=9d441232b685f6f045f5cae72409f722").then((value) async {
      WeatherModel.lat = value[0]['lat'];
      WeatherModel.lon = value[0]['lon'];
      await getLocationData();
    });

  }

  static Future getLocationData()async{
    return NetworkApiServices().getApi("https://api.openweathermap.org/data/2.5/weather?lat=${WeatherModel.lat}&lon=${WeatherModel.lon}&appid=9d441232b685f6f045f5cae72409f722").then((value){
      WeatherModel.dataFromJson(value);
    });
  }

}