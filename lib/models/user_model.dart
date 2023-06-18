import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  static String userTable = "user";
  static String uidcol = "uid";
  static String usernamecol = "username";
  static String fullNamecol = "full_name";
  static String emailcol = "email";
  static String phoneNumbercol = "phone_number";
  static String addresscol = "address";
  static String passwordcol = "password";
  static String accountIdcol = 'account_id';
  static String accountRefcol = "account_ref";
  static String acctNumbercol = "account_number";
  static String acctNamecol = "account_name";
  static String acctBalancedcol = 'account_balance';
  static String bankNamecol = "bank_name";

  Users({
    this.uid,
    this.username,
    this.fullname,
    this.email,
    this.phonenumber,
    this.accountRef,
    this.address,
    this.password,
    this.accountId,
    this.acctBalance,
    this.acctName,
    this.acctNumber,
    this.bankName,
  });

  String? uid;
  String? username;
  String? fullname;
  String? email;
  String? phonenumber;
  String? address;
  String? password;
  String? accountId;
  String? accountRef;
  String? acctNumber;
  String? acctName;
  String? acctBalance;
  String? bankName;

  factory Users.fromJson(DocumentSnapshot<Map<String, dynamic>> json) => Users(
        uid: json[uidcol] ?? "",
        username: json[usernamecol] ?? "",
        email: json[emailcol] ?? "",
        phonenumber: json[phoneNumbercol] ?? "",
        fullname: json[fullNamecol] ?? "",
        address: json[addresscol] ?? "",
        accountId: json[accountIdcol] ?? "",
        accountRef: json[accountRefcol] ?? "",
        password: json[passwordcol] ?? "",
        acctName: json[acctNamecol] ?? "",
        acctBalance: json[acctBalancedcol] ?? "",
        bankName: json[bankNamecol] ?? "",
        acctNumber: json[acctNumbercol] ?? "",
      );
  factory Users.fromJsonLocal(Map<String, dynamic> json) => Users(
        uid: json[uidcol] ?? "",
        username: json[usernamecol] ?? "",
        email: json[emailcol] ?? "",
        phonenumber: json[phoneNumbercol] ?? "",
        fullname: json[fullNamecol] ?? "",
        address: json[addresscol] ?? "",
        accountId: json[accountIdcol] ?? "",
        accountRef: json[accountRefcol] ?? "",
        password: json[passwordcol] ?? "",
        acctName: json[acctNamecol] ?? "",
        acctBalance: json[acctBalancedcol] ?? "",
        bankName: json[bankNamecol] ?? "",
        acctNumber: json[acctNumbercol] ?? "",
      );

  Map<String, dynamic> toJson() => {
        uidcol: uid,
        usernamecol: username,
        emailcol: email,
        phoneNumbercol: phonenumber,
        addresscol: address,
        fullNamecol: fullname,
        passwordcol: password,
        accountIdcol: accountId,
        accountRefcol: accountRef,
        acctNamecol: acctName,
        acctNumbercol: acctNumber,
        acctBalancedcol: acctBalance,
        bankNamecol: bankName,
      };
}
