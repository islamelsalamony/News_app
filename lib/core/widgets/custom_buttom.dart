import 'package:flutter/material.dart';
// ignore: unused_import

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.radius,
    required this.color,
    required this.style,
  });
  final void Function()? onPressed;
  final String text;
  final double radius;
  final Color color;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(text, style: style),
      ),
    );
  }
}
