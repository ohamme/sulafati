import 'package:flutter/material.dart';

import '../models/payment.dart';
import '../repositories/payment_repository.dart';



class PaymentProvider extends ChangeNotifier {


  final PaymentRepository _repository =
      PaymentRepository();



  List<Payment> _payments = [];

  List<Payment> get payments => _payments;



  bool _isLoading = false;

  bool get isLoading => _isLoading;



  //--------------------------------------------------
  // البحث
  //--------------------------------------------------

  String _searchText = "";

  String get searchText => _searchText;



  Future<void> search(String value) async {


    _searchText = value;



    if(value.trim().isEmpty){


      await loadPayments();


      return;

    }



    _payments =
        await _repository.search(
          value.trim(),
        );



    notifyListeners();

  }





  //--------------------------------------------------
  // الفلتر
  //--------------------------------------------------


  String _selectedFilter = "الكل";


  String get selectedFilter =>
      _selectedFilter;



  void setFilter(String value){


    _selectedFilter = value;


    notifyListeners();

  }





  //--------------------------------------------------
  // القائمة حسب الفلتر
  //--------------------------------------------------


  List<Payment> get filteredPayments {



    List<Payment> result =
        _payments;



    if(_searchText.isNotEmpty){


      result =
          result.where((payment){


            return payment
                .memberId
                .toString()
                .contains(_searchText);


          }).toList();


    }




    switch(_selectedFilter){



      case "مدفوع":

        return result
            .where(
              (e)=> e.status=="مدفوع",
            )
            .toList();



      case "غير مدفوع":

        return result
            .where(
              (e)=> e.status=="غير مدفوع",
            )
            .toList();




      case "متأخر":


        return result.where((e){


          if(e.status=="مدفوع"){
            return false;
          }



          final date =
              DateTime.tryParse(
                e.dueDate,
              );



          if(date == null){
            return false;
          }



          return date.isBefore(
            DateTime.now(),
          );


        }).toList();




      default:

        return result;

    }

  }





  //--------------------------------------------------
  // تحميل كل الدفعات
  //--------------------------------------------------


  Future<void> loadPayments() async {


    _isLoading = true;

    notifyListeners();



    _payments =
        await _repository.getAll();



    _isLoading = false;


    notifyListeners();

  }





  //--------------------------------------------------
  // دفعات السلفة
  //--------------------------------------------------


  Future<void> loadSalafiyaPayments(
      int salafiyaId,
      ) async {



    _isLoading = true;


    notifyListeners();



    _payments =
        await _repository
            .getBySalafiya(
              salafiyaId,
            );



    _isLoading = false;


    notifyListeners();

  }






  //--------------------------------------------------
  // دفعات العضو
  //--------------------------------------------------


  Future<void> loadMemberPayments(
      int memberId,
      ) async {



    _isLoading = true;


    notifyListeners();



    _payments =
        await _repository
            .getByMember(
              memberId,
            );



    _isLoading = false;


    notifyListeners();

  }





  //--------------------------------------------------
  // إضافة
  //--------------------------------------------------


  Future<void> addPayment(
      Payment payment,
      ) async {



    await _repository.insert(
      payment,
    );


    await loadPayments();

  }





  //--------------------------------------------------
  // تعديل
  //--------------------------------------------------


  Future<void> updatePayment(
      Payment payment,
      ) async {



    await _repository.update(
      payment,
    );


    await loadPayments();

  }





  //--------------------------------------------------
  // حذف
  //--------------------------------------------------


  Future<void> deletePayment(
      int id,
      ) async {



    await _repository.delete(
      id,
    );


    await loadPayments();

  }





  //--------------------------------------------------
  // تغيير الحالة
  //--------------------------------------------------


  Future<void> markAsPaid(
      Payment payment,
      ) async {



    final updated =
        payment.copyWith(


      status:
          "مدفوع",


      paymentDate:
          DateTime.now()
              .toIso8601String(),


      updatedAt:
          DateTime.now()
              .toIso8601String(),


    );



    await updatePayment(
      updated,
    );


  }





  Future<void> markAsPending(
      Payment payment,
      ) async {



    final updated =
        payment.copyWith(


      status:
          "غير مدفوع",


      paymentDate:
          "",


      updatedAt:
          DateTime.now()
              .toIso8601String(),


    );



    await updatePayment(
      updated,
    );


  }





  //--------------------------------------------------
  // الإحصائيات
  //--------------------------------------------------


  Future<double> totalPaid() async {

    return await _repository.totalPaid();

  }



  Future<int> paidCount() async {

    return await _repository.paidCount();

  }



  Future<int> pendingCount() async {

    return await _repository.pendingCount();

  }




  //--------------------------------------------------
  // تحديث
  //--------------------------------------------------


  Future<void> refresh() async {

    await loadPayments();

  }



  Future<void> refreshSalafiya(
      int id,
      ) async {


    await loadSalafiyaPayments(
      id,
    );

  }



  Future<void> refreshMember(
      int id,
      ) async {


    await loadMemberPayments(
      id,
    );

  }



  int get count =>
      _payments.length;



  bool get isEmpty =>
      _payments.isEmpty;



  bool get isNotEmpty =>
      _payments.isNotEmpty;


}