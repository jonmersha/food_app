import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  TextOverflow textOverflow;

  BigText(
      {Key? key,
      this.color = Colors.black,
      this.text = "",
      this.textOverflow = TextOverflow.ellipsis,
      this.size = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: this.textOverflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
