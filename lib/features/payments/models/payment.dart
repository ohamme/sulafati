class Payment {
  final int? id;

  final int salafiyaId;
  final int memberId;

  final int installmentNumber;

  final double amount;

  final String dueDate;
  final String paymentDate;

  final String status;

  final String notes;

  final String createdAt;
  final String updatedAt;


  const Payment({

    this.id,

    required this.salafiyaId,

    required this.memberId,

    required this.installmentNumber,

    required this.amount,

    required this.dueDate,

    required this.paymentDate,

    required this.status,

    required this.notes,

    required this.createdAt,

    required this.updatedAt,

  });



  Map<String, dynamic> toMap() {

    return {

      if (id != null)
        'id': id,

      'salafiya_id': salafiyaId,

      'member_id': memberId,

      'installment_number':
          installmentNumber,

      'amount':
          amount,

      'due_date':
          dueDate,

      'payment_date':
          paymentDate,

      'status':
          status,

      'notes':
          notes,

      'created_at':
          createdAt,

      'updated_at':
          updatedAt,

    };

  }





  factory Payment.fromMap(
      Map<String, dynamic> map) {


    return Payment(

      id:
          map['id'] as int?,


      salafiyaId:
          map['salafiya_id'] ?? 0,


      memberId:
          map['member_id'] ?? 0,


      installmentNumber:
          map['installment_number'] ?? 1,


      amount:
          (map['amount'] as num?)
              ?.toDouble() ??
          0,


      dueDate:
          map['due_date'] ?? '',


      paymentDate:
          map['payment_date'] ?? '',


      status:
          map['status'] ?? 'غير مدفوع',


      notes:
          map['notes'] ?? '',


      createdAt:
          map['created_at'] ?? '',


      updatedAt:
          map['updated_at'] ?? '',

    );

  }







  Payment copyWith({

    int? id,

    int? salafiyaId,

    int? memberId,

    int? installmentNumber,

    double? amount,

    String? dueDate,

    String? paymentDate,

    String? status,

    String? notes,

    String? createdAt,

    String? updatedAt,

  }) {


    return Payment(

      id:
          id ?? this.id,


      salafiyaId:
          salafiyaId ?? this.salafiyaId,


      memberId:
          memberId ?? this.memberId,


      installmentNumber:
          installmentNumber ??
          this.installmentNumber,


      amount:
          amount ?? this.amount,


      dueDate:
          dueDate ?? this.dueDate,


      paymentDate:
          paymentDate ?? this.paymentDate,


      status:
          status ?? this.status,


      notes:
          notes ?? this.notes,


      createdAt:
          createdAt ?? this.createdAt,


      updatedAt:
          updatedAt ?? this.updatedAt,

    );

  }

}