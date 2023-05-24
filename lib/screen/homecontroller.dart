import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/DB_Helper.dart';

class Transaction_controller extends GetxController {
  TextEditingController id = TextEditingController();
  TextEditingController PName = TextEditingController();
  TextEditingController Pprice = TextEditingController();
  TextEditingController Ptype = TextEditingController();
  TextEditingController Pdate = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
  TextEditingController Ptime = TextEditingController(
      text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");
  TextEditingController Pstastus = TextEditingController();

  Rx<DateTime> current = DateTime.now().obs;
  RxList ProductList = <Map>[].obs;
  // RxInt categoryIndex = 0.obs;
  // RxBool categorySelected = true.obs;
  RxString ChangePayment = "Cash".obs;
  RxInt filter = 2.obs;
  RxInt total = 0.obs;
  RxInt income = 0.obs;
  RxInt expense = 0.obs;
  RxInt Status = 0.obs;
  RxList incomeDataTotal = [].obs;
  RxInt DataTotal = 0.obs;
  RxList expenseDataTotal = [].obs;


  Future<void> ReadData() async {
    dbHelper dbhelper = dbHelper();
    ProductList.value = await dbhelper.ReadData();
  }

  void deleteData({required id}) {
    dbHelper dbhelper = dbHelper();
    dbhelper.deleteData(id: id);
  }

  Future<void> filterData({required Status}) async {
    dbHelper dbhelper = dbHelper();
    ProductList.value = await dbhelper.FilterData(Status: Status);
  }

  void totalData() async {
    dbHelper dbhelper = dbHelper();
    incomeDataTotal.value = await dbhelper.calculateIncomeBalance();
    expenseDataTotal.value = await dbhelper.calculateExpenseBalance();
    DataTotal.value = incomeDataTotal[0]['total_income'] -
        expenseDataTotal[0]['total_expense'];
  }

  Future<void> updateData({
    required id,
    required name,
    required price,
    required type,
    required date,
    required time,
    required Status,
  }) async {
    dbHelper dbhelper = dbHelper();
    dbhelper.updateData(
      id: id,
      Pname: name,
      Pprice: price,
      Ptype: type,
      Pdate: date,
      Ptime: time,
      Status: Status,
    );
    ReadData();
  }
}
