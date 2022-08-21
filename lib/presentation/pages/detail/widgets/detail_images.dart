import 'package:ecocotask/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailImages extends StatelessWidget {
  PageController pageController = PageController(viewportFraction: .6);

  ValueNotifier<int> page = ValueNotifier(0);

  var mock = [
  "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
  "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: (value) => page.value = value,
            controller: pageController,
            itemBuilder: (context, index) => _Items(item: mock[index]),
            itemCount: mock.length,
          ),
        ),
        SizedBox(height: 8.h,),
        ValueListenableBuilder<int>(
          valueListenable: page,
          builder: (context, data, _) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(mock.length, (index) => _Dots(isActive: index == data,))
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
              image: DecorationImage(
                image: NetworkImage(item),
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
