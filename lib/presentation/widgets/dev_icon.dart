
/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 18:27
 *
 */

import 'package:ecocotask/core/common/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum DevMode{
  Flutter,
  Android,
  Java,
  Python,
  Django,
  Postgre,
  Kotlin,
  Firebase,
  Admob,
  Gpay,
  React
}

class DevIcon extends StatelessWidget {

  DevMode mode;

  DevIcon({Key? key, required this.mode}) : super(key: key);

  String pathIcon(){
    switch(mode){
      case DevMode.Flutter:
       return "";
      case DevMode.Android:
        return LocalIcons.dev_android;
      case DevMode.Java:
        return LocalIcons.dev_java;
      case DevMode.Python:
        return LocalIcons.dev_python;
      case DevMode.Django:
        return LocalIcons.dev_django;
      case DevMode.Postgre:
        return LocalIcons.dev_postgre;
      case DevMode.Kotlin:
        return LocalIcons.dev_kotlin;
      case DevMode.Firebase:
        return LocalIcons.dev_firebase;
      case DevMode.Admob:
        return LocalIcons.dev_admob;
      case DevMode.Gpay:
        return LocalIcons.dev_pay;
      case DevMode.React:
        return LocalIcons.dev_react;
    }
  }

  Widget getIcon(){
    if(mode == DevMode.Flutter){
      return FlutterLogo();
    }
    else{
      return SvgPicture.asset(pathIcon());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.r,
      height: 48.r,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      padding: EdgeInsets.all(4).r,
      child: getIcon(),
    );
  }
}
