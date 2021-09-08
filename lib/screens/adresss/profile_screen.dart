import 'dart:convert';

import 'package:ecommerece_velocity_app/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../enums.dart';
import '../../size_config.dart';
import 'components/body.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Addresses"),
      ),
        body:
        Column(
            children: <Widget>[
              const SizedBox(height: 30),
              Text("My Addresses", style: headingStyle),
              const SizedBox(height: 30),
              const Expanded(
                  child: AddressBody()
              )
            ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add Address',
          child: const Icon(Icons.add),
          backgroundColor: const Color(0xFF00821E),
          focusColor: const Color(0xFF00821E),
          foregroundColor: const Color(0xFFFFFFFF),
          hoverColor: const Color(0xFFFF7643),
          splashColor: const Color(0xFFFF7643),
        ),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile));
  }


}
