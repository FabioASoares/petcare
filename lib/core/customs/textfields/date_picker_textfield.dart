import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/extension/double_extensions.dart';

class PetCareDatePickerField extends StatefulWidget {
  final String title;
  final String placeholder;
  final TextEditingController? controller;
  final bool enable;
  final double? width;
  final double? height;
  final List<double> paddings;
  final Function(DateTime)? onDateSelected;
  final DateTime? initialDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final IconData? prefixIcon;

  const PetCareDatePickerField({
    super.key,
    this.title = "",
    this.placeholder = "",
    this.controller,
    this.enable = true,
    this.width,
    this.height,
    this.paddings = const [0, 0, 0, 0],
    this.onDateSelected,
    this.initialDate,
    this.minDate,
    this.maxDate,
    this.prefixIcon,
  });

  @override
  State<PetCareDatePickerField> createState() => _PetCareDatePickerFieldState();
}

class _PetCareDatePickerFieldState extends State<PetCareDatePickerField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    if (widget.initialDate != null) {
      _controller.text = DateFormat('dd/MM/yyyy').format(widget.initialDate!);
    }
  }

  void _showDatePicker(BuildContext context) {
    FocusScope.of(context).unfocus();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        DateTime selectedDate = widget.initialDate ?? DateTime.now();

        return SizedBox(
          height: 300,
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    _controller.text =
                        DateFormat('dd/MM/yyyy').format(selectedDate);
                    widget.onDateSelected?.call(selectedDate);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Concluir',
                    style: TextStyle(
                      color: ColorsPC.turquesa.x400,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: widget.initialDate ?? DateTime.now(),
                  minimumDate: widget.minDate,
                  maximumDate: widget.maxDate,
                  onDateTimeChanged: (date) => selectedDate = date,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(60),
      borderSide: BorderSide(color: ColorsPC.cinza.x300, width: 1),
    );

    return Padding(
      padding: widget.paddings.toEdgeInsetsFromLTRB(),
      child: SizedBox(
        width: widget.width ?? double.infinity,
        height: widget.height,
        child: GestureDetector(
          onTap: widget.enable ? () => _showDatePicker(context) : null,
          child: AbsorbPointer(
            child: TextFormField(
              controller: _controller,
              enabled: widget.enable,
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    widget.enable ? Colors.transparent : ColorsPC.cinza.x50,
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: ColorsPC.cinza.x300,
                  fontSize: 14,
                ),
                suffixIcon: Icon(
                  Icons.calendar_month_rounded,
                  color: ColorsPC.cinza.x300,
                ),
                prefixIcon: widget.prefixIcon != null
                    ? Icon(
                        widget.prefixIcon,
                        color: ColorsPC.cinza.x300,
                      )
                    : null,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                enabledBorder: border,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: ColorsPC.turquesa.x400,
                    width: 3,
                  ),
                ),
                disabledBorder: border,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
