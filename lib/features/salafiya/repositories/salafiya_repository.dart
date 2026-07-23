import '../../../core/database/database_helper.dart';
import '../models/salafiya.dart';

class SalafiyaRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  static const String table = 'salafiyat';

  /// جميع السلف
  Future<List<Salafiya>> getAll() async {
    final db = await _databaseHelper.database;

    final result = await db.query(
      table,
      orderBy: 'id DESC',
    );

    return result
        .map((e) => Salafiya.fromMap(e))
        .toList();
  }

  /// إضافة سلفة
  Future<int> insert(Salafiya salafiya) async {
    final db = await _databaseHelper.database;

    return await db.insert(
      table,
      salafiya.toMap(),
    );
  }

  /// تحديث سلفة
  Future<int> update(Salafiya salafiya) async {
    final db = await _databaseHelper.database;

    return await db.update(
      table,
      salafiya.toMap(),
      where: 'id = ?',
      whereArgs: [salafiya.id],
    );
  }

  /// حذف سلفة
  Future<int> delete(int id) async {
    final db = await _databaseHelper.database;

    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// البحث بالاسم
  Future<List<Salafiya>> search(String keyword) async {
    final db = await _databaseHelper.database;

    final result = await db.query(
      table,
      where: 'name LIKE ?',
      whereArgs: ['%$keyword%'],
      orderBy: 'id DESC',
    );

    return result
        .map((e) => Salafiya.fromMap(e))
        .toList();
  }

  /// عدد السلف النشطة
  Future<int> activeCount() async {
    final db = await _databaseHelper.database;

    final result = await db.rawQuery('''
      SELECT COUNT(*) as total
      FROM salafiyat
      WHERE status = 'نشطة'
    ''');

    return result.first['total'] as int;
  }

  /// عدد السلف المكتملة
  Future<int> completedCount() async {
    final db = await _databaseHelper.database;

    final result = await db.rawQuery('''
      SELECT COUNT(*) as total
      FROM salafiyat
      WHERE status = 'مكتملة'
    ''');

    return result.first['total'] as int;
  }

  /// إجمالي الأموال
  Future<double> totalMoney() async {
    final db = await _databaseHelper.database;

    final result = await db.rawQuery('''
      SELECT SUM(total_amount) as total
      FROM salafiyat
    ''');

    final value = result.first['total'];

    if (value == null) return 0;

    return (value as num).toDouble();
  }

  /// عدد الأعضاء
  Future<int> totalMembers() async {
    final db = await _databaseHelper.database;

    final result = await db.rawQuery('''
      SELECT SUM(members) as total
      FROM salafiyat
    ''');

    final value = result.first['total'];

    if (value == null) return 0;

    return value as int;
  }
}