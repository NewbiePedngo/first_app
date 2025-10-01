import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String name;
  final Color colorBox;
  final Widget childWidget;
  const GreetingWidget({super.key,
  this.name = 'World',
  this.colorBox = Colors.red,
  required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Stateless Widget')),
      body: Center(
        child: Container(color: colorBox,
        child: childWidget,
      //  child: Container(
        //  color: colorBox,
          //child: Text('Hello $name',
       // style: TextStyle(fontSize: 22)
        )));
  }
}
