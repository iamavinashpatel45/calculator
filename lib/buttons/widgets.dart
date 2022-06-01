import 'package:calculator/buttons/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int fval = 0, sval = 0;
String ope = '', his = '', display = '', ans = '', tem = '';

class widgets extends StatefulWidget {
  @override
  State<widgets> createState() => _widgetsState();
}

class _widgetsState extends State<widgets> {
  void buttononclik(String val) {
    if (val == 'AC') {
      fval = 0;
      sval = 0;
      ans = '';
      ope = '';
      his = '';
      tem = '';
    } else if (val == "+" || val == "-" || val == "X" || val == "/") {
      fval = int.parse(display);
      ope = val;
      tem = '';
      ans = '';
    } else if (val == '⌫') {
      tem = int.parse(display).toString();
      tem = tem.substring(0, tem.length - 1);
    } else if (val == '=') {
      sval = int.parse(display);
      if (ope == '+') {
        tem = (fval + sval).toString();
        his = fval.toString() + ope + sval.toString();
      } else if (ope == '-') {
        tem = (fval - sval).toString();
        his = fval.toString() + ope + sval.toString();
      } else if (ope == 'X') {
        tem = (fval * sval).toString();
        his = fval.toString() + ope + sval.toString();
      } else {
        tem = (fval / sval).toString();
        his = fval.toString() + ope + sval.toString();
      }
    } else if (val == '+/-') {
      if (int.parse(display) > 0) {
        tem = '-' + tem;
      }
    } else {
      tem = int.parse(display + val).toString();
    }
    setState(() {
      display = tem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Container(
                      padding: EdgeInsets.all(25),
                      child: Text(
                        his,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onHorizontalDragEnd: (context) {
                        display = display.substring(0, display.length - 1);
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          display,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttons('AC', Colors.amberAccent, buttononclik),
                buttons('⌫', Colors.amberAccent, buttononclik),
                buttons('%', Colors.amberAccent, buttononclik),
                buttons('/', Colors.amberAccent, buttononclik),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttons('7', Colors.grey, buttononclik),
                buttons('8', Colors.grey, buttononclik),
                buttons('9', Colors.grey, buttononclik),
                buttons('X', Colors.amberAccent, buttononclik),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttons('4', Colors.grey, buttononclik),
                buttons('5', Colors.grey, buttononclik),
                buttons('6', Colors.grey, buttononclik),
                buttons('-', Colors.amberAccent, buttononclik),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttons('1', Colors.grey, buttononclik),
                buttons('2', Colors.grey, buttononclik),
                buttons('3', Colors.grey, buttononclik),
                buttons('+', Colors.amberAccent, buttononclik),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttons('0', Colors.grey, buttononclik),
                buttons('.', Colors.grey, buttononclik),
                buttons('+/-', Colors.amberAccent, buttononclik),
                buttons('=', Colors.deepOrangeAccent, buttononclik),
              ],
            ),
          ),
          Container(
            child: SizedBox(
              height: 10,
            ),
          )
        ],
      ),
    );
  }
}
