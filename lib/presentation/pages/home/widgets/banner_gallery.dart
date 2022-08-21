import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/common/images.dart';
import 'package:ecocotask/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerGallery extends StatelessWidget {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.h,
        child: PageView.builder(
          itemBuilder: (context, index) => _Items(),
          itemCount: 3,
          scrollDirection: Axis.horizontal,
        ));
  }
}

class _Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          image: DecorationImage(
              image: AssetImage(LocalImages.mock_iphone_banner))),
      child: Padding(
        padding: EdgeInsets.only(left: 32.w, top: 23.h, bottom: 26.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _News(),
            RichText(
              text: TextSpan(
                text: 'Iphone 12\n',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: ConstColors.white, fontSize: 25.sp),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Súper. Mega. Rápido.',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: ConstColors.white, fontSize: 11.sp)),
                ],
              ),
            ),
            Button(
                action: () {},
                color: ConstColors.white,
                text: "Buy now!",
                text_color: ConstColors.bluewDark,
                padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 5.h)),
          ],
        ),
      ),
    );
  }
}

class _News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstColors.orange,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
        child: Text(
          "New",
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: ConstColors.white, fontSize: 10.sp),
        ),
      ),
    );
  }
}
