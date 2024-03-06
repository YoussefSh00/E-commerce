import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_with_my_mind/widgets/row_of_categories_and_products.dart';
import 'package:play_with_my_mind/widgets/row_of_search_and_name.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Products",
          style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                RowOfSearchAndName(),
                Expanded(child: RowOfCategoriesAndProducts())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
