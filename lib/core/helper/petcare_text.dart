import 'package:flutter/widgets.dart';
import 'package:petcenter/core/extension/double_extensions.dart';

class PetCareText extends StatelessWidget {
  final String? text;
  final TextStyle style;
  final TextAlign textAlign;
  final bool obscureText;
  final List<double> paddings;

  const PetCareText({
    super.key,
    required this.text,
    required this.style,
    required this.textAlign,
    required this.obscureText,
    this.paddings = const [0, 0, 0, 0],
  });

  factory PetCareText._base(
    String text,
    TextStyle base,
    TextStyle? style,
    TextAlign? textAlign,
    bool obscureText, {
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    return PetCareText(
      paddings: paddings,
      text: text,
      style: base.merge(style),
      textAlign: textAlign ?? TextAlign.center,
      obscureText: obscureText,
    );
  }

  static FontWeight getFontWeight(bool bold, bool semiBold) {
    FontWeight fontWeight = FontWeight.normal;
    if (bold) {
      fontWeight = FontWeight.bold;
    } else if (semiBold) {
      fontWeight = FontWeight.w600;
    }

    return fontWeight;
  }

  static FontStyle getFontSyle(bool italic) {
    return italic ? FontStyle.italic : FontStyle.normal;
  }

  factory PetCareText.h1(
    String text, {
    TextStyle? style,
    TextAlign? align,
    bool bold = false,
    bool semiBold = false,
    bool obscureText = false,
    bool italic = false,
    Color? color,
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    TextStyle base = TextStyle(
      fontWeight: getFontWeight(bold, semiBold),
      fontSize: 32,
      fontStyle: getFontSyle(italic),
      color: color,
    );
    return PetCareText._base(
      text,
      base,
      style,
      align,
      obscureText,
      paddings: paddings,
    );
  }

  factory PetCareText.h2(
    String text, {
    TextStyle? style,
    TextAlign? align,
    bool bold = false,
    bool semiBold = false,
    bool obscureText = false,
    bool italic = false,
    Color? color,
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    TextStyle base = TextStyle(
      fontWeight: getFontWeight(bold, semiBold),
      fontSize: 28,
      fontStyle: getFontSyle(italic),
      color: color,
    );
    return PetCareText._base(
      text,
      base,
      style,
      align,
      obscureText,
      paddings: paddings,
    );
  }

  factory PetCareText.h3(
    String text, {
    TextStyle? style,
    TextAlign? align,
    bool bold = false,
    bool semiBold = false,
    bool obscureText = false,
    bool italic = false,
    Color? color,
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    TextStyle base = TextStyle(
      fontWeight: getFontWeight(bold, semiBold),
      fontSize: 24,
      fontStyle: getFontSyle(italic),
      color: color,
    );
    return PetCareText._base(
      text,
      base,
      style,
      align,
      obscureText,
      paddings: paddings,
    );
  }

  factory PetCareText.h4(
    String text, {
    TextStyle? style,
    TextAlign? align,
    bool bold = false,
    bool semiBold = false,
    bool obscureText = false,
    bool italic = false,
    Color? color,
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    TextStyle base = TextStyle(
      fontWeight: getFontWeight(bold, semiBold),
      fontSize: 20,
      fontStyle: getFontSyle(italic),
      color: color,
    );
    return PetCareText._base(
      text,
      base,
      style,
      align,
      obscureText,
      paddings: paddings,
    );
  }

  factory PetCareText.h5(
    String text, {
    TextStyle? style,
    TextAlign? align,
    bool bold = false,
    bool semiBold = false,
    bool obscureText = false,
    bool italic = false,
    Color? color,
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    TextStyle base = TextStyle(
      fontWeight: getFontWeight(bold, semiBold),
      fontSize: 18,
      fontStyle: getFontSyle(italic),
      color: color,
    );
    return PetCareText._base(
      text,
      base,
      style,
      align,
      obscureText,
      paddings: paddings,
    );
  }

  factory PetCareText.h6(
    String text, {
    TextStyle? style,
    TextAlign? align,
    bool bold = false,
    bool semiBold = false,
    bool obscureText = false,
    bool italic = false,
    Color? color,
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    TextStyle base = TextStyle(
      fontWeight: getFontWeight(bold, semiBold),
      fontSize: 16,
      fontStyle: getFontSyle(italic),
      color: color,
    );
    return PetCareText._base(
      text,
      base,
      style,
      align,
      obscureText,
      paddings: paddings,
    );
  }

  factory PetCareText.body1(
    String text, {
    TextStyle? style,
    TextAlign? align,
    bool bold = false,
    bool semiBold = false,
    bool obscureText = false,
    bool italic = false,
    Color? color,
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    TextStyle base = TextStyle(
      fontWeight: getFontWeight(bold, semiBold),
      fontSize: 14,
      fontStyle: getFontSyle(italic),
      color: color,
    );
    return PetCareText._base(
      text,
      base,
      style,
      align,
      obscureText,
      paddings: paddings,
    );
  }

  factory PetCareText.body2(
    String text, {
    TextStyle? style,
    TextAlign? align,
    bool bold = false,
    bool semiBold = false,
    bool obscureText = false,
    bool italic = false,
    Color? color,
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    TextStyle base = TextStyle(
      fontWeight: getFontWeight(bold, semiBold),
      fontSize: 13,
      fontStyle: getFontSyle(italic),
      color: color,
    );
    return PetCareText._base(
      text,
      base,
      style,
      align,
      obscureText,
      paddings: paddings,
    );
  }

  factory PetCareText.body3(
    String text, {
    TextStyle? style,
    TextAlign? align,
    bool bold = false,
    bool semiBold = false,
    bool obscureText = false,
    bool italic = false,
    Color? color,
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    TextStyle base = TextStyle(
      fontWeight: getFontWeight(bold, semiBold),
      fontSize: 12,
      fontStyle: getFontSyle(italic),
      color: color,
    );
    return PetCareText._base(
      text,
      base,
      style,
      align,
      obscureText,
      paddings: paddings,
    );
  }

  factory PetCareText.overline(
    String text, {
    TextStyle? style,
    TextAlign? align,
    bool bold = false,
    bool semiBold = false,
    bool obscureText = false,
    bool italic = false,
    Color? color,
    List<double> paddings = const [0, 0, 0, 0],
  }) {
    TextStyle base = TextStyle(
      fontWeight: getFontWeight(bold, semiBold),
      fontSize: 10,
      fontStyle: getFontSyle(italic),
      color: color,
    );
    return PetCareText._base(
      text,
      base,
      style,
      align,
      obscureText,
      paddings: paddings,
    );
  }

  @override
  Widget build(BuildContext context) {
    final texto = obscureText ? text?.obscureText : text;
    return Padding(
      padding: paddings.toEdgeInsetsFromLTRB(),
      child: Text(
        texto ?? '',
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}

extension StringSGZ on String {
  String? get obscureText {
    return replaceAll(RegExp(r"."), "*");
  }
}
