import 'package:flutter/material.dart';

import '../../constance.dart';

class ValidationButton extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  const ValidationButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

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
        minimumSize: Size(
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
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
