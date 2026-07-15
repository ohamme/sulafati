import 'package:flutter/material.dart';
import '../models/salafiya.dart';
import '../repositories/salafiya_repository.dart';

class SalafiyaProvider extends ChangeNotifier {
  final SalafiyaRepository _repository = SalafiyaRepository();

  List<Salafiya> _salafiyat = [];

  List<Salafiya> get salafiyat => _salafiyat;

  Future<void> loadSalafiyat() async {
    _salafiyat = await _repository.getAll();
    notifyListeners();
  }

  Future<void> addSalafiya(Salafiya salafiya) async {
    await _repository.insert(salafiya);
    await loadSalafiyat();
  }

  Future<void> deleteSalafiya(int id) async {
    await _repository.delete(id);
    await loadSalafiyat();
  }

  Future<void> updateSalafiya(Salafiya salafiya) async {
    await _repository.update(salafiya);
    await loadSalafiyat();
  }
}
