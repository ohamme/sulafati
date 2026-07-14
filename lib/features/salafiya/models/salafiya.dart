class Salafiya {
  final int? id;
  final String name;
  final double amount;
  final int members;
  final String createdAt;
  final String updatedAt;

  Salafiya({
    this.id,
    required this.name,
    required this.amount,
    required this.members,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'members': members,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Salafiya.fromMap(Map<String, dynamic> map) {
    return Salafiya(
      id: map['id'],
      name: map['name'],
      amount: (map['amount'] as num).toDouble(),
      members: map['members'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }
}
