class Salafiya {
  final int? id;
  final String name;
  final double monthlyAmount;
  final int membersCount;
  final String startDate;
  final int dueDay;

  Salafiya({
    this.id,
    required this.name,
    required this.monthlyAmount,
    required this.membersCount,
    required this.startDate,
    required this.dueDay,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'monthlyAmount': monthlyAmount,
      'membersCount': membersCount,
      'startDate': startDate,
      'dueDay': dueDay,
    };
  }
}