import 'package:flutter/material.dart';
import 'package:mabitt/utils/theme.dart';

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  const CustomizedButton(
      {Key? key,
      this.buttonText,
      this.buttonColor,
      this.onPressed,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: buttonColor,
                border: Border.all(width: 3, color: ColorManager.darkblue),
                borderRadius: BorderRadius.circular(40)),
            child: Center(
                child: Text(
              buttonText!,
              style: TextStyle(
                color: textColor,
                fontSize: 20,

              ),
            ))
            
            ),
      ),
    );
  }
}
