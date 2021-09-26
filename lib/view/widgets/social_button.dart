import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constance.dart';

class SocialButton extends StatelessWidget {
  final String social;
  final String text;
  final void Function()? onPressed;
  const SocialButton({
    Key? key,
    required this.social,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            9,
          ),
          side: BorderSide(
            color: Kprimarycolor,
          ),
        ),
        minimumSize: Size(
          180,
          50,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svg/$social.svg',
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: KtextColor,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}
