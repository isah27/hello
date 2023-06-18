import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_access/models/lenco_acct_model.dart';

import '../../models/user_model.dart';
import '../../repo/auth repository/auth_repo.dart';
import '../../repo/auth repository/local repo/expense_db.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<SwiftAccessStates> {
  AuthBloc(this._userRepository) : super(AuthInitialState());
  DataBaseHelper localDb = DataBaseHelper.instance;
  Users user = Users();
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController(text: "" ?? "");
  final phoneNoController = TextEditingController();
  final addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Users localUser = Users();

  loadApp() async {
    localUser = await localDb.fetchUser() ?? Users();
    emailController.text = localUser.email ?? "";
    await Future.delayed(const Duration(seconds: 1));
    emit(AuthLoadedState());
  }

  void checkAuthStatusEvent() async {
    await Future.delayed(const Duration(seconds: 3));
    final user = _userRepository.currentUser ?? "";
    if (user.toString().isNotEmpty) {
      // final isVerified = await _userRepository.verifyEmail();
      // if (isVerified==true) {
      emit(AuthenticatedState());
      // } else {
      // emit(EmailNotVerifiedState());
      // }
    } else {
      emit(SignedOutState());
    }
  }

  void loginEvent() async {
    emit(AuthLoadingState());
    try {
      user = await _userRepository.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      log(user.username.toString());
      //  final isVerified = await _userRepository.verifyEmail();
      // if (isVerified==true){
      //API Secret Key
// 	09e596605df91f77f4ce86ab4b57fc5bc9f309019df03f16afa4dcf80bd11fbe
// Public Key
// 	pub-78cf2597b561f33af83fba15316c7c422bc76f14c6959367
      if (user.accountRef == null) {
        await createLencoAcctEvent();
      }
      emit(AuthenticatedState());
      if (localUser.username == null && user.username != null) {
        user.password = passwordController.text.trim();
        localDb.insertUser(user);
        log("saved to local database");
      }
      emailController.clear();
      passwordController.clear();
      // }else{
      //    emit(EmailNotVerifiedState());
      // }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorsState(error: _userRepository.errorMessage(e.code)));
    }
  }

  Future<void> createLencoAcctEvent() async {
    emit(AuthLoadingState());
    try {
      await _userRepository.createLencoAcct(user: user).then((value) async {
        if (value.statusCode == 200) {
          log("lenco account created");
          final data = LencoAcctModel.fromJson(json.decode(value.body));
          user.accountId = data.data?.id;
          user.accountRef = data.data?.accountReference;
          user.acctBalance = "0";
          user.acctName = data.data?.bankAccount?.accountName;
          user.acctNumber = data.data?.bankAccount?.accountNumber;
          user.bankName = data.data?.bankAccount?.bank?.name;
          await _userRepository.updateUserInfo(user);
          log("lenco account sync");
          emit(LencoLoadedState());
        } else {
          log(value.body.toString());
          emit(const AuthErrorsState(
              error: "Unable to set up your account. Try again!!"));
          return;
        }
      });
    } catch (e) {
      log(e.toString());
      emit(const AuthErrorsState(
          error: "Unable to set up your account. Try again!!"));
    }
  }

  void loadUserEvent() async {
    // emit(AuthLoadingState());
    try {
      user = await _userRepository.getUserById();
      emit(UserLoadedState(users: user));
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorsState(error: e.code));
    }
  }

  void updateUserEvent({required Users user}) async {
    emit(AuthLoadingState());
    try {
      _userRepository.updateUserInfo(user);
      emit(UserUpdatedState());
      emit(UserLoadedState(users: user));
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorsState(error: e.code));
    }
  }

  void sgnUpEvent() async {
    emit(AuthLoadingState());
    try {
      user.fullname = fullNameController.text.trim();
      user.username = usernameController.text.trim();
      user.address = addressController.text.trim();
      user.email = emailController.text.trim();
      user.phonenumber = phoneNoController.text.trim();
      user.password = passwordController.text.trim();
      await _userRepository.signUp(users: user);
      log("signed up");
      emit(SignedUpState());
      user.uid = _userRepository.currentUser!.uid;
      await createLencoAcctEvent();
      await localDb.insertUser(user);
      localUser = await localDb.fetchUser() ?? Users();
      log("localDb account created");
      emit(LencoLoadedState());

      fullNameController.clear();
      usernameController.clear();
      addressController.clear();
      emailController.clear();
      phoneNoController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorsState(error: _userRepository.errorMessage(e.code)));
    }
  }

  void sgnOutEvent() {
    emit(AuthLoadingState());
    _userRepository.signOut();
    emit(SignedOutState());
  }

  void resetPasswordEvent() async {
    emit(AuthLoadingState());
    try {
      await _userRepository.forgortPasword(email: emailController.text.trim());
      const message =
          "Please Check Your Mail for Password Reset Link\n(Alternatively check spam folder)";
      emit(const PasswordLinkSentState(message: message));
      emailController.clear();
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorsState(error: e.message!));
    }
  }

  // void _onEmailVerifyEvent(
  //     EmailVerifyEvent event, Emitter<SasereAuthState> emit) async {
  //   emit(AuthLoadingState());
  //   try {
  //     final isVerified = await _userRepository.verifyEmail();
  //     if (isVerified==true) {
  //       emit(EmailVerifiedState());
  //     } else {
  //       emit(EmailNotVerifiedState());
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     emit(AuthErrorsState(error: e.message!));
  //   }
  // }

  final UserRepository _userRepository;
}
