import 'package:beetleware_task/model/color_model.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controllerInput;
  final Widget prefixIcon;
  final bool obsecureText;
  final Function inputValidation;

  const CustomInput(
      {Key key,
      this.hintText,
      this.controllerInput,
      this.prefixIcon,
      this.obsecureText,
      this.inputValidation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: inputValidation,
      controller: controllerInput,
      obscureText: obsecureText,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Container(
            decoration: BoxDecoration(
                color: ColorModel.mainColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3))),
            margin: const EdgeInsetsDirectional.only(end: 7.0),
            child: prefixIcon,
          ),
          border: OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
          hintText: hintText),
    );
  }
}
