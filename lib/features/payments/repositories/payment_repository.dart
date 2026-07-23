import '../../../core/database/database_helper.dart';
import '../models/payment.dart';


class PaymentRepository {

  final DatabaseHelper _db =
      DatabaseHelper.instance;


  static const String table = "payments";



  //-----------------------------------------
  // جميع الدفعات
  //-----------------------------------------

  Future<List<Payment>> getAll() async {

    final db = await _db.database;


    final result = await db.query(
      table,
      orderBy: "id DESC",
    );


    return result
        .map(
          (e) => Payment.fromMap(e),
        )
        .toList();

  }





  //-----------------------------------------
  // دفعات سلفة معينة
  //-----------------------------------------

  Future<List<Payment>> getBySalafiya(
      int salafiyaId) async {


    final db = await _db.database;


    final result = await db.query(

      table,

      where:
          "salafiya_id = ?",


      whereArgs: [
        salafiyaId,
      ],


      orderBy:
          "installment_number ASC",

    );


    return result
        .map(
          (e) => Payment.fromMap(e),
        )
        .toList();

  }





  //-----------------------------------------
  // دفعات عضو معين
  //-----------------------------------------

  Future<List<Payment>> getByMember(
      int memberId) async {


    final db = await _db.database;


    final result = await db.query(

      table,

      where:
          "member_id = ?",


      whereArgs: [
        memberId,
      ],


      orderBy:
          "id DESC",

    );


    return result
        .map(
          (e) => Payment.fromMap(e),
        )
        .toList();

  }





  //-----------------------------------------
  // إضافة دفعة
  //-----------------------------------------

  Future<int> insert(
      Payment payment) async {


    final db = await _db.database;


    return await db.insert(

      table,

      payment.toMap(),

    );

  }





  //-----------------------------------------
  // تعديل دفعة
  //-----------------------------------------

  Future<int> update(
      Payment payment) async {


    final db = await _db.database;


    return await db.update(

      table,

      payment.toMap(),


      where:
          "id = ?",


      whereArgs: [
        payment.id,
      ],

    );

  }





  //-----------------------------------------
  // حذف دفعة
  //-----------------------------------------

  Future<int> delete(
      int id) async {


    final db = await _db.database;


    return await db.delete(

      table,


      where:
          "id = ?",


      whereArgs: [
        id,
      ],

    );

  }





  //-----------------------------------------
  // البحث
  //-----------------------------------------

  Future<List<Payment>> search(
      String keyword) async {


    final db = await _db.database;


    final result = await db.rawQuery(

      '''
      SELECT *
      FROM payments
      WHERE notes LIKE ?
      ORDER BY id DESC
      ''',

      [
        "%$keyword%"
      ],

    );


    return result
        .map(
          (e) => Payment.fromMap(e),
        )
        .toList();

  }





  //-----------------------------------------
  // مجموع المدفوع
  //-----------------------------------------

  Future<double> totalPaid() async {


    final db = await _db.database;


    final result = await db.rawQuery(

      '''
      SELECT SUM(amount) total
      FROM payments
      WHERE status = 'مدفوع'
      '''

    );


    final value =
        result.first['total'];


    if(value == null){
      return 0;
    }


    return
      (value as num).toDouble();

  }





  //-----------------------------------------
  // عدد المدفوع
  //-----------------------------------------

  Future<int> paidCount() async {


    final db = await _db.database;


    final result = await db.rawQuery(

      '''
      SELECT COUNT(*) total
      FROM payments
      WHERE status='مدفوع'
      '''

    );


    return
      result.first['total'] as int;

  }





  //-----------------------------------------
  // عدد غير المدفوع
  //-----------------------------------------

  Future<int> pendingCount() async {


    final db = await _db.database;


    final result = await db.rawQuery(

      '''
      SELECT COUNT(*) total
      FROM payments
      WHERE status='غير مدفوع'
      '''

    );


    return
      result.first['total'] as int;

  }

}