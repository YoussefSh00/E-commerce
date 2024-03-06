import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:play_with_my_mind/models/products_model.dart';
import 'package:play_with_my_mind/screens/cart_screen.dart';
import 'package:play_with_my_mind/screens/product_screen.dart';
import 'package:play_with_my_mind/service/my_service.dart';
import 'package:play_with_my_mind/widgets/custom_container.dart';

class RowOfCategoriesAndProducts extends StatefulWidget {
  const RowOfCategoriesAndProducts({super.key});

  @override
  State<RowOfCategoriesAndProducts> createState() =>
      _RowOfCategoriesAndProductsState();
}

class _RowOfCategoriesAndProductsState
    extends State<RowOfCategoriesAndProducts> {
  List<ProductModel> allData = [];
  List<ProductModel> cart = [];
  bool isLoading = true;
  int x = 0;
  Future<List<ProductModel>> fillList() async {
    allData = await MyService().getAllProducts();
    isLoading = false;
    setState(() {});

    return allData;
  }

  Future<List<ProductModel>> fillListByCategory(String text) async {
    allData = await MyService().getOneCategory(text);
    isLoading = false;
    setState(() {});

    return allData;
  }

  @override
  void initState() {
    fillList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: LoadingAnimationWidget.flickr(
              leftDotColor: Colors.black,
              rightDotColor: Colors.yellow,
              size: 100.sp,
            ),
          )
        : Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              allData = await fillList();
                              x = 0;
                              setState(() {});
                            },
                            child: CustomContainer(
                              sizeForText: x == 0 ? 12 : 10,
                              height: x == 0 ? 70 : 60,
                              width: x == 0 ? 130 : 90,
                              colorText: x == 0 ? Colors.white : Colors.black,
                              index: x,
                              color: x == 0
                                  ? Colors.black
                                  : const Color.fromARGB(255, 228, 226, 226),
                              text: "All products",
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                            onTap: () async {
                              allData = await fillListByCategory("electronics");
                              x = 1;
                              setState(() {});
                            },
                            child: CustomContainer(
                              sizeForText: x == 1 ? 12 : 10,
                              height: x == 1 ? 70 : 60,
                              width: x == 1 ? 130 : 90,
                              colorText: x == 1 ? Colors.white : Colors.black,
                              index: x,
                              color: x == 1
                                  ? Colors.black
                                  : const Color.fromARGB(255, 228, 226, 226),
                              text: "Electronics",
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                            onTap: () async {
                              allData = await fillListByCategory("jewelery");
                              x = 2;
                              setState(() {});
                            },
                            child: CustomContainer(
                              sizeForText: x == 2 ? 12 : 10,
                              height: x == 2 ? 70 : 60,
                              width: x == 2 ? 130 : 90,
                              colorText: x == 2 ? Colors.white : Colors.black,
                              index: x,
                              color: x == 2
                                  ? Colors.black
                                  : const Color.fromARGB(255, 228, 226, 226),
                              text: "Jewelery",
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                              onTap: () async {
                                allData =
                                    await fillListByCategory("men's clothing");
                                x = 3;
                                setState(() {});
                              },
                              child: CustomContainer(
                                sizeForText: x == 3 ? 12 : 10,
                                height: x == 3 ? 70 : 60,
                                width: x == 3 ? 130 : 90,
                                colorText: x == 3 ? Colors.white : Colors.black,
                                index: x,
                                color: x == 3
                                    ? Colors.black
                                    : const Color.fromARGB(255, 228, 226, 226),
                                text: "Men's clothing",
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                            onTap: () async {
                              allData =
                                  await fillListByCategory("women's clothing");
                              x = 4;
                              setState(() {});
                            },
                            child: CustomContainer(
                              sizeForText: x == 4 ? 12 : 10,
                              height: x == 4 ? 70 : 60,
                              width: x == 4 ? 130 : 90,
                              colorText: x == 4 ? Colors.white : Colors.black,
                              index: x,
                              color: x == 4
                                  ? Colors.black
                                  : const Color.fromARGB(255, 228, 226, 226),
                              text: "Women's clothing",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: GridView.builder(
                        itemCount: allData.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10.sp,
                            mainAxisSpacing: 10.sp,
                            mainAxisExtent: 230.sp,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                      price: allData[index].price,
                                      image: allData[index].image,
                                      title: allData[index].title,
                                    ),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.sp)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 22.sp),
                                    child: Text(
                                      allData[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Image.network(
                                    allData[index].image,
                                    height: 110.h,
                                    width: 110.w,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.sp),
                                    child: Row(
                                      children: [
                                        Text(
                                          "\$${allData[index].price.toString()}",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            if (cart.contains(allData[index])) {
                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                duration:
                                                    const Duration(seconds: 3),
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  title: 'Oops!',
                                                  message:
                                                      'This product is already in the cart',
                                                  contentType:
                                                      ContentType.failure,
                                                ),
                                              );
                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(snackBar);
                                            } else {
                                              cart.add(allData[index]);
                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                duration:
                                                    const Duration(seconds: 3),
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  title: 'Successful',
                                                  message:
                                                      'The product has been successfully added to the cart',
                                                  contentType:
                                                      ContentType.success,
                                                ),
                                              );
                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(snackBar);
                                            }
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            EvaIcons.shoppingCartOutline,
                                            size: 25.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                left: MediaQuery.of(context).size.width / 3.9,
                bottom: MediaQuery.of(context).size.width / 25,
                child: Container(
                  width: 200.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(data: cart),
                              ));
                        },
                        icon: Icon(
                          EvaIcons.shoppingCart,
                          size: 35.sp,
                          color: const Color.fromARGB(255, 204, 255, 0),
                          shadows: [
                            Shadow(
                              color: const Color.fromARGB(255, 204, 255, 0),
                              blurRadius: 100.sp,
                            ),
                            Shadow(
                              color: const Color.fromARGB(255, 204, 255, 0),
                              blurRadius: 100.sp,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        cart.length.toString(),
                        style: TextStyle(
                            color: const Color.fromARGB(255, 204, 255, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
  }
}
