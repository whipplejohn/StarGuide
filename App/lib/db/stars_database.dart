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
    ''');
  }

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

    //method query
    final maps = await db.query(
      tableStars,
      columns: StarFields.values,
      where: '${StarFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty){
      return Stars.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
      // return null;   /* just fix above (Future<Stars?>) */
    }
  }

  //read multiple notes
  Future<List<Stars>> readAllStars() async {
    final db = await instance.database;     //define db

    final orderBy = '${StarFields.name} ASC';   //acending order
    // final result = await db.rawQuery('SELECT * FROM $tableStars ORDER BY $orderBy');   //same as below
    final result = await db.query(tableStars, orderBy: orderBy);  //create table witout crating spectific object

    return result.map((json) => Stars.fromJson(json)).toList();
  }

  //update
  Future<int> update(Stars stars) async{
    final db = await instance.database;

    return db.update(
      tableStars,
      stars.toJson(),
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

  Future close() async{
    final db = await instance.database;

    db.close(); //close db
  }
}