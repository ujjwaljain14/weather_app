import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.buttonColor = Colors.white,
    this.textColor = Colors.black,
    this.loading = false,
    this.width = 60,
    this.height = 50,
    this.borderRadius = 15,
    required this.onPress,
    required this.title,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width, borderRadius;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: loading ?
          const Center(child: CircularProgressIndicator()) :
          Center(child: Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor),))
      ),
    );
  }
}
