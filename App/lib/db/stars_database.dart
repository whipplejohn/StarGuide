//*** https://www.youtube.com/watch?v=ckXSR79AACg (SQlite db storage using sqflite INsert, Delete, Update, view data)
//video will show a tutorial of how to use CRUD method with SQFlite

//https://www.youtube.com/watch?v=UpKrhZ0Hppk
//sql db storage using sqlite & sqflite CRUD | andriod & IOS

//https://www.youtube.com/watch?v=wVSBUnNUr00
//Flutter: Building UI for NoteKeeper App. [ SQLite Database Tutorial using SQFlite Plugin ] #4.2

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_guide/model/stars.dart';

class StarsDatabase {
  //global field that holds instance that calls contructor
  static final StarsDatabase instance = StarsDatabase._init();

  //new field for db
  static Database? _database;

  //private contructor
  StarsDatabase._init();

  //opens db (opens connection)
  Future<Database> get database async {
    if (_database != null) return _database!;

    //INITILAZE DB
    _database = await _initDB('stars.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();    //stores
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB); //opens db
  }

  //creates our db table
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    //defining structure
    await db.execute('''
    CREATE TABLE $tableStars (
      ${StarFields.id} $idType,
      ${StarFields.name} $textType,
      ${StarFields.description} $textType
       )
    ''');

    /* Can create a new database if you like for later on just create a new structure*/
  }

  //C part of CRUD
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

    //method query & defining db
    final maps = await db.query(
      tableStars,
      columns: StarFields.values,
      where: '${StarFields.id} = ?',
      whereArgs: [id] /* can put multiple values if you want just add more ? (/\/\/\) */,
    );

    if (maps.isNotEmpty){
      return Stars.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
      // return null;   /* just fix above (Future<Stars?>) */
    }
  }

  //read MULTIPLE stars
  Future<List<Stars>> readAllStars() async {
    final db = await instance.database;     //define db

    final orderBy = '${StarFields.name} ASC';   //acending order(ASC)
    // final result = await db.rawQuery('SELECT * FROM $tableStars ORDER BY $orderBy');   //same as below just as a sql statement
    final result = await db.query(tableStars, orderBy: orderBy);  //create table witout crating spectific object

    return result.map((json) => Stars.fromJson(json)).toList();
  }

  //update our stars
  Future<int> update(Stars stars) async{
    final db = await instance.database;

    return db.update(
      tableStars,
      stars.toJson(), //star obj -> json obj
      where: '${StarFields.id} = ?',
      whereArgs: [stars.id],
    );
  }
 
  Future<int> delete(int id) async {
    final db = await instance.database;     //define db

    return await db.delete(
      tableStars,
      where: '${StarFields.id} = ?',
      whereArgs: [id],
    );
  }

  //method to close db
  Future close() async{
    final db = await instance.database;

    db.close(); //close db
  }
}