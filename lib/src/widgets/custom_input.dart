import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String hint;
  final double paddingTop;
  final double paddingBottom;
  final TextEditingController controller;
  final bool hasObscure;
  final InputBorder inputBorder;

  const CustomInput(
      {super.key,
      required this.hint,
      required this.controller,
      this.paddingTop = 0,
      this.paddingBottom = 0,
      this.hasObscure = false,
      this.inputBorder = const UnderlineInputBorder()});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool showText = false;

  @override
  initState() {
    setState(() {
      showText = widget.hasObscure;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onIconPress() {
      setState(() {
        showText = !showText;
      });
    }

    void onClearPress() {
      widget.controller.clear();
    }

    return (Padding(
        padding: EdgeInsets.only(
            top: widget.paddingTop, bottom: widget.paddingBottom),
        child: TextField(
          controller: widget.controller,
          obscureText: showText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: -10),
            border: widget.inputBorder,
            labelText: widget.hint,
            suffixIcon: widget.hasObscure
                ? IconButton(
                    onPressed: onIconPress,
                    icon: Icon(
                        showText ? Icons.visibility_off : Icons.visibility),
                  )
                : TextButton(
                    onPressed: onClearPress,
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    child: const CustomText(
                      title: "clear",
                      fontPreset: FontPresets.normalBold,
                    ),
                  ),
          ),
        )));
  }
}
