import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'check_in',
      home: CheckIn(),
    );
  }
}

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  final TextEditingController _controller = TextEditingController();
  String? get _errorText {
    final text = _controller.value.text;

    if (text.isEmpty) {
      return '입력이 올바르지 않습니다.';
    }
    return null;
  }

  var _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Check In'),
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
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              errorText: _errorText,
                              border: OutlineInputBorder(),
                              hintText: '카드 번호를 입력하세요'),
                          keyboardType: TextInputType.number,
                          onChanged: (text) => setState(() => _text),
                        ),
                        Divider(
                          height: 50,
                          thickness: 2.0,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          height: 38,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_controller.text == '42') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Check in Success')));
                              } else if (_controller.text.isEmpty) {
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Check in Fail')));
                              }
                            },
                            child: Text('CHECK IN'),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
