import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

import '../../keys.dart';
import '../../models/user_model.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChange => _auth.authStateChanges();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// login method, it takes email and password as a parameter
  Future<Users> login({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return await getUserById();
  }

// signUp
  Future<void> signUp({required Users users}) async {
    await _auth
        .createUserWithEmailAndPassword(
            email: users.email!, password: users.password!)
        .then((value) async {
      users.uid = currentUser!.uid;
      await firebaseFirestore
          .collection("users")
          .doc(currentUser!.uid)
          .set(users.toJson());
    });
  }

  final String baseApi = "https://api.lenco.ng/access/v1/";
  var craetelencoAcctHeader = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8',
    "Authorization": "Bearer $seckeys"
  };
  Future<Response> createLencoAcct({required Users user}) async {
    final endpoint = Uri.parse("${baseApi}virtual-accounts");
    final body = {
      "accountName": user.fullname,
      "isStatic": true,
      "transactionReference": user.uid,
      "bvn": bcode,
      "createNewAccount": true
    };
    final response = await post(
      endpoint,
      body: json.encode(body),
      headers: craetelencoAcctHeader,
    );
    return response;
  }

// logout
  void signOut() async {
    await _auth.signOut();
  }

// get user info from firebase with id
  Future<Users> getUserById() async {
    return await firebaseFirestore
        .collection('users')
        .doc(currentUser!.uid)
        .get()
        .then((value) => Users.fromJson(value));
  }

  Future<void> updateUserInfo(Users users) async {
    await firebaseFirestore
        .collection('users')
        .doc(users.uid)
        .update(users.toJson());
  }

// check and verify email
  Future<bool> verifyEmail() async {
    await _auth.currentUser!.reload();
    final isVerified = _auth.currentUser!.emailVerified;
    if (isVerified == true) {
      return true;
    } else {
      await _auth.currentUser!.sendEmailVerification();
      return false;
    }
  }

// forgot password, it will send a password reseting link to the user email if it exist
  Future<void> forgortPasword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  String errorMessage(error) {
    // Handling possible errors
    switch (error) {
      case 'email-already-in-use':
        return "Email already in used";

      case 'network-request-failed':
        return "No internet connection";
      case 'invalid-email':
        return "Wrong email format";

      case 'user-not-found':
        return "Incorrect email";

      case 'wrong-password':
        return "Wrong Password";

      case 'too-many-requests':
        return "Too many request, wait for 30 seconds and try again";
      default:
        return "Unknown error, make sure you have internet connection.";
    }
  }
}
