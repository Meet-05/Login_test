import '../screens/landing_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void signout(BuildContext ctx) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove('email');
  FirebaseAuth.instance.signOut();
  Navigator.push(ctx, MaterialPageRoute(builder: (context) => LandingScreen()));
}
