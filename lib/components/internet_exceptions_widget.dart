import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatefulWidget {
  const InternetExceptionWidget({Key? key}) : super(key: key);

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.cloud_off, color:Colors.red, size: MediaQuery.of(context).size.height * 0.08,),
          const Text('No Internet Connection', style: TextStyle(fontSize: 30),textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
