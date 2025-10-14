import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todos.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, category TEXT, isDone INTEGER, dueDate TEXT)',
        );
      },
    );
  }

  Future<int> insertTodo(Map<String, dynamic> todo) async {
    final client = await db;
    return client.insert('todos', todo, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> deleteTodo(int id) async {
    final client = await db;
    return client.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateTodo(int id, Map<String, dynamic> todo) async {
    final client = await db;
    return client.update('todos', todo, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getTodos() async {
    final client = await db;
    return client.query('todos', orderBy: 'id DESC'); //besar ke kecil
  }
}
