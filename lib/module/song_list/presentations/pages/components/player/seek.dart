import 'package:flutter/material.dart';

class PlayerSeekIndicator extends StatelessWidget {
  final double streamPosition;
  final double maxValue;
  final ValueChanged<double>? onChanged;

  PlayerSeekIndicator({
    required this.streamPosition,
    required this.maxValue,
    required this.onChanged
  } );

  @override
  Widget build(BuildContext context) {

    return Slider(
        thumbColor: Colors.grey[100],
        activeColor: Colors.grey[100],
        inactiveColor: Colors.grey[700],
        value: streamPosition,
        min: 0,
        max: maxValue,
        onChanged: onChanged
    );
  }
}
