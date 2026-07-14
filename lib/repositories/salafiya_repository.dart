import 'package:sqflite/sqflite.dart';

import '../core/database/database_helper.dart';
import '../models/salafiya.dart';

class SalafiyaRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<int> insert(Salafiya salafiya) async {
    final db = await _databaseHelper.database;

    return await db.insert(
      'salafiyat',
      salafiya.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Salafiya>> getAll() async {
    final db = await _databaseHelper.database;

    final result = await db.query('salafiyat', orderBy: 'id DESC');

    return result.map((e) => Salafiya.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    final db = await _databaseHelper.database;

    return await db.delete('salafiyat', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Salafiya salafiya) async {
    final db = await _databaseHelper.database;

    return await db.update(
      'salafiyat',
      salafiya.toMap(),
      where: 'id = ?',
      whereArgs: [salafiya.id],
    );
  }
}
