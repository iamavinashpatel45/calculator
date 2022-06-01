import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  final String num;
  final Color color;
  final Function callback;

  const buttons(
    this.num,
    this.color,
    this.callback,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FlatButton(
            child: Text(
              num,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            color: color,
            onPressed: () => callback(num),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ));
  }
}
