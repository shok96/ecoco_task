/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 22:01
 *
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailImages extends StatelessWidget {
  PageController pageController = PageController(viewportFraction: .6);

  ValueNotifier<int> page = ValueNotifier(0);

  List<String> pData;

  DetailImages({required this.pData}){
    if(pData.isEmpty){
      pData.add(LocalImages.no_photo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: (value) => page.value = value,
            controller: pageController,
            itemBuilder: (context, index) => _Items(item: pData[index]),
            itemCount: pData.length,
          ),
        ),
        SizedBox(height: 8.h,),
        ValueListenableBuilder<int>(
          valueListenable: page,
          builder: (context, data, _) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(pData.length, (index) => _Dots(isActive: index == data,))
            );
          }
        ),
      ],
    );
  }
}

class _Items extends StatelessWidget {
  String item;

  _Items({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: ConstColors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5.h),
              blurRadius: 3,
              color: Colors.grey.shade300
            )
          ],
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Container(
            decoration: BoxDecoration(
              image: item.startsWith("http") ? DecorationImage(
                image: CachedNetworkImageProvider(item),
                fit: BoxFit.fill
              ) : DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.fill
              )
            ),
          ),
        ),
      )
    );
  }
}

class _Dots extends StatelessWidget{

  bool isActive;

  _Dots({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? ConstColors.bluewDark : Colors.grey.shade300,
          shape: BoxShape.circle
        ),
        width: 10.r,
        height: 10.r,
      ),
    );
  }

}
