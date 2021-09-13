import 'package:ecommerece_velocity_app/models/address.dart';
import 'package:ecommerece_velocity_app/models/orders.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class Body extends StatefulWidget {
  Order MyOrder;
  Body({Key? key, required this.MyOrder}) : super(key: key);

  @override
  BodyContent createState() => BodyContent();
}
class BodyContent extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Order Details ", style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight: FontWeight.w800)),
                Text("Order ID: " + widget.MyOrder.id.toString(), overflow: TextOverflow.ellipsis),
                Text("Order Status: " + widget.MyOrder.status.toString(), overflow: TextOverflow.ellipsis),
                Text("Order Placed on: " + widget.MyOrder.createdAt.toString(), overflow: TextOverflow.ellipsis),

                SizedBox(height: SizeConfig.screenHeight * 0.06),
                Text("Item Details ", style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight: FontWeight.w800)),
                Text("Total Items Ordered: " + widget.MyOrder.items.length.toString()),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: widget.MyOrder.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          color: const Color(0xFFF5F6F9),
                          //primary: kPrimaryColor,
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 0.0,
                          //backgroundColor: const Color(0xFFF5F6F9),
                          child: ListTile(
                            title: Text(widget.MyOrder.items[index].name, style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight: FontWeight.w500)),
                            subtitle: Text("Qty:             Ordered: "+widget.MyOrder.items[index].qtyOrdered.toString() + " \n"
                                "                    Shipped: "+widget.MyOrder.items[index].qtyShipped.toString() + " \n"
                                "                    Cancelled: "+widget.MyOrder.items[index].qtyCanceled.toString() + " \n"
                                "                    Refunded: "+widget.MyOrder.items[index].qtyRefunded.toString() + " \n\n"
                                "Price:           "+widget.MyOrder.items[index].formatedBasePrice + " \n"
                                "Subtotal:     "+widget.MyOrder.items[index].formatedBaseTotal + " \n"

                            ),
                          )
                      );
                    }),

                SizedBox(height: SizeConfig.screenHeight * 0.06),
                Text("Price Details ", style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight: FontWeight.w800)),
                Text("Subtotal: " + widget.MyOrder.formatedBaseSubTotal),
                Text("Shipping and Handling: " + widget.MyOrder.formatedShippingAmount),
                Text("Tax: " + widget.MyOrder.formatedTaxAmount),
                Text("Discount: " + widget.MyOrder.formatedDiscountAmount),
                Text("Grandtotal: " + widget.MyOrder.formatedGrandTotal),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                 Text("Shipment and Payment Info" , style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight: FontWeight.w800)),
                Text("Shipping Address \n" + widget.MyOrder.shippingAddress.address1[0] +", "+ widget.MyOrder.shippingAddress.city +", "+ widget.MyOrder.shippingAddress.state +", "+ widget.MyOrder.shippingAddress.country),
                Text("Shipping Method \n" + widget.MyOrder.shippingMethod),
                Text("Payment Method \n" + widget.MyOrder.paymentTitle),
                SizedBox(height: getProportionateScreenHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

