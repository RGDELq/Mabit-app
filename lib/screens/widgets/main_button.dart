import 'package:flutter/material.dart';
import 'package:mabitt/utils/theme.dart';

class MainButton extends StatefulWidget {
  const MainButton(
      {super.key,
      required this.text,
      required this.withBorder,
      this.widthFromScreen = 0.9,
      required this.isloading,
      required this.onPressed,
      this.isActive = true});
  final String text;
  final bool withBorder;
  final double widthFromScreen;
  final bool isloading;
  final Function onPressed;
  final bool isActive;
  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (widget.isActive) {
          widget.onPressed();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          height: 60,
          width: size.width * widget.widthFromScreen,
          decoration: BoxDecoration(
              color: widget.withBorder
                  ? ColorManager.white
                  : widget.isActive
                      ? ColorManager.primary
                      : ColorManager.grey1,
              border: Border.all(
                  color: widget.isActive
                      ? ColorManager.primary
                      : Colors.transparent,
                  width: 1),
              borderRadius: BorderRadius.circular(60)),
          child: Center(
            child: widget.isloading
                ? CircularProgressIndicator(
                    color: widget.withBorder
                        ? ColorManager.primary
                        : Colors.transparent,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                          color: widget.withBorder
                              ? ColorManager.darkblue
                              : ColorManager.lightPrimary),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
