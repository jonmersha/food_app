import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final double textSize;
  final String text;
  final Color textColor;
  final Color iconColor;
  const TextWithIcon({Key? key, required this.icon, required this.text, required this.textColor, required this.iconColor,  this.iconSize=20, this.textSize=12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: iconSize,),
        SizedBox(width: 5,),
        SmallText(text: text,color: textColor,size: textSize,)
      ],
    );
  }
}
