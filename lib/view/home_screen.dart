import 'package:flutter/material.dart';
import 'package:weather_app/components/card_item.dart';
import 'package:weather_app/components/text_field.dart';
import 'package:weather_app/view_models/home_screen_view_model.dart';
import '../model/weather_model.dart';
import '../res/colors/app_color.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
      HomeScreenViewModel.getCurrentLocationCoordinates().then((val) {
        HomeScreenViewModel.getLocationData().whenComplete(() {
          setState(() {});
        });
      });

    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.whiteColor,
          body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.55 ,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(WeatherModel.weatherImage),fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)
                      ),
                    color: AppColor.whiteColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top + 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(
                            controller: controller,
                            icon: const Icon(Icons.search),
                            labelText: 'Search',
                            height:  MediaQuery.of(context).size.height*0.06,
                            width: MediaQuery.of(context).size.width*0.70,
                            behavior: FloatingLabelBehavior.never,
                            pressFunction: () {
                                String val = controller.text;
                                controller.clear();
                                HomeScreenViewModel
                                    .getSearchLocationCoordinates(
                                    val).whenComplete(() {
                                  setState(() {});
                                });
                            },
                          ),
                          IconButton(onPressed: (){
                            HomeScreenViewModel.getCurrentLocationCoordinates().then((val){
                              HomeScreenViewModel.getLocationData().whenComplete((){
                                setState(() {});
                              });
                            });
                          }, icon: const Icon(Icons.location_on),color: AppColor.blackColor),
                        ],
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                                right: MediaQuery.of(context).size.width*0.1,
                                top: MediaQuery.of(context).size.height*0.1,
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(WeatherModel.weather, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.whiteColor)),
                                    Text("${WeatherModel.temp.round().toString()}°C", style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.whiteColor)),
                                    Text("H: ${WeatherModel.maxTemp.round().toString()}°C  L: ${WeatherModel.minTemp.round().toString()}°C", style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.whiteColor)),
                                  ],
                                )
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width*0.05,
                              bottom: MediaQuery.of(context).size.height*0.05,
                              child: Center(child: Text(WeatherModel.locationName, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.whiteColor),)),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ),

                Flexible(
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
                    crossAxisSpacing: MediaQuery.of(context).size.width*0.02,
                    mainAxisSpacing: MediaQuery.of(context).size.height*0.01,
                    children: [
                      CardItem(
                        title: 'SUNRISE',
                        subtitle: WeatherModel.sunrise,
                        icon: Icons.sunny
                      ),
                      CardItem(
                        title: 'SUNSET',
                        subtitle: WeatherModel.sunset,
                        icon: Icons.sunny_snowing,
                      ),
                      CardItem(
                        title: 'FEELS LIKE',
                        subtitle: "${WeatherModel.feelTemp.round().toString()} °C",
                        icon: Icons.thermostat,
                      ),
                      CardItem(
                        title: 'HUMIDITY',
                        subtitle: "${WeatherModel.humidity.toString()} %",
                        icon: Icons.hot_tub,
                      ),
                      CardItem(
                        title: 'WIND',
                        subtitle: "${WeatherModel.wind.toString()} meter/sec",
                        icon: Icons.air,
                      ),
                      CardItem(
                        title: 'PRESSURE',
                        subtitle: "${WeatherModel.pressure.toString()} hPa",
                        icon: Icons.compress,
                      ),
                    ],
                  ),
                )

              ],
            ),
      ),
    );
  }
}
