import 'package:ecommerece_velocity_app/components/default_button.dart';
import 'package:ecommerece_velocity_app/components/rounded_icon_btn.dart';
import 'package:ecommerece_velocity_app/models/Product.dart';
import 'package:ecommerece_velocity_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:ecommerece_velocity_app/models/products.dart' as Pro;
import 'color_dots.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  BodyContent createState() => BodyContent();
}

class BodyContent extends State<Body> {
  int quantity = 1;
  late Pro.Product CorrectProduct = Pro.Product(
      id: 1,
      sku: '14121412',
      type: 'simple',
      name: 'Gluten Free Bakehouse Garlic Bread 300g',
      urlKey: 'Gluten Free Bakehouse Garlic Bread 300g',
      price: '3.80',
      shortDescription: 'Gluten Free Bakehouse Garlic Bread is both gluten free and vegan friendly. Our crusty, golden garlic bread has no artificial flavours or colours, just good honest ingredients.',
      description: 'Gluten Free Bakehouse Garlic Bread is both gluten free and vegan friendly. Our crusty, golden garlic bread has no artificial flavours or colours, just good honest ingredients.',
      images: [
        Pro.image(
            id: 1,
            path: "product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            url: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            originalImageUrl: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            smallImageUrl: "http://192.168.8.193:8090/cache/small/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            mediumImageUrl: "http://192.168.8.193:8090/cache/medium/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"

        )
      ],
      videos: [],
      baseImage: Pro.BaseImage(
          smallImageUrl: "http://192.168.8.193:8090/cache/small/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          mediumImageUrl: "http://192.168.8.193:8090/cache/medium/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          originalImageUrl: "http://192.168.8.193:8090/cache/original/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"
      ),
      createdAt: DateTime.parse("2021-08-29T01:34:43.000000Z"),
      updatedAt: DateTime.parse("2021-08-29T01:34:43.000000Z"),
      reviews: Pro.Reviews(
          total: 0,
          totalRating: 0,
          averageRating: 0,
          percentage: []
      ),
      inStock: true,
      isSaved: false,
      isWishlisted: false,
      isItemInCart: false,
      showQuantityChanger: true,
      formatedPrice: '10,000.00');

  increment_quantity() {
    setState(() {
      quantity++;
    });
  }

  decrement_quantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: CorrectProduct),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: CorrectProduct,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(20),
                        right: getProportionateScreenWidth(20),
                        bottom: getProportionateScreenWidth(20),
                      ),
                      child: Row(
                        children: [
                          const Text("Quantity: "),
                          const Spacer(),
                          RoundedIconBtn(
                            icon: Icons.remove,
                            showShadow: true,
                            press: () {
                              decrement_quantity();
                            },
                          ),
                          SizedBox(width: getProportionateScreenWidth(20)),
                          Text("$quantity"),
                          SizedBox(width: getProportionateScreenWidth(20)),
                          RoundedIconBtn(
                            icon: Icons.add,
                            showShadow: true,
                            press: () {
                              increment_quantity();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(40)),/*
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(20),
                          top: getProportionateScreenWidth(10),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {},
                        ),
                      ),
                    ),*/

                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
