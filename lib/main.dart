import 'package:calculator/buttons/buttons.dart';
import 'package:calculator/buttons/widgets.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(app());
}

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: widgets(),
    );
  }
}
