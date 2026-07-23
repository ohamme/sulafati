class Salafiya {
  final int? id;

  final String name;
  final String adminName;
  final String adminPhone;

  final double monthlyPayment;
  final int members;
  final double totalAmount;

  final String startDate;
  final String endDate;

  final String colorHex;
  final String iconCode;

  final String status;
  final int currentMonth;

  final String notes;

  final String createdAt;
  final String updatedAt;

  const Salafiya({
    this.id,
    required this.name,
    required this.adminName,
    required this.adminPhone,
    required this.monthlyPayment,
    required this.members,
    required this.totalAmount,
    required this.startDate,
    required this.endDate,
    required this.colorHex,
    required this.iconCode,
    required this.status,
    required this.currentMonth,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'admin_name': adminName,
      'admin_phone': adminPhone,
      'monthly_payment': monthlyPayment,
      'members': members,
      'total_amount': totalAmount,
      'start_date': startDate,
      'end_date': endDate,
      'color_hex': colorHex,
      'icon_code': iconCode,
      'status': status,
      'current_month': currentMonth,
      'notes': notes,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Salafiya.fromMap(Map<String, dynamic> map) {
    return Salafiya(
      id: map['id'] as int?,
      name: map['name'] ?? '',
      adminName: map['admin_name'] ?? '',
      adminPhone: map['admin_phone'] ?? '',
      monthlyPayment: (map['monthly_payment'] as num?)?.toDouble() ?? 0,
      members: map['members'] ?? 0,
      totalAmount: (map['total_amount'] as num?)?.toDouble() ?? 0,
      startDate: map['start_date'] ?? '',
      endDate: map['end_date'] ?? '',
      colorHex: map['color_hex'] ?? '',
      iconCode: map['icon_code'] ?? '',
      status: map['status'] ?? 'نشطة',
      currentMonth: map['current_month'] ?? 1,
      notes: map['notes'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  Salafiya copyWith({
    int? id,
    String? name,
    String? adminName,
    String? adminPhone,
    double? monthlyPayment,
    int? members,
    double? totalAmount,
    String? startDate,
    String? endDate,
    String? colorHex,
    String? iconCode,
    String? status,
    int? currentMonth,
    String? notes,
    String? createdAt,
    String? updatedAt,
  }) {
    return Salafiya(
      id: id ?? this.id,
      name: name ?? this.name,
      adminName: adminName ?? this.adminName,
      adminPhone: adminPhone ?? this.adminPhone,
      monthlyPayment: monthlyPayment ?? this.monthlyPayment,
      members: members ?? this.members,
      totalAmount: totalAmount ?? this.totalAmount,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      colorHex: colorHex ?? this.colorHex,
      iconCode: iconCode ?? this.iconCode,
      status: status ?? this.status,
      currentMonth: currentMonth ?? this.currentMonth,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}