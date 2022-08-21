import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/presentation/widgets/button.dart';
import 'package:ecocotask/presentation/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetFilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ConstColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  action: () => Navigator.of(context).pop(),
                  color: ConstColors.bluewDark,
                  icon: Icons.close,
                  padding: EdgeInsets.all(8.r),
                  radius: 10,
                ),
                Text("Filter options"),
                Button(
                  action: () => Navigator.of(context).pop(),
                  color: ConstColors.orange,
                  text: "Done",
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  radius: 10,
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            DropDownMenu(
              title: "Brand",
              values: ["Samsung", "LG", "Pixel"],
            ),
            DropDownMenu(
              title: "Price",
              values: mockprice(10000, 500),
            ),
            DropDownMenu(
              title: "Size",
              values: [
                "4.5 to 5.5 inches",
                "5.5 to 6.5 inches",
                "6.5 to 7.5 inches"
              ],
            ),
          ],
        ),
      ),
    );
  }

  Iterable<String> mockprice(int max, int step) sync* {
    for (int i = 0; i < max; i += step) {
      yield "\$${i} - \$${i + step}";
    }
  }
}
