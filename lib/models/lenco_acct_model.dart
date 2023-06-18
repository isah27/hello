class LencoAcctModel {
  bool? status;
  String? message;
  Data? data;

  LencoAcctModel({this.status, this.message, this.data});

  LencoAcctModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? accountReference;
  BankAccount? bankAccount;
  String? type;
  String? status;
  String? createdAt;
  dynamic expiresAt;
  String? currency;
  Meta? meta;

  Data(
      {this.id,
      this.accountReference,
      this.bankAccount,
      this.type,
      this.status,
      this.createdAt,
      this.expiresAt,
      this.currency,
      this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountReference = json['accountReference'];
    bankAccount = json['bankAccount'] != null
        ? BankAccount.fromJson(json['bankAccount'])
        : null;
    type = json['type'];
    status = json['status'];
    createdAt = json['createdAt'];
    expiresAt = json['expiresAt'];
    currency = json['currency'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['accountReference'] = accountReference;
    if (bankAccount != null) {
      data['bankAccount'] = bankAccount!.toJson();
    }
    data['type'] = type;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['expiresAt'] = expiresAt;
    data['currency'] = currency;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class BankAccount {
  String? accountName;
  String? accountNumber;
  Bank? bank;

  BankAccount({this.accountName, this.accountNumber, this.bank});

  BankAccount.fromJson(Map<String, dynamic> json) {
    accountName = json['accountName'];
    accountNumber = json['accountNumber'];
    bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountName'] = accountName;
    data['accountNumber'] = accountNumber;
    if (bank != null) {
      data['bank'] = bank!.toJson();
    }
    return data;
  }
}

class Bank {
  String? code;
  String? name;

  Bank({this.code, this.name});

  Bank.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}

class Meta {
  dynamic amount;
  dynamic minAmount;
  String? transactionReference;
  String? bvn;
  bool? isStatic;

  Meta(
      {this.amount,
      this.minAmount,
      this.transactionReference,
      this.bvn,
      this.isStatic});

  Meta.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    minAmount = json['minAmount'];
    transactionReference = json['transactionReference'];
    bvn = json['bvn'];
    isStatic = json['isStatic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['minAmount'] = minAmount;
    data['transactionReference'] = transactionReference;
    data['bvn'] = bvn;
    data['isStatic'] = isStatic;
    return data;
  }
}
