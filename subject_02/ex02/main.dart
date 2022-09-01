import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fluent_gauges',
      theme: ThemeData(brightness: Brightness.dark),
      home: TestGauge(),
    );
  }
}

class TestGauge extends StatefulWidget {
  const TestGauge({Key? key}) : super(key: key);

  @override
  State<TestGauge> createState() => _TestGaugeState();
}

class SliderController {
  double sliderValue;
  SliderController(this.sliderValue);
}

class _TestGaugeState extends State<TestGauge> {
  final SliderController _sliderController = SliderController(0.0);

  Widget buildSlider({
    SliderController? controller,
    int? divisions,
    Color color = Colors.green,
    double enabledThumbRadius = 10.0,
    double elevation = 1.0,
  }) {
    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: color,
            thumbColor: color,
            activeTickMarkColor: color,
            valueIndicatorColor: color,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: enabledThumbRadius,
              elevation: elevation,
            ),
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          ),
          child: Slider(
            value: controller!.sliderValue,
            min: 0.0,
            max: 150.0,
            divisions: divisions,
            label: '${controller.sliderValue.round()}',
            onChanged: (double newValue) {
              setState(
                () {
                  controller.sliderValue = newValue;
                },
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fluent Gauge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0,
                        endValue: 50,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 50,
                        endValue: 100,
                        color: Colors.orange,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 100,
                        endValue: 150,
                        color: Colors.red,
                        startWidth: 10,
                        endWidth: 10)
                  ], pointers: <GaugePointer>[
                    NeedlePointer(value: _sliderController.sliderValue)
                  ], annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Container(
                            padding: EdgeInsets.only(top: 60),
                            child: Text(
                                '${_sliderController.sliderValue.toStringAsFixed(1)}',
                                style: TextStyle(
                                  fontSize: 15,
                                ))),
                        angle: 90,
                        positionFactor: 0.5)
                  ]),
                ],
              ),
            ),
            buildSlider(
              controller: _sliderController,
              divisions: 1000,
            )
          ],
        ),
      ),
    );
  }
}
