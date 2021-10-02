import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constance.dart';

class TextFieldContainer extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final String initialValue;
  final String? errorText;
  final TextInputType? keyboardType;
  final void Function(String?) onSaved;
  final FormFieldValidator<String>? validator;
  const TextFieldContainer({
    Key? key,
    required this.hintText,
    required this.onSaved,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.errorText,
    this.initialValue = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.next,
      autocorrect: false,
      style: TextStyle(
        color: KtextFormColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        errorText: errorText,
        contentPadding: EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            9,
          ),
          borderSide: BorderSide(
            color: KFormColor,
            width: 2,
          ),
        ),
        fillColor: Colors.white,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            9,
          ),
          borderSide: BorderSide(
            color: Kprimarycolor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
