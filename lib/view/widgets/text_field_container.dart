import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constance.dart';

class TextFieldContainer extends StatelessWidget {
  final bool obscureText;
  final String hintext;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  const TextFieldContainer({
    Key? key,
    required this.hintext,
    this.onSaved,
    this.validator,
    required this.keyboardType,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        hintText: hintext,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            9,
          ),
          borderSide: BorderSide(
            color: KFormColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
