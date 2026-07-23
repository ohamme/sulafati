import 'package:flutter/material.dart';

import '../models/salafiya.dart';
import '../repositories/salafiya_repository.dart';

class SalafiyaProvider extends ChangeNotifier {
  final SalafiyaRepository _repository = SalafiyaRepository();

  List<Salafiya> _salafiyat = [];

  List<Salafiya> get salafiyat => _salafiyat;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //----------------------------------------------------
  // تحميل جميع السلف
  //----------------------------------------------------

  Future<void> loadSalafiyat() async {
    _isLoading = true;
    notifyListeners();

    _salafiyat = await _repository.getAll();

    _isLoading = false;
    notifyListeners();
  }

  //----------------------------------------------------
  // إضافة سلفة
  //----------------------------------------------------

  Future<void> addSalafiya(Salafiya salafiya) async {
    await _repository.insert(salafiya);

    await loadSalafiyat();
  }

  //----------------------------------------------------
  // تعديل
  //----------------------------------------------------

  Future<void> updateSalafiya(Salafiya salafiya) async {
    await _repository.update(salafiya);

    await loadSalafiyat();
  }

  //----------------------------------------------------
  // حذف
  //----------------------------------------------------

  Future<void> deleteSalafiya(int id) async {
    await _repository.delete(id);

    await loadSalafiyat();
  }

  //----------------------------------------------------
  // البحث
  //----------------------------------------------------

  Future<void> search(String keyword) async {
    if (keyword.trim().isEmpty) {
      await loadSalafiyat();
      return;
    }

    _salafiyat = await _repository.search(keyword);

    notifyListeners();
  }

  //----------------------------------------------------
  // تغيير الحالة
  //----------------------------------------------------

  Future<void> changeStatus(
    Salafiya salafiya,
    String newStatus,
  ) async {
    final updated = salafiya.copyWith(
      status: newStatus,
    );

    await updateSalafiya(updated);
  }

  //----------------------------------------------------
  // الإحصائيات
  //----------------------------------------------------

  Future<int> activeCount() async {
    return await _repository.activeCount();
  }

  Future<int> completedCount() async {
    return await _repository.completedCount();
  }

  Future<double> totalMoney() async {
    return await _repository.totalMoney();
  }

  Future<int> totalMembers() async {
    return await _repository.totalMembers();
  }
}