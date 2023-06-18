import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/user_model.dart';

class DataBaseHelper {
  static const _dbName = 'ExpenseDB.db';
  static const _dbVersion = 1;

  //singleton constructor
  DataBaseHelper._();
  static final DataBaseHelper instance = DataBaseHelper._();

  Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String path = join(dataDirectory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: onCreateDB);
  }

  onCreateDB(Database db, int version) async {
    db.execute('''
    CREATE TABLE ${Users.userTable}(
      ${Users.uidcol} TEXT NOT NULL,
      ${Users.usernamecol} TEXT NOT NULL,
      ${Users.fullNamecol} TEXT,
      ${Users.emailcol} TEXT NOT NULL,
      ${Users.addresscol} TEXT,
      ${Users.accountIdcol}  TEXT,
      ${Users.accountRefcol}  TEXT,
      ${Users.passwordcol}  TEXT NOT NULL,
      ${Users.phoneNumbercol}  TEXT,
      ${Users.acctBalancedcol}  TEXT,
      ${Users.acctNamecol}  TEXT,
      ${Users.acctNumbercol}  TEXT,
      ${Users.bankNamecol}  TEXT
    )
''');
  }

  // insert data into user table
  Future<int> insertUser(Users user) async {
    Database? db = await instance.database;
    return await db!.insert(Users.userTable, user.toJson());
  }

  // update data in user table
  Future<int> updateUser(Users user) async {
    Database? db = await instance.database;
    return await db!.update(Users.userTable, user.toJson(),
        where: '${Users.uidcol}=?', whereArgs: [user.uid]);
  }

  // delete data from user table and every other related data in other tables
  deleteUser(String userId) async {
    Database? db = await instance.database;
    await db!.delete(Users.userTable,
        where: '${Users.uidcol} = ?', whereArgs: [userId]);
  }

  //fetch data from user table
  Future<Users>? fetchUser() async {
    Database? db = await instance.database;
    List<Map> user = await db!.query(
      Users.userTable,
    );
    return user.isEmpty
        ? Users()
        : user.map((o) => Users.fromJsonLocal(o as Map<String, dynamic>)).first;
  }
}
