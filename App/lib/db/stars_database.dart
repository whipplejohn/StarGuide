<<<<<<< HEAD
//*** https://www.youtube.com/watch?v=ckXSR79AACg (SQlite db storage using sqflite INsert, Delete, Update, view data)
//video will show a tutorial of how to use CRUD method with SQFlite

//https://www.youtube.com/watch?v=UpKrhZ0Hppk
//sql db storage using sqlite & sqflite CRUD | andriod & IOS

//https://www.youtube.com/watch?v=wVSBUnNUr00
//Flutter: Building UI for NoteKeeper App. [ SQLite Database Tutorial using SQFlite Plugin ] #4.2

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_guide/model/stars.dart';
=======
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_guide/models/start.dart';
>>>>>>> origin/main

class StarsDatabase {
  //global field that holds instance that calls contructor
  static final StarsDatabase instance = StarsDatabase._init();

  //new field for db
  static Database? _database;

  //private contructor
  StarsDatabase._init();

<<<<<<< HEAD
  //opens db (opens connection)
  Future<Database> get database async {
    if (_database != null) return _database!;

    //INITILAZE DB
=======
  //opens db
  Future<Database> get database async {
    if (_database != null) return _database!;

>>>>>>> origin/main
    _database = await _initDB('stars.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
<<<<<<< HEAD
    final dbPath = await getDatabasesPath();    //stores
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB); //opens db
  }

  //creates our db table
=======
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

>>>>>>> origin/main
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

<<<<<<< HEAD
    //defining structure
=======
>>>>>>> origin/main
    await db.execute('''
    CREATE TABLE $tableStars (
      ${StarFields.id} $idType,
      ${StarFields.name} $textType,
      ${StarFields.description} $textType
       )
    ''');
<<<<<<< HEAD

    /* Can create a new database if you like for later on just create a new structure*/
  }

  //C part of CRUD
=======
  }

>>>>>>> origin/main
  Future<Stars> create(Stars stars) async{
    final db = await instance.database;

    //for sql statement
    // final json = stars.toJson();
    // final columns = '${StarFields.name}, ${StarFields.description}'; 
    // final values = '${json[StarFields.name]}, ${json[StarFields.description]}';

    //for sql statement
    // final id = await db.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    //this is the same as the sql stuff /\/\/\
    final id = await db.insert(tableStars, stars.toJson());

    return stars.copy(id: id);
  }

  //reading the star
  Future<Stars> readStar(int id) async {
    final db = await instance.database;     //define db

<<<<<<< HEAD
    //method query & defining db
=======
    //method query
>>>>>>> origin/main
    final maps = await db.query(
      tableStars,
      columns: StarFields.values,
      where: '${StarFields.id} = ?',
<<<<<<< HEAD
      whereArgs: [id] /* can put multiple values if you want just add more ? (/\/\/\) */,
=======
      whereArgs: [id],
>>>>>>> origin/main
    );

    if (maps.isNotEmpty){
      return Stars.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
      // return null;   /* just fix above (Future<Stars?>) */
    }
  }

<<<<<<< HEAD
  //read MULTIPLE stars
  Future<List<Stars>> readAllStars() async {
    final db = await instance.database;     //define db

    final orderBy = '${StarFields.name} ASC';   //acending order(ASC)
    // final result = await db.rawQuery('SELECT * FROM $tableStars ORDER BY $orderBy');   //same as below just as a sql statement
=======
  //read multiple notes
  Future<List<Stars>> readAllStars() async {
    final db = await instance.database;     //define db

    final orderBy = '${StarFields.name} ASC';   //acending order
    // final result = await db.rawQuery('SELECT * FROM $tableStars ORDER BY $orderBy');   //same as below
>>>>>>> origin/main
    final result = await db.query(tableStars, orderBy: orderBy);  //create table witout crating spectific object

    return result.map((json) => Stars.fromJson(json)).toList();
  }

<<<<<<< HEAD
  //update our stars
=======
  //update
>>>>>>> origin/main
  Future<int> update(Stars stars) async{
    final db = await instance.database;

    return db.update(
      tableStars,
<<<<<<< HEAD
      stars.toJson(), //star obj -> json obj
=======
      stars.toJson(),
>>>>>>> origin/main
      where: '${StarFields.id} = ?',
      whereArgs: [stars.id],
    );
  }
<<<<<<< HEAD
 
=======

>>>>>>> origin/main
  Future<int> delete(int id) async {
    final db = await instance.database;     //define db

    return await db.delete(
      tableStars,
      where: '${StarFields.id} = ?',
      whereArgs: [id],
    );
  }

<<<<<<< HEAD
  //method to close db
=======
>>>>>>> origin/main
  Future close() async{
    final db = await instance.database;

    db.close(); //close db
  }
}