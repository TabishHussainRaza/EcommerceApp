import 'package:flutter/material.dart';
import 'package:ecommerece_velocity_app/models/products.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  /**
   * DefaultButton(
      text: "Add To Cart",
      press: () {},
      ),
   */

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(20),
                        top: getProportionateScreenWidth(10),
                      ),
                      child:
                      Row(
                        children: [
                          if (product.inStock) const Text("In Stock", style: TextStyle(color: Colors.green,fontWeight: FontWeight.w800,) ) else const Text("Out of Stock", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800,),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                          decoration: BoxDecoration(
                            color:
                            product.isWishlisted ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            "\$ ${product.price}",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(20),
                              fontWeight: FontWeight.w800,
                              color: kPrimaryColor,
                            ),
                          )
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            top: getProportionateScreenWidth(15),
          ),
          child: const Text(
              "Product Details",style: TextStyle(
            fontWeight: FontWeight.w800,)
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20),
            top: getProportionateScreenWidth(15),
          ),
          child: Text(
            product.description,textAlign: TextAlign.justify
          ),
        ),

      ],
    );
  }
}


