// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/foundation.dart';

// class AuthProvider extends ChangeNotifier {
//   bool _isSigningIn;
//   final _auth = FirebaseAuth.instance;
//   AuthProvider() {
//     _isSigningIn = false;
//   }

//   bool get isSigningIn => _isSigningIn;
//   Future<dynamic> login(String email, String password) async {
//     _isSigningIn = true;
//     try {
//       final user = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       if (user != null) {
//         _isSigningIn = false;
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future register(String email, String password) async {
//     _isSigningIn = true;
//     try {
//       final newUser = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       if (newUser != null) {
//         _isSigningIn = false;
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void logout() async {
//     FirebaseAuth.instance.signOut();
//   }
// }
