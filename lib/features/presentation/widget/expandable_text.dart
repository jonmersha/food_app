import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key,required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText=true;

  double textHeight=Dimensions.textHeight;
  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf=widget.text.substring(0,textHeight.toInt());
      secondHalf=widget.text.substring(textHeight.toInt()+1,widget.text.length);

    }else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf,):Container(
        child: Column(
          children: [
            SmallText(text: hiddenText?(firstHalf+"..."):firstHalf+secondHalf,size: Dimensions.fontSize15),
            InkWell(
              onTap: (){ 
                setState(() {
                  hiddenText=!hiddenText;
                });
              },
              child: Row(
                children: [
                  SmallText(text: hiddenText?"ShowMore":"ShowLess",color:AppColors.mainColor,),
                  Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color:AppColors.mainColor)
                ],
              )
            )

          ],

        ),
      )
    );
  }
}
