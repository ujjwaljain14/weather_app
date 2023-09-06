import 'package:flutter/material.dart';
import 'package:weather_app/res/colors/app_color.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    // this.height = 40,
    // this.width = 60,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  // final double height, width;
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.colorOne,
      elevation: 40,
      shadowColor: AppColor.colorTwo,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
          // height: height,
          // width: width,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(icon),
                  Text(title, style: Theme.of(context).textTheme.titleLarge,),
                ],
              ),
              Text(subtitle, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
    );
  }
}
