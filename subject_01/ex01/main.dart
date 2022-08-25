import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello_layout',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ex01'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(children: [
        Table(
          border: TableBorder.symmetric(inside: BorderSide(width: 3)),
          children: [
            TableRow(children: [
              SafeArea(
                child: Container(
                    child: SafeArea(
                  child: Flex(
                    mainAxisAlignment: MainAxisAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      Icon(Icons.star, size: 70),
                      Flex(
                        mainAxisAlignment: MainAxisAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          Icon(
                            Icons.star,
                            size: 50,
                          ),
                          Icon(
                            Icons.star,
                            size: 150,
                          ),
                          Icon(
                            Icons.star,
                            size: 50,
                          ),
                        ],
                      ),
                      Icon(Icons.star, size: 70),
                    ],
                  ),
                )),
              ),
              Container(
                child: Container(
                  color: Colors.blue,
                  height: 200,
                ),
              )
            ]),
            TableRow(children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.bottom,
                child: Container(
                  height: 80,
                  color: Colors.green,
                ),
              ),
              TableCell(
                child: Container(
                  height: 100,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 80),
                  child: Container(
                    color: Colors.yellow,
                    height: 50,
                  ),
                ),
              )
            ])
          ],
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Container(
            color: Colors.amber,
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            color: Colors.brown,
          ),
        )
      ]),
    );
  }
}
