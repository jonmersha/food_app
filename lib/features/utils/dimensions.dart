import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Dimensions{
  static double screenHeight=Get.context!.height;
  static double screenWidth=Get.context!.width;
  static double screenDiagonal=sqrt ((screenHeight*screenHeight)+(screenWidth*screenWidth));
  static double pageView = screenHeight/(screenHeight/320);
  static double margin30 = screenHeight/(screenHeight/30);
  static double padding10 = screenHeight/(screenHeight/10);
  static double icon26 = screenHeight/(screenHeight/26);

  static double pageViewContainer = screenHeight/(screenHeight/320);
  static double pageViewTextContainer = screenHeight/(screenHeight/220);

  static double height10 = screenHeight/(screenHeight/10);
  static double height15 = screenHeight/(screenHeight/15);
  static double height20 = screenHeight/(screenHeight/20);
  static double height30 = screenHeight/(screenHeight/30);
  static double height120 = screenHeight/(screenHeight/120);

  static double width10 = screenWidth/(screenWidth/10);
  static double width15 = screenWidth/(screenWidth/15);
  static double width20 = screenWidth/(screenWidth/20);
  static double width30 = screenWidth/(screenWidth/30);
  static double width40 = screenWidth/(screenWidth/40);
  static double width50 = screenWidth/(screenWidth/50);
  static double width60 = screenWidth/(screenWidth/60);
  static double width70 = screenWidth/(screenWidth/70);


  static double fontSize20 = screenHeight/(screenHeight/20);
  static double fontSize12 = screenHeight/(screenHeight/12);
  static double fontSize11 = screenHeight/(screenHeight/11);
  static double fontSize15 = screenHeight/(screenHeight/15);

  static double radius10 = screenDiagonal/(screenDiagonal/10);
  static double radius20 = screenDiagonal/(screenDiagonal/20);
  static double radius30 = screenDiagonal/(screenDiagonal/30);


  static double height300 = screenDiagonal/(screenDiagonal/300);





  //list view size
static double listViewIMG=screenWidth/3.25;
static double listViewTextView=screenWidth/3.25;
//static double listViewIMG=screenWidth/3.25;


static double popularFoodImageSize=screenHeight/2.41;

  static double height45=screenHeight/(screenHeight/45);
  static double iconSize16=screenHeight/(screenHeight/16);


  static double textHeight=screenHeight/(screenHeight/130);





}