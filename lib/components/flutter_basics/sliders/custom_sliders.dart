import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSlidersPage extends StatelessWidget {
  const CustomSlidersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliders')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildSlider("Default Material Slider", const _SimpleSlider()),
                _buildSlider("Default iOS Slider", const IosSlider()),
                _buildSlider(
                    "Custom Colors",
                    const _SimpleSlider(
                        thumbColor: Colors.green,
                        activeColor: Colors.lightGreen,
                        inactiveColor: Colors.lightGreenAccent)),
                _buildSlider("Default Slider with divisions",
                    const _SimpleSlider(divisions: 5)),
                _buildSlider(
                    "Paddle Thumb Overlay",
                    const CustomThumbShape(
                        valueIndicatorShape:
                            PaddleSliderValueIndicatorShape())),
                _buildSlider(
                    "Rectangular Thumb Overlay",
                    const CustomThumbShape(
                        valueIndicatorShape:
                            RectangularSliderValueIndicatorShape())),
              ]),
        ),
      ),
    );
  }

  Widget _buildSlider(String title, Widget child) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[Text(title), child, const Divider()]),
    );
  }
}

class _SimpleSlider extends StatefulWidget {
  final Color? thumbColor, activeColor, inactiveColor;
  final int? divisions;

  const _SimpleSlider(
      {Key? key,
      this.thumbColor,
      this.activeColor,
      this.inactiveColor,
      this.divisions})
      : super(key: key);

  @override
  __SimpleSliderState createState() => __SimpleSliderState();
}

class __SimpleSliderState extends State<_SimpleSlider> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      label: _currentSliderValue.toInt().toString(),
      thumbColor: widget.thumbColor,
      activeColor: widget.activeColor,
      inactiveColor: widget.inactiveColor,
      divisions: widget.divisions,
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

class IosSlider extends StatefulWidget {
  const IosSlider({super.key});

  @override
  State<IosSlider> createState() => _IosSliderState();
}

class _IosSliderState extends State<IosSlider> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

class CustomThumbShape extends StatelessWidget {
  final SliderComponentShape valueIndicatorShape;
  const CustomThumbShape({Key? key, required this.valueIndicatorShape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderTheme.of(context)
            .copyWith(valueIndicatorShape: valueIndicatorShape),
        child: const _SimpleSlider(divisions: 100));
  }
}
