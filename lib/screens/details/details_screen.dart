import 'package:flutter/material.dart';
import '../../models/products.dart';
import 'components/add_card.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    print(agrs.product.id);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(product: agrs.product),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    final ProductDetailsArguments agrs =
    ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return AppBar(
      title: Column(
        children:  [
          Text(
            agrs.product.name,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
