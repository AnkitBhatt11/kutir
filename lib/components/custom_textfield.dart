import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool? isRequired;
  final int? maxLength;
  final bool? autofocus;
  const CustomTextField({Key? key, required this.controller, required this.hint, this.keyboardType, this.onChanged, this.textInputAction, this.isRequired, this.maxLength, this.onSubmitted, this.autofocus, this.fillColor}) : super(key: key);
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShowPassword = false;

  void changeIsShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autofocus ?? false,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      onSubmitted: widget.onSubmitted,
      style: const TextStyle(color: Colors.black,fontFamily: "Montserrat"),
      decoration: InputDecoration(
        counterText: "",
        hintText: widget.hint,
        fillColor: widget.fillColor ?? Colors.grey.shade100,
        filled: true,
        suffixIcon: (widget.isRequired ?? false) ? Container(
          height: 8,
          width: 8,
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle
          ),
        ) : null,
        hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'kalpurush',),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: widget.fillColor ?? Colors.grey.shade100)
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: widget.fillColor ??  Colors.grey.shade100)
        ),
        contentPadding: const EdgeInsets.only(left: 11.76,right: 15.54,top: 12.35,bottom: 12.35)
      ),
    );
  }
}
