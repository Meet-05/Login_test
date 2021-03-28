import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_test/screens/landing_screen.dart';
import './screens/emp_screen.dart';
import './screens/hr_screen.dart';
import './screens/landing_screen.dart';
import './screens/admin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(MaterialApp(
    home: email == null ? LandingScreen() : decideScreen(email),
  ));
}

Widget decideScreen(String email) {
  switch (roles[email]) {
    //0:Employee
    case 0:
      {
        return EmpScreen();
      }
      break;
    //1:Hr
    case 1:
      {
        return HrScreen();
      }
      break;
    //0:Admin
    case 2:
      {
        return AdminScreen();
      }
      break;
  }
}
