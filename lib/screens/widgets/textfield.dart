import 'package:flutter/material.dart';
import 'package:mabitt/provider/dark_mode_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/theme.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    this.label,
    required this.validator,
    required this.hintText,
    this.obSecureText = false,
    this.perfix,
    required this.fillColor,
    required this.filled,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final String hintText;
  final FormFieldValidator<String?> validator;
  final bool obSecureText;
  final Widget? perfix;
  final Color fillColor;
  final bool filled;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkModeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (widget.label != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.label!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: darkMode.isDark ? Colors.white : primary,
                  ),
                ),
              ],
            ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            obscureText: widget.obSecureText,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16),
              suffixIcon: widget.perfix,
              fillColor: darkMode.isDark ? Colors.white : white,
              filled: widget.filled,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: pcolor.withOpacity(0.2)),
              ),
              focusColor: pcolor.withOpacity(0.2),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: error),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: pcolor.withOpacity(0.4)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: pcolor.withOpacity(0.2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
