import 'package:flutter/material.dart';


class GeneralExceptionWidget extends StatefulWidget {
  const GeneralExceptionWidget({Key? key}) : super(key: key);

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: MediaQuery.of(context).size.height * 0.08,),
          const Text('Something unusual occurred', style: TextStyle(fontSize: 30),textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
