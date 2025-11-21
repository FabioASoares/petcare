import 'package:flutter/material.dart';
import 'package:petcare/core/extension/num_extensions.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareRowIconText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Color? titleColor;
  final Widget? label;
  const PetCareRowIconText({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.titleColor,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0.04.w,
        right: 0.04.w,
        top: 0.01.h,
        bottom: 0.01.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 0.02.w),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          Expanded(
            child: PetCareText.h5(
              title,
              color: titleColor,
              align: TextAlign.left,
            ),
          ),
          if (label != null)
            Padding(
              padding: EdgeInsets.only(left: 0.02.w),
              child: label!,
            ),
        ],
      ),
    );
  }
}
