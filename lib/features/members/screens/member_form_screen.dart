import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/member.dart';
import '../providers/member_provider.dart';

class MemberFormScreen extends StatefulWidget {
  final int salafiyaId;
  final Member? member;

  const MemberFormScreen({
    super.key,
    required this.salafiyaId,
    this.member,
  });

  @override
  State<MemberFormScreen> createState() => _MemberFormScreenState();
}

class _MemberFormScreenState extends State<MemberFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;

  DateTime _joinDate = DateTime.now();

  bool _saving = false;

  bool get _isEdit => widget.member != null;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(
      text: widget.member?.fullName ?? '',
    );

    _phoneController = TextEditingController(
      text: widget.member?.phone ?? '',
    );

    if (_isEdit) {
      _joinDate =
          DateTime.tryParse(widget.member!.joinDate) ??
              DateTime.now();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _joinDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _joinDate = picked;
      });
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _saving = true;
    });

    final member = Member(
      id: widget.member?.id,
      salafiyaId: widget.salafiyaId,
      fullName: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      imagePath: widget.member?.imagePath ?? '',
      joinDate: _joinDate.toIso8601String(),
      status: widget.member?.status ?? "نشط",
      hasWon: widget.member?.hasWon ?? false,
      roundNumber: widget.member?.roundNumber,
    );

    final provider =
        context.read<MemberProvider>();

    if (_isEdit) {
      await provider.updateMember(member);
    } else {
      await provider.addMember(member);
    }

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEdit
              ? "تعديل عضو"
              : "إضافة عضو",
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "الاسم الكامل",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty) {
                  return "أدخل اسم العضو";
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "رقم الهاتف",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty) {
                  return "أدخل رقم الهاتف";
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            InkWell(
              onTap: _pickDate,
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: "تاريخ الانضمام",
                  prefixIcon:
                      Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                child: Text(
                  "${_joinDate.year}-${_joinDate.month.toString().padLeft(2, '0')}-${_joinDate.day.toString().padLeft(2, '0')}",
                ),
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              height: 55,
              child: ElevatedButton.icon(
                onPressed: _saving
                    ? null
                    : _save,
                icon: _saving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child:
                            CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.save),
                label: Text(
                  _saving
                      ? "جاري الحفظ..."
                      : "حفظ العضو",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}