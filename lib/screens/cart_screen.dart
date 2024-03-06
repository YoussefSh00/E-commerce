import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_with_my_mind/models/products_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.data});
  final List<ProductModel> data;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget.data.isEmpty
          ? const Center(
              child: const Text("Empty"),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            widget.data[index].image,
                            width: 50.w,
                            height: 50.h,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  widget.data[index].count++;
                                  setState(() {});
                                },
                                icon: Icon(EvaIcons.plus),
                              ),
                              Text(
                                widget.data[index].count.toString(),
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              IconButton(
                                onPressed: () {
                                  widget.data[index].count--;
                                  setState(() {});
                                },
                                icon: Icon(EvaIcons.minus),
                              ),
                            ],
                          ),
                          title: Text(
                            widget.data[index].title,
                            maxLines: 1,
                          ),
                          subtitle:
                              Text("\$${widget.data[index].price.toString()}"),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
