import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/presentation/pages/detail/widgets/detail_images.dart';
import 'package:ecocotask/presentation/pages/detail/widgets/detail_info.dart';
import 'package:ecocotask/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 36.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      action: () => Navigator.of(context).pop(),
                      color: ConstColors.bluewDark,
                      icon: Icons.arrow_back_ios_new,
                      padding: EdgeInsets.all(8.r),
                      radius: 10,
                    ),
                    Text("Product Details"),
                    Button(
                      action: () => Navigator.of(context).pop(),
                      color: ConstColors.orange,
                      svg: LocalIcons.cart,
                      padding: EdgeInsets.all(13.r),
                      radius: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Expanded(child: DetailImages()),
              DetailInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
