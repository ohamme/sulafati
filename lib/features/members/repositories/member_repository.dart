import '../../../core/database/database_helper.dart';
import '../models/member.dart';

class MemberRepository {

  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  static const table = "members";

  Future<List<Member>> getMembers(int salafiyaId) async {

    final db = await dbHelper.database;

    final result = await db.query(
      table,
      where: "salafiya_id=?",
      whereArgs: [salafiyaId],
      orderBy: "id DESC",
    );

    return result
        .map((e) => Member.fromMap(e))
        .toList();
  }

  Future<int> insert(Member member) async {

    final db = await dbHelper.database;

    return db.insert(
      table,
      member.toMap(),
    );
  }

  Future<int> update(Member member) async {

    final db = await dbHelper.database;

    return db.update(
      table,
      member.toMap(),
      where: "id=?",
      whereArgs: [member.id],
    );
  }

  Future<int> delete(int id) async {

    final db = await dbHelper.database;

    return db.delete(
      table,
      where: "id=?",
      whereArgs: [id],
    );
  }
}