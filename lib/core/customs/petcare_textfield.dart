import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcenter/core/colors/petcare_colors.dart';
import 'package:petcenter/core/extension/double_extensions.dart';

class PetCareTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String placeholder;
  final bool enable;
  final InputDecoration? customDecoration;
  final List<TextInputFormatter>? inputFormatter;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final String? helperText;
  final double? height;
  final TextStyle? titleStyle;
  final TextStyle? placeholderStyle;
  final OutlineInputBorder? borderDecoration;
  final int lengthLimiting;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<double> paddings;
  final Color? backgroundColor;
  final Color? iconColor;
  final FocusNode? focusNode;
  final Function(String)? callbackText;
  const PetCareTextField({
    super.key,
    this.controller,
    this.placeholder = "",
    this.title = "",
    this.enable = true,
    this.customDecoration,
    this.inputFormatter,
    this.prefixIcon,
    this.suffixIcon,
    this.helperText,
    this.width,
    this.height,
    this.titleStyle,
    this.placeholderStyle,
    this.obscureText = false,
    this.keyboardType = TextInputType.name,
    this.borderDecoration,
    this.paddings = const [0, 0, 0, 0],
    this.backgroundColor,
    this.iconColor,
    this.lengthLimiting = 50,
    this.focusNode,
    this.callbackText,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(60),
      borderSide: BorderSide(color: ColorsPC.cinza.x300, width: 1),
    );
    return Padding(
      padding: paddings.toEdgeInsetsFromLTRB(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width ?? double.infinity,
            height: height,
            child: TextFormField(
              maxLength: lengthLimiting,
              focusNode: focusNode,
              enabled: enable,
              controller: controller,
              decoration: getDecoration(borderDecoration ?? border),
              inputFormatters: inputFormatter,
              keyboardType: keyboardType,
              obscureText: obscureText,
              onChanged: callbackText,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration getDecoration(OutlineInputBorder borderStyle) {
    Color? color = backgroundColor ?? Colors.transparent;
    return customDecoration ??
        InputDecoration(
          filled: true,
          helperText: helperText,
          helperStyle: TextStyle(
            fontSize: 14,
            color: ColorsPC.vermelho.x400,
          ),
          fillColor: enable ? color : ColorsPC.cinza.x50,
          hintText: placeholder,
          hintStyle: TextStyle(
            color: ColorsPC.cinza.x300,
            fontSize: 14,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: iconColor ?? ColorsPC.cinza.x300)
              : null,
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          enabledBorder: borderStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: ColorsPC.turquesa.x400, width: 3),
          ),
          disabledBorder: borderStyle,
          counterText: '',
        );
  }
}
