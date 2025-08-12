import 'package:flutter/material.dart';

class TensionSlider extends StatefulWidget {
  const TensionSlider({super.key});

  @override
  State<TensionSlider> createState() => _TensionSliderState();
}

class _TensionSliderState extends State<TensionSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: 0,
          max: 10,
          divisions: 10,
          value: value,
          label: value.toStringAsFixed(0),
          onChanged: (v) => setState(() => value = v),
        ),
        Text(value.toStringAsFixed(0)),
      ],
    );
  }
}
