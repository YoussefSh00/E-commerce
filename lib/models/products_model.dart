import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductModel extends Equatable {
  final int id;
  final num price;
  final String title;
  final String description;
  final String category;
  final String image;
    int count;

  ProductModel(
      {required this.id,
      required this.count,
      required this.price,
      required this.title,
      required this.description,
      required this.category,
      required this.image});

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json["id"],
      count: 0,
      price: json["price"],
      title: json["title"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, price, title, description, category, image, count];
}
