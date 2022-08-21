import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownMenu extends StatelessWidget {
  String title;
  Iterable<String> values;

  DropDownMenu({required this.title, required this.values});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: 6.h,),
          SizedBox(
            width: double.infinity,
            child: DropdownButtonFormField<String>(
              isDense: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10.w, top: 7.h,bottom: 7.h),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(color: const Color(0xFFDCDCDC), width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(color: Colors.blue, width: 2)),
              ),
              value: values.first,
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              elevation: 16,
              onChanged: (String? newValue) {

              },
              items: values
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
