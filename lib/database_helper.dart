import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String dbName = 'flutter.db';
  static const String tableName = 'users';

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  initDB() async {
    final path = join(await getDatabasesPath(), dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY,
        name TEXT,
        gender TEXT,
        age INTEGER,
        height REAL,
        weight REAL,
        bmi REAL
      )
    ''');
  }

  Future<int> insertUser(String name, String gender, int age, double height,
      double weight, double bmi) async {
    final db = await database;
    return await db!.insert(tableName, {
      'name': name,
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
      'bmi': bmi,
    });
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db!.query(tableName);
  }
}
