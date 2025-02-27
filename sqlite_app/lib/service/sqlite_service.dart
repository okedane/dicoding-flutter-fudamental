import 'package:sqflite/sqflite.dart';
import 'package:sqlite_app/model/profile.dart';

class SqliteService {
  static const String _databseName = 'profilelist.db';
  static const String _tableName = 'profile';
  static const int _version = 1;

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE $_tableName(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    email TEXT,
    phoneNumber TEXT,
    maritalStatus INTEGER
    )
    """);
  }

  Future<Database> _initializeDb() async {
    return openDatabase(
      _databseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTable(database);
      },
    );
  }

  //create
  Future<int> insertItem(Profile profile) async {
    final db = await _initializeDb();

    final data = profile.toJson();
    final id = await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  //Read all
  Future<List<Profile>> getAllItems() async {
    final db = await _initializeDb();
    final results = await db.query(_tableName, orderBy: "id");

    return results.map((result) => Profile.fromJson(result)).toList();
  }

  // show
  Future<Profile> getItemId(int id) async {
    final db = await _initializeDb();
    final results = await db.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );

    return results.map((result) => Profile.fromJson(result)).first;
  }

  // update
  Future<int> updateItem(int id, Profile profile) async {
    final db = await _initializeDb();

    final data = profile.toJson();

    final result = await db.update(
      _tableName,
      data,
      where: "id = ?",
      whereArgs: [id],
    );
    return result;
  }

  Future<int> removeItem(int id) async {
    final db = await _initializeDb();

    final result = await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    return result;
  }

  getItemById(int id) {}
}
