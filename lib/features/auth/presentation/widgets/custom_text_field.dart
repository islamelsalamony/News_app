import 'package:flutter/material.dart';
import 'package:novanews/core/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.icon,
    this.isPassword = false,
    required this.controller,
    this.onChanged,
    this.suffixIcon,
    this.suffixOnPressed,
    this.minLines,
    this.textSize,
    this.maxLines,
    this.radius = 30.0,
    this.filled,
    this.fillColor,
    this.labelText,
    this.labelStyle,
    this.hintStyle,
    this.puffIcon,
  });

  final String? hintText;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? suffixOnPressed;
  final int? minLines;
  final int? maxLines;
  final double? textSize;
  final double radius;
  final bool? filled;
  final Color? fillColor;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final IconData? puffIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        border: Border.all(color: AppColors.secondaryText.withOpacity(0.1)),
      ),
      child: TextFormField(
        maxLines: widget.maxLines ?? 1,
        minLines: widget.minLines,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        obscureText: widget.isPassword ? !isVisible : false,
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "${widget.hintText ?? 'Field'} is required";
          }
          return null;
        },
        decoration: InputDecoration(
          fillColor: widget.fillColor,
          filled: widget.filled,
          // تحسين كود الـ prefixIcon
          prefixIcon: (widget.icon != null || widget.puffIcon != null)
              ? Icon(
                  widget.icon ?? widget.puffIcon,
                  size: 20,
                  color: AppColors.secondaryText,
                )
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () => setState(() => isVisible = !isVisible),
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                    color: AppColors.secondaryText,
                  ),
                )
              : (widget.suffixIcon != null
                    ? IconButton(
                        onPressed: widget.suffixOnPressed,
                        icon: Icon(widget.suffixIcon, size: 20),
                      )
                    : null),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
