import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.labelText,
    this.height = 50,
    this.width = 100,
    this.color = Colors.white60,
    this.prefixText='',
    this.keyboard = TextInputType.text,
    this.pressFunction,
    this.behavior = FloatingLabelBehavior.auto,
    this.borderRadius = 15,
  }) : super(key: key);

  final TextEditingController controller;
  final double height, width;
  final Color color;
  final String labelText;
  final Icon icon;
  final String prefixText;
  final TextInputType keyboard;
  final VoidCallback? pressFunction;
  final FloatingLabelBehavior behavior;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
          controller: controller,
          keyboardType: keyboard,
          onSubmitted: (val) {
            pressFunction!();
          },
          decoration: InputDecoration(
              fillColor: color.withOpacity(0.4),
              focusColor: Colors.green,
              filled: true,
              prefixIcon: icon,
              floatingLabelBehavior: behavior,
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.black),
              suffix: TextButton(
                onPressed: (){
                  pressFunction!();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: const Text('Done'),
              ),
              prefixText: prefixText,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(width: 10, style: BorderStyle.none))

          ),
        ),
    );
  }
}
