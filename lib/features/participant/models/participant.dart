class Participant {
  final int? id;
  final int salafiyaId;
  final String name;
  final String? phone;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  Participant({
    this.id,
    required this.salafiyaId,
    required this.name,
    this.phone,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'salafiya_id': salafiyaId,
      'name': name,
      'phone': phone,
      'is_active': isActive ? 1 : 0,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Participant.fromMap(Map<String, dynamic> map) {
    return Participant(
      id: map['id'],
      salafiyaId: map['salafiya_id'],
      name: map['name'],
      phone: map['phone'],
      isActive: map['is_active'] == 1,
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }
}
