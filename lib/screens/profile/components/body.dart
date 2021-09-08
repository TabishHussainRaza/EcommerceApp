import 'package:ecommerece_velocity_app/screens/adresss/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../complete_profile/complete_profile_screen.dart';
import '../../sign_in/sign_in_screen.dart';
import '../../splash/splash_screen.dart';
import 'package:http/http.dart' as http;

import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  _ProfileBody createState() => _ProfileBody();
}
class _ProfileBody extends State<ProfileBody> {
  bool _isLoading = false;
  var errorMsg;

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    loginStatus();
  }

  loginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => SignInPage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.01),
          Text("My Profile", style: headingStyle),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const CompleteProfileScreen()), (Route<dynamic> route) => true)
            },
          ),
          ProfileMenu(
            text: "My Orders",
            icon: "assets/icons/Bell.svg",
            press: () {
              },
          ),
          ProfileMenu(
            text: "My Address Book",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const AddressScreen()), (Route<dynamic> route) => true);
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              //logout();
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => SplashScreen()), (Route<dynamic> route) => false);

            },
          ),
        ],
      ),
    );
  }

  logout() async {
    String url = serverUrl + "customer/logout";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
        setState(() {
          _isLoading = false;
        });
        const snackBar = SnackBar(content: Text('Logged Out Successfully'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        sharedPreferences.clear();
        sharedPreferences.commit();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => SplashScreen()), (Route<dynamic> route) => false);

    }
    else {
      setState(() {
        _isLoading = false;
      });
      errorMsg = response.body;
      const snackBar = SnackBar(content: Text('Oops! Ran into some problem. Try again'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
