import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.price});
  final String image;
  final String title;
  final num price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 20.h,
            right: -150,
            child: Image.network(
              image,
              height: 480.h,
              width: 480.w,
            ),
          ),
          Positioned(
            top: 100.h,
            right: 200.w,
            child: Container(
              alignment: Alignment.center,
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Text(
                "\$${price.toString()}",
                style: TextStyle(
                    color: const Color.fromARGB(255, 204, 255, 0),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 250.h,
            right: 200.w,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15 / -150),
              child: Container(
                alignment: Alignment.center,
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black),
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(40 / -150),
                  child: Icon(
                    EvaIcons.arrowBack,
                    size: 30.sp,
                    color: const Color.fromARGB(255, 204, 255, 0),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 210.h,
            right: 235.w,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15 / -150),
              child: Container(
                alignment: Alignment.center,
                width: 10.w,
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black),
              ),
            ),
          ),
          Positioned(
            top: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: 300.w,
              height: 150.h,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    decorationThickness: 15),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 3.9,
            bottom: MediaQuery.of(context).size.width / 25,
            child: Container(
              alignment: Alignment.center,
              width: 200.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 204, 255, 0),
              ),
              child: Text(
                "Order now",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
