import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/common/images.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/presentation/pages/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridShop extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (180/228).r,
        crossAxisSpacing: 20.r,
        mainAxisSpacing: 20.r,
        crossAxisCount: 2),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) =>  _Items(action: (){Utils.routerScreen(context, Detail());},));
  }

}

class _Items extends StatelessWidget{

  VoidCallback action;

  _Items({required this.action});

  ValueNotifier<bool> isFavorites = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
         Stack(
           children: [
             Image.asset(LocalImages.mock_sams),
             Positioned(right: 16.w, top: 11.h,child: Container(
                 decoration: const BoxDecoration(
                   color: ConstColors.white,
                   shape: BoxShape.circle
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0).r,
                   child: ValueListenableBuilder<bool>(
                     valueListenable: isFavorites,
                     builder: (context, data, _) {
                       return GestureDetector(
                           onTap: () => isFavorites.value = !isFavorites.value,
                           child: SvgPicture.asset(data ?LocalIcons.heart_on :LocalIcons.heart_off));
                     }
                   ),
                 )),)
           ],
         ),
          SizedBox(height: 8.h,),
          RichText(
            text: TextSpan(
              text: '\$1,047'+'  ',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ConstColors.bluewDark, fontSize: 16.sp),
              children: <TextSpan>[
                TextSpan(text: '\$1,500', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey, fontSize: 10.sp, decoration: TextDecoration.lineThrough,)),
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Text("Samsung Galaxy s20 Ultra", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10.sp))
        ],
      ),
    );
  }

}