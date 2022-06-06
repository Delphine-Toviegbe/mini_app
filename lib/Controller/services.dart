import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../model/user.dart';

class SQLHelper{

  static Future<void> createTables(sql.Database database)async{
    await database.execute(
        'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, firstName TEXT, mail TEXT, password TEXT)');
  }

  static Future<sql.Database> db()async{
    return sql.openDatabase(
      'sqlminiapp.db' ,
      version: 1,
      onCreate : (sql.Database database, int version)async{
        await createTables(database);
      }
    );
  }

  static Future<User> createUser(User user)async{
    final db=await SQLHelper.db();
    user.setId(await db.insert('users', user.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace
    ));
    return user;
  }
  static Future<List<User>> getUsers()async{
    User user;
    List<Map<String, dynamic>> jsons=[];
    Map<String, dynamic> json={};
    List<User> users=[];
    final db = await SQLHelper.db();
    jsons = await db.query('users');
    for(int i=0; i<=jsons.length; i++){
      json=jsons[i];
      user = User.fromJson(json);
      users.add(user);
    }
    return users;
  }

  static Future<User> getUser(User user)async{
    List<Map<String, dynamic>> jsons=[];
    Map<String, dynamic> json={};
    final db = await SQLHelper.db();
    jsons = await db.query('users', where: "id = ?", whereArgs:[user.getId()], limit:1);
    if(jsons.length>0){
      json=jsons[0];
      user = User.fromJson(json);
    }
    return user;
  }

  static Future<User> updateUser(User user) async{
    final db = await SQLHelper.db();
    await db.update('users', user.toJson(), where: 'id=?', whereArgs: [user.getId()]);
    return user;
  }
}