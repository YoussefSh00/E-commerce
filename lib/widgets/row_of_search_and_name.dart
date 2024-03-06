import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowOfSearchAndName extends StatelessWidget {
  const RowOfSearchAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60.h,
          margin: EdgeInsets.only(top: 10.sp, bottom: 20.sp, left: 10.sp),
          width: MediaQuery.of(context).size.width * .4,
          child: TextField(
            decoration: InputDecoration(
              hintStyle:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              suffixIcon: Container(
                margin: EdgeInsets.only(right: 10.sp),
                alignment: Alignment.center,
                width: 45.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 204, 255, 0),
                ),
                child: const Icon(
                  EvaIcons.options,
                ),
              ),
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.sp),
              ),
            ),
          ),
        ),
        const Spacer(),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10.sp, bottom: 15.sp),
          height: 56.h,
          width: MediaQuery.of(context).size.width * .4,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: .7.w),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            "Youssef",
            style: TextStyle(fontSize: 18.sp),
          ),
        )
      ],
    );
  }
}
