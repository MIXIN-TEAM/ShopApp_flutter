import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constance.dart';

class Tile extends StatelessWidget {
  late final String text;
  late final String image;
  final void Function()? onPressed;
  Tile({
    required this.text,
    required this.image,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        title: Text(text),
        leading: SvgPicture.asset(
          image,
          height: 30,
          width: 30,
        ),
        trailing: Icon(
          Icons.navigate_next,
          color: Ksecondarycolor,
        ),
      ),
    );
  }
}
