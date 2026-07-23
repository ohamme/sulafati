import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'sulafati.db'),
      version:3,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE salafiyat(
        id INTEGER PRIMARY KEY AUTOINCREMENT,

        name TEXT NOT NULL,
        admin_name TEXT NOT NULL,
        admin_phone TEXT,

        monthly_payment REAL NOT NULL,
        members INTEGER NOT NULL,
        total_amount REAL NOT NULL,

        start_date TEXT NOT NULL,
        end_date TEXT NOT NULL,

        color_hex TEXT,
        icon_code TEXT,

        status TEXT NOT NULL,
        current_month INTEGER DEFAULT 1,

        notes TEXT,

        created_at TEXT,
        updated_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE members(
        id INTEGER PRIMARY KEY AUTOINCREMENT,

        salafiya_id INTEGER,

        full_name TEXT NOT NULL,
        phone TEXT,
        image_path TEXT,

        join_date TEXT,

        status TEXT,

        has_won INTEGER DEFAULT 0,
        round_number INTEGER,

        FOREIGN KEY(salafiya_id)
        REFERENCES salafiyat(id)
        ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE payments(
       id INTEGER PRIMARY KEY AUTOINCREMENT,

       salafiya_id INTEGER NOT NULL,
       member_id INTEGER NOT NULL,

       installment_number INTEGER NOT NULL,

       amount REAL NOT NULL,

       due_date TEXT,
       payment_date TEXT,

       status TEXT NOT NULL,

       notes TEXT,

       created_at TEXT,
       updated_at TEXT,

       FOREIGN KEY(salafiya_id)
       REFERENCES salafiyat(id)
       ON DELETE CASCADE,

       FOREIGN KEY(member_id)
       REFERENCES members(id)
       ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE draws(
        id INTEGER PRIMARY KEY AUTOINCREMENT,

        salafiya_id INTEGER,

        member_id INTEGER,

        round_number INTEGER,

        amount REAL,

        draw_date TEXT,

        notes TEXT,

        FOREIGN KEY(salafiya_id)
        REFERENCES salafiyat(id),

        FOREIGN KEY(member_id)
        REFERENCES members(id)
      )
    ''');
  }

  Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    if (oldVersion < 2) {
      await db.execute(
          "ALTER TABLE salafiyat ADD COLUMN admin_name TEXT DEFAULT ''");

      await db.execute(
          "ALTER TABLE salafiyat ADD COLUMN admin_phone TEXT DEFAULT ''");

      await db.execute(
          "ALTER TABLE salafiyat ADD COLUMN end_date TEXT DEFAULT ''");

      await db.execute(
          "ALTER TABLE salafiyat ADD COLUMN color_hex TEXT DEFAULT ''");

      await db.execute(
          "ALTER TABLE salafiyat ADD COLUMN icon_code TEXT DEFAULT ''");

      await db.execute(
          "ALTER TABLE salafiyat ADD COLUMN notes TEXT DEFAULT ''");
    }
  }

  Future<int> insert(
      String table,
      Map<String, dynamic> values,
      ) async {
    final db = await database;

    return db.insert(table, values);
  }

  Future<List<Map<String, dynamic>>> getAll(
      String table,
      ) async {
    final db = await database;

    return db.query(table);
  }

  Future<int> update(
      String table,
      Map<String, dynamic> values,
      int id,
      ) async {
    final db = await database;

    return db.update(
      table,
      values,
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<int> delete(
      String table,
      int id,
      ) async {
    final db = await database;

    return db.delete(
      table,
      where: 'id=?',
      whereArgs: [id],
    );
  }
}