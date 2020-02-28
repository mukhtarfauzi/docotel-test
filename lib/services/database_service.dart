import 'dart:io' as io;
import 'package:docotel_test/models/login_req.dart';
import 'package:docotel_test/models/registration_req.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = new DatabaseService.internal();
  factory DatabaseService() => _instance;

  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseService.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }


  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute("CREATE TABLE User(id INTEGER PRIMARY KEY, fullName TEXT, username TEXT, password TEXT)");
    print("Created tables");
  }

  Future<int> saveUser(RegistrationReq user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toJson());
    return res;
  }

  Future<int> deleteUsers() async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }

  Future<bool> isLoggedIn() async {
    var dbClient = await db;
    var res = await dbClient.query("User");
    return res.length > 0? true: false;
  }

  Future<LoginReq> getLogin(String user, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM user WHERE username = '$user' and password = '$password'");

    if (res.length > 0) {
      return LoginReq.fromJson(res.first);
    }
    return null;
  }

  Future<List<LoginReq>> getAllUser() async {
    var dbClient = await db;
    var res = await dbClient.query("user");
    List<LoginReq> list =
    res.isNotEmpty ? res.map((c) => LoginReq.fromJson(c)).toList() : null;

    return list;
  }
}