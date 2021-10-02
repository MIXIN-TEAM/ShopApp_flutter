import 'package:flutter/material.dart';

import '../../constance.dart';

class ValidationButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;
  ValidationButton(
    this.text,
    this.onPress,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Kprimarycolor,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            9,
          ),
        ),
        maximumSize: Size(
          180,
          50,
        ),
      ),
      onPressed: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 11,
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
