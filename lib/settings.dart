import 'package:flutter/material.dart';


// ######################## COLOR ########################
const mBlue = Color(0xFF3B74DB);
const mGraywhite = Color(0xFFF4F4F4);
const mGray = Color(0xFFD3D3D3);
const mGreen = Color(0xFF4BA54D);
const mRed = Color(0xFFA40606);
// #######################################################

// ####################### OUTLINE #######################
var ActiveOutLine = OutlineInputBorder( borderSide: BorderSide(color: mGray, width: 2), borderRadius: BorderRadius.circular(100));
var PressOutLine = OutlineInputBorder( borderSide: BorderSide(color: mBlue, width: 2), borderRadius: BorderRadius.circular(100),);
// #######################################################

const kDefaultPadding = EdgeInsets.symmetric(horizontal: 30);

// ##################### TEXT STYLE #####################
TextStyle titleText = TextStyle( 
      fontSize: 32, 
      fontWeight: FontWeight.bold,
);

TextStyle subTitle = TextStyle(
    fontSize: 14, 
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 180, 180, 180),
);

TextStyle textButton = TextStyle(  
  fontSize: 18,
  fontWeight: FontWeight.w700,
);
// ######################################################