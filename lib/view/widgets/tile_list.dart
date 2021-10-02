import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constance.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tile extends StatelessWidget {
  late final String text;
  late final String image;
  final VoidCallback? onPressed;
  Tile({
    required this.text,
    required this.image,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(text),
      leading: SvgPicture.asset(
        image,
        height: 30.h,
        width: 30.h,
      ),
      trailing: text == 'Log Out'
          ? null
          : Icon(
              Icons.navigate_next,
              color: Ksecondarycolor,
            ),
    );
  }
}
