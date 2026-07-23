import 'package:flutter/material.dart';

import '../models/member.dart';
import '../repositories/member_repository.dart';

class MemberProvider extends ChangeNotifier {

  final MemberRepository repository =
      MemberRepository();

  List<Member> _members = [];

  List<Member> get members => _members;

  bool _loading = false;

  bool get loading => _loading;

  Future<void> loadMembers(
      int salafiyaId) async {

    _loading = true;

    notifyListeners();

    _members =
        await repository.getMembers(
      salafiyaId,
    );

    _loading = false;

    notifyListeners();
  }

  Future<void> addMember(
      Member member) async {

    await repository.insert(member);

    await loadMembers(
      member.salafiyaId,
    );
  }

  Future<void> updateMember(
      Member member) async {

    await repository.update(member);

    await loadMembers(
      member.salafiyaId,
    );
  }

  Future<void> deleteMember(
      Member member) async {

    await repository.delete(
      member.id!,
    );

    await loadMembers(
      member.salafiyaId,
    );
  }

}