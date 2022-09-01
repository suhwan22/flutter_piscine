import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'bmi_output_page.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String? get _errorText1 {
    final text = _controller1.value.text;

    if (text.isEmpty) {
      return 'Input Height';
    }
    return null;
  }

  String? get _errorText2 {
    final text = _controller2.value.text;

    if (text.isEmpty) {
      return 'Input Weight';
    }
    return null;
  }

  bool _isON = false;
  var _text1 = '';
  var _text2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.green,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  child: Theme(
                data: ThemeData(
                    primaryColor: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 15.0,
                    ))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextField(
                        controller: _controller1,
                        decoration: InputDecoration(
                            errorText: _errorText1,
                            border: OutlineInputBorder(),
                            hintText: 'Input Height(cm)'),
                        keyboardType: TextInputType.number,
                        onChanged: (text) => setState(() => _text1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: TextField(
                        obscureText: _isON,
                        controller: _controller2,
                        decoration: InputDecoration(
                            errorText: _errorText2,
                            border: OutlineInputBorder(),
                            hintText: 'Input Weight(kg)'),
                        keyboardType: TextInputType.number,
                        onChanged: (text) => setState(() => _text2),
                      ),
                    ),
                    CupertinoSwitch(
                      value: _isON,
                      onChanged: (bool value) {
                        setState(() {
                          _isON = value;
                        });
                      },
                    ),
                    Text('Weight : ${_isON ? '****' : 'digit'}'),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 340,
                      height: 38,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_controller1.text.isEmpty ||
                              _controller2.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Error')));
                          } else {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return BMI(
                                  double.parse(_controller1.text.toString()),
                                  double.parse(_controller2.text.toString()));
                            }));
                          }
                        },
                        child: Text('Calculation'),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
