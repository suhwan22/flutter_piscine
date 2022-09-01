import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMI extends StatefulWidget {
  final double height;
  final double weight;

  const BMI(this.height, this.weight);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(minimum: 0, maximum: 45, ranges: <GaugeRange>[
                    GaugeRange(
                        label: '저체중',
                        startValue: 0,
                        endValue: 18.5,
                        color: Colors.blue,
                        startWidth: 20,
                        endWidth: 20),
                    GaugeRange(
                        label: '정상',
                        startValue: 18.5,
                        endValue: 25,
                        color: Colors.green,
                        startWidth: 20,
                        endWidth: 20),
                    GaugeRange(
                        label: '과체중',
                        startValue: 25,
                        endValue: 30,
                        color: Colors.orange,
                        startWidth: 20,
                        endWidth: 20),
                    GaugeRange(
                        label: '비만',
                        startValue: 30,
                        endValue: 35,
                        color: Colors.pink,
                        startWidth: 20,
                        endWidth: 20),
                    GaugeRange(
                        label: '고도비만',
                        startValue: 35,
                        endValue: 45,
                        color: Colors.red,
                        startWidth: 20,
                        endWidth: 20)
                  ], pointers: <GaugePointer>[
                    NeedlePointer(
                        value: (widget.weight) /
                            ((widget.height / 100) * (widget.height / 100)))
                  ], annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Container(
                            padding: EdgeInsets.only(top: 60),
                            child: Text(
                                'BMI : ${((widget.weight) / ((widget.height / 100) * (widget.height / 100))).toStringAsFixed(1)}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        angle: 90,
                        positionFactor: 0.5)
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
