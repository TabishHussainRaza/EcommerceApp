import 'package:ecommerece_velocity_app/models/products.dart';
import 'dart:convert';

SingleProduct productFromJson(String str) => SingleProduct.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class SingleProduct {
  SingleProduct({
    required this.data,
  });

  Product data;

  factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
    data: Product.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}