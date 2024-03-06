import 'package:dio/dio.dart';
import 'package:play_with_my_mind/models/products_model.dart';

class MyService {
  Future<List<ProductModel>> getAllProducts() async {
    var respones = await Dio().get("https://fakestoreapi.com/products");
    List responesBody = respones.data;
    var data = responesBody.map((e) => ProductModel.fromJson(e)).toList();

    return data;
  }

  Future<List<ProductModel>> getOneCategory(String category) async {
    var respones =
        await Dio().get("https://fakestoreapi.com/products/category/$category");
    List responesBody = respones.data;
    var data = responesBody.map((e) => ProductModel.fromJson(e)).toList();
    return data;
  }
}
