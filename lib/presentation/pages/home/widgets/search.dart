import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget{

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
      child: Row(
        children: [
          SvgPicture.asset(LocalIcons.search),
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10.w),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: const Color(0xff222222).withAlpha(76),
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          Container(
            width: 34.r,
            height: 34.r,
            decoration: BoxDecoration(
                color: ConstColors.orange,
                shape: BoxShape.circle
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(LocalIcons.menu),
              ),
            ),
          ),
        ],
      ),
    );
  }

}