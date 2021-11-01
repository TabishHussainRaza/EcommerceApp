import 'dart:convert';
import 'package:ecommerece_velocity_app/components/default_button.dart';
import 'package:ecommerece_velocity_app/components/rounded_icon_btn.dart';
import 'package:ecommerece_velocity_app/models/oneProduct.dart' as OP;
import 'package:ecommerece_velocity_app/models/products.dart';
import 'package:ecommerece_velocity_app/size_config.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  BodyContent createState() => BodyContent();
}

class BodyContent extends State<Body> {
  int quantity = 1;
  late Product CorrectProduct;

  final _closeMemo = AsyncMemoizer();

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
    print(widget.product.id);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
        future: getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              //child:
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    value: snapshot.data,
                    semanticsLabel: 'Progress indicator',
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const Text(
                    'Please wait while it is loading.. ',
                  ),
                ],
              ),

            );
          }  else if (snapshot.connectionState == ConnectionState.done){
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            else if (snapshot.hasData == true){
              return ListView(
                children: [
                  ProductImages(product: CorrectProduct),
                  ProductDescription(
                    product: CorrectProduct,
                    pressOnSeeMore: () {},
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
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
                                  left: getProportionateScreenWidth(15),
                                  top: getProportionateScreenWidth(10),
                                ),
                                child:
                                Text(
                                    CorrectProduct.formatedPrice,textAlign: TextAlign.justify,style: new TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold)
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
                                      CorrectProduct.isWishlisted ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    child:
                                  Row(
                                    children: [
                                      RoundedIconBtn(
                                        icon: Icons.remove,
                                        showShadow: true,
                                        press: () {
                                          decrement_quantity();
                                        },
                                      ),
                                      SizedBox(width: getProportionateScreenWidth(25)),
                                      Text("$quantity"),
                                      SizedBox(width: getProportionateScreenWidth(25)),
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
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(15),
                      top: getProportionateScreenWidth(20),
                        right: getProportionateScreenWidth(15)
                    ),
                    child:   DefaultButton(
                      text: "Add To Cart",
                      press: () {},
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(15),
                      top: getProportionateScreenWidth(15),
                    ),
                    child: const Text(
                        "Product Details",style: TextStyle(fontSize: 18.0,
                      fontWeight: FontWeight.w800,)
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(15),
                      right: getProportionateScreenWidth(20),
                      top: getProportionateScreenWidth(15),
                      bottom: getProportionateScreenWidth(20),
                    ),
                    child: Text(
                        CorrectProduct.description,textAlign: TextAlign.justify,style: TextStyle(fontSize: 16.0,
                      )
                    ),
                  ),


                  SizedBox(width: getProportionateScreenWidth(50)),
                ],
              );
            }
            else{
              return Center(
                //child:
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'Oops', style: TextStyle(fontSize: getProportionateScreenWidth(35),fontWeight: FontWeight.w800),),
                            SizedBox(height: SizeConfig.screenHeight * 0.01),
                            Text(
                                'Looks like something went wrong',
                                style: TextStyle(fontSize: getProportionateScreenWidth(15))),
                            ],
                        ),
                      ),
                    ),

                  ],
                ),

              );
            }
          }
          else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );


  }

  getProduct()  {
    return this._closeMemo.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      var id = widget.product.id;
      String url = serverUrl+"products/$id";
      var response = await http.get(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Connection': 'keep-alive',
          }
      );
      if(response.statusCode == 200) {
        var jsonResponse = await json.decode(response.body);
        if(jsonResponse != null) {
          CorrectProduct = OP.productFromJson(response.body).data;
          CorrectProduct.description = removeAllHtmlTags(CorrectProduct.description);
          print(CorrectProduct.description);
          return CorrectProduct;
        }else{
          return null;
        }
      }
      else {
        throw ("Not found");
      }
    });

  }
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );
    return htmlText.replaceAll(exp, '');
  }
}
