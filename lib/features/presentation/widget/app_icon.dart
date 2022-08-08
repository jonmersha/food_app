import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData iconData;
  final Color backGroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const AppIcon(
      {Key? key,
        this.iconSize=16,
       this.iconData=Icons.search,
       this.backGroundColor=Colors.white,
       this.iconColor=Colors.black54,
       this.size=45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backGroundColor
      ),
    child: Icon(
      iconData,
      color: this.iconColor,
      size: iconSize,),
    );
  }
}
