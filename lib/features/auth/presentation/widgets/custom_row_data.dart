import 'package:flutter/material.dart';
import 'package:novanews/core/theme/app_colors.dart';
import 'package:novanews/core/theme/app_styles.dart';

class CustomRowData extends StatelessWidget {
  const CustomRowData({
    super.key,
    required this.text,
    required this.textButtom,
    required this.screenName,
  });
  final String text;
  final String textButtom;
  final Widget screenName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppStyles.description.copyWith(fontSize: 14)),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => screenName),
            );
          },
          child: Text(
            textButtom,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
