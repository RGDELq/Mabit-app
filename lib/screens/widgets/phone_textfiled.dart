import 'package:flutter/material.dart';
import '../../utils/theme.dart';

class PhoneTextFieldWidget extends StatefulWidget {
  const PhoneTextFieldWidget(
      {super.key,
      required this.controller,
      this.label,
      required this.keyboardType,
      required this.validator,
      required this.hintText,
      this.obSecureText = false,
      this.perfix});
  final TextEditingController controller;
  final String? label;
  final String hintText;
  final TextInputType keyboardType;
  final FormFieldValidator<String?> validator;

  final bool obSecureText;
  final Widget? perfix;
  @override
  State<PhoneTextFieldWidget> createState() => _PhoneTextFieldWidgetState();
}

class _PhoneTextFieldWidgetState extends State<PhoneTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (widget.label != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.label ?? "",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
              keyboardType: TextInputType.phone,
              controller: widget.controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator,
              obscureText: widget.obSecureText,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16),
                suffixIcon: widget.perfix,
                fillColor: pcolor.withOpacity(0.2),
                filled: true,
                hintText: widget.hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: pcolor.withOpacity(0.2))),
                focusColor: pcolor.withOpacity(0.2),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.red)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: pcolor.withOpacity(0.4))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: pcolor.withOpacity(0.2))),
              ))
        ],
      ),
    );
  }
}
