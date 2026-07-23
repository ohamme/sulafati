class Member {
  final int? id;
  final int salafiyaId;

  final String fullName;
  final String phone;

  final String imagePath;

  final String joinDate;

  final String status;

  final bool hasWon;

  final int? roundNumber;

  const Member({
    this.id,
    required this.salafiyaId,
    required this.fullName,
    required this.phone,
    required this.imagePath,
    required this.joinDate,
    required this.status,
    required this.hasWon,
    this.roundNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "salafiya_id": salafiyaId,
      "full_name": fullName,
      "phone": phone,
      "image_path": imagePath,
      "join_date": joinDate,
      "status": status,
      "has_won": hasWon ? 1 : 0,
      "round_number": roundNumber,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      id: map["id"],
      salafiyaId: map["salafiya_id"],
      fullName: map["full_name"] ?? "",
      phone: map["phone"] ?? "",
      imagePath: map["image_path"] ?? "",
      joinDate: map["join_date"] ?? "",
      status: map["status"] ?? "نشط",
      hasWon: map["has_won"] == 1,
      roundNumber: map["round_number"],
    );
  }

  Member copyWith({
    int? id,
    int? salafiyaId,
    String? fullName,
    String? phone,
    String? imagePath,
    String? joinDate,
    String? status,
    bool? hasWon,
    int? roundNumber,
  }) {
    return Member(
      id: id ?? this.id,
      salafiyaId: salafiyaId ?? this.salafiyaId,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      imagePath: imagePath ?? this.imagePath,
      joinDate: joinDate ?? this.joinDate,
      status: status ?? this.status,
      hasWon: hasWon ?? this.hasWon,
      roundNumber: roundNumber ?? this.roundNumber,
    );
  }
}