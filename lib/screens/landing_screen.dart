import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './dashboard_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants.dart';
import './hr_screen.dart';
import './emp_screen.dart';
import './admin_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var _form = GlobalKey<FormState>();
  String email;
  String password;
  bool _isSigningIn = false;
  final _auth = FirebaseAuth.instance;

  void onTap(int number) async {
    var user;
    if (_form.currentState.validate()) {
      _form.currentState.save();
      setState(() {
        _isSigningIn = true;
      });
      print(email);
      try {
        if (number == 1) {
          user = await _auth.signInWithEmailAndPassword(
              email: email, password: password);
        } else if (number == 0) {
          user = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
        }
        if (user != null) {
          setState(() {
            _isSigningIn = false;
          });
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('email', email);
          Fluttertoast.showToast(msg: 'loggedin Succesfully');
          //new users will be employee
          roles.putIfAbsent(email, () => 0);
          int decide = roles[email];
          switch (decide) {
            //0:Employee
            case 0:
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EmpScreen()));
              }
              break;
            //1:Hr
            case 1:
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HrScreen()));
              }
              break;
            //0:Admin
            case 2:
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminScreen()));
              }
              break;
          }
        }
      } catch (e) {
        print(e);
        Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.amber,
        );
        setState(() {
          _isSigningIn = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isSigningIn
          ? CircularProgressIndicator()
          : Container(
              margin: EdgeInsets.all(25.0),
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildEmailField(),
                    SizedBox(height: 20.0),
                    buildPassowrdField(),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildMaterialButton(
                          text: "Login",
                          onTap: () {
                            onTap(1);
                          },
                        ),
                        buildMaterialButton(
                          text: "Register",
                          onTap: () {
                            onTap(0);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  MaterialButton buildMaterialButton({String text, Function onTap}) {
    return MaterialButton(
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Text(
            text,
          ),
        ),
        onPressed: onTap);
  }

  TextFormField buildPassowrdField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Title is empty';
        }
        return null;
      },
      onSaved: (value) {
        password = value;
      },
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'emailId',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Title is empty';
        }
        return null;
      },
      onSaved: (value) {
        email = value;
      },
    );
  }
}
