import 'package:flutter/material.dart';

class CheckCircleWidget extends StatelessWidget {
  const CheckCircleWidget({
    Key key,
    @required this.onToggle,
    @required this.buttonColor,
    @required this.iconColor,
    this.size,
  }) : super(key: key);

  final VoidCallback onToggle;
  final Color buttonColor;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: size ?? 32.0,
          height: size ?? 32.0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonColor,
            ),
            child: Icon(
              Icons.check,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
