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

  //opens db
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('stars.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableStars (
      ${StarFields.id} $idType,
      ${StarFields.name} $textType,
      ${StarFields.description} $textType
       )
    )
    ''');
  }

  

  Future close() async{
    final db = await instance.database;

    db.close(); //close db
  }
}