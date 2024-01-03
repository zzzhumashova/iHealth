import 'package:flutter/material.dart';

class BuildCustomProfileIcons extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color color;

  const BuildCustomProfileIcons({
    super.key,
    required this.icon,
    this.iconSize = 45.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: iconSize,
      color: color,
    );
  }
}