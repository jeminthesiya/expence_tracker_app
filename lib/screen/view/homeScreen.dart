import 'package:expence_tracker/screen/controller/catedory_controller.dart';
import 'package:expence_tracker/screen/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/DB_Helper.dart';
import '../Category.dart';

class Transaction_Screen extends StatefulWidget {
  const Transaction_Screen({Key? key}) : super(key: key);

  @override
  State<Transaction_Screen> createState() => _Transaction_ScreenState();
}

class _Transaction_ScreenState extends State<Transaction_Screen> {
  void initState() {
    super.initState();
    Transactioncontroller.ReadData();
    Transactioncontroller.totalData();
  }

  Transaction_controller Transactioncontroller = Get.put(
    Transaction_controller(),
  );

  categoryController categorycontroller = Get.put(
    categoryController(),
  );

  TextEditingController idu = TextEditingController();
  TextEditingController PNameu = TextEditingController();
  TextEditingController Ppriceu = TextEditingController();
  TextEditingController Ptypeu = TextEditingController();
  TextEditingController Pdateu = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
  TextEditingController Ptimeu = TextEditingController(
      text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");
  TextEditingController Pstastusu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Jemin Thesiya",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 8,
                        top: 8,
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "J",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "This month",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Transactioncontroller.filterData(Status: 1);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade200,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "spending",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.red.shade200,
                                    ),
                                  ),
                                  Obx(
                                    () => Transactioncontroller
                                            .expenseDataTotal.isEmpty
                                        ? Text(
                                            "00",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : Text(
                                            "₹ ${Transactioncontroller.expenseDataTotal.value[0]['total_expense']}.00",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Transactioncontroller.filterData(Status: 0);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Income",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.green.shade200,
                                    ),
                                  ),
                                  Obx(
                                    () => Transactioncontroller
                                            .incomeDataTotal.isEmpty
                                        ? Text('\$' "00",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold))
                                        : Text(
                                            "₹ ${Transactioncontroller.incomeDataTotal.value[0]['total_income']}.00",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Obx(
                      () => Text(
                        "Balance : ₹ ${Transactioncontroller.DataTotal.value}.00",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recent transaction",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 8,
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Transactioncontroller.ReadData();
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(7),
                          child: InkWell(
                            onTap: () {
                              idu = TextEditingController(
                                  text:
                                      "${Transactioncontroller.ProductList[index]['id']}");
                              PNameu = TextEditingController(
                                  text:
                                      "${Transactioncontroller.ProductList[index]['Pname']}");
                              Ppriceu = TextEditingController(
                                  text:
                                      "${Transactioncontroller.ProductList[index]['Pprice']}");
                              Ptypeu = TextEditingController(
                                  text:
                                      "${Transactioncontroller.ProductList[index]['Ptype']}");
                              Pdateu = TextEditingController(
                                  text:
                                      "${Transactioncontroller.ProductList[index]['Pdate']}");
                              Ptimeu = TextEditingController(
                                  text:
                                      "${Transactioncontroller.ProductList[index]['Ptime']}");
                              Pstastusu = TextEditingController(
                                  text:
                                      "${Transactioncontroller.ProductList[index]['Status']}");
                              UpdateBottomSheetDialog();
                            },
                            child: Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Transactioncontroller
                                                .ProductList[index]['Status'] ==
                                            0
                                        ? Icon(
                                            Icons.upload,
                                            color: Colors.green,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.download,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                    radius: 22,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 75,
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade100,
                                              border: Border.all(
                                                color: Colors.blueGrey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${Transactioncontroller.ProductList[index]['Pdate']}",
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Container(
                                            height: 25,
                                            width: 75,
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade100,
                                              border: Border.all(
                                                color: Colors.blueGrey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${Transactioncontroller.ProductList.value[index]['Ptype']}",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text(
                                              "${Transactioncontroller.ProductList[index]['Pname']}",
                                              style: TextStyle(
                                                color: Color(0xff31435b),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 65,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "₹",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                "${Transactioncontroller.ProductList[index]['Pprice']}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      Transactioncontroller.deleteData(
                                        id: Transactioncontroller
                                            .ProductList[index]['id'],
                                      );
                                      Transactioncontroller.ReadData();
                                      Transactioncontroller.totalData();
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: Transactioncontroller.ProductList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            BottomSheetDialog();
          },
          child: Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '+',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future BottomSheetDialog() {
    return Get.bottomSheet(
      BottomSheet(
        backgroundColor: Colors.grey.shade100,
        onClosing: () {},
        builder: (context) => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "All Details",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextField(
                      controller: Transactioncontroller.id,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        label: Text(
                          "id",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${categorycontroller.categoryNameList[categorycontroller.categoryIndex.value]}",
                              ),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              categorycontroller.categorySelected.value = false;
                              categorycontroller.categoryIndex.value = 0;
                              Transactioncontroller.PName =
                                  TextEditingController(
                                text:
                                    '${categorycontroller.categoryNameList[categorycontroller.categoryIndex.value]}',
                              );
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(
                                    20,
                                  ),
                                ),
                                builder: (context) {
                                  return CategoryBottomsheet();
                                },
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    TextField(
                      controller: Transactioncontroller.Pprice,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        label: Text(
                          "Price",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    TextField(
                      controller: Transactioncontroller.Ptype,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Obx(
                          () => Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                iconDisabledColor: Colors.black,
                                dropdownColor: Colors.white,
                                iconEnabledColor: Colors.black,
                                isExpanded: true,
                                value:
                                    Transactioncontroller.ChangePayment.value,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "Credit Card",
                                    ),
                                    value: "Credit Card",
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "GPay",
                                    ),
                                    value: "GPay",
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "Paytm",
                                    ),
                                    value: "Paytm",
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "Cash",
                                    ),
                                    value: "Cash",
                                  ),
                                ],
                                onChanged: (value) {
                                  Transactioncontroller.ChangePayment.value =
                                      value!;
                                },
                              ),
                            ),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    TextField(
                      controller: Transactioncontroller.Pdate,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async => Transactioncontroller
                              .current.value = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2012),
                            lastDate: DateTime(2122),
                          ))!,
                          icon: Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                        ),
                        label: Text(
                          "Date",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    TextField(
                      controller: Transactioncontroller.Ptime,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                hour: DateTime.now().hour,
                                minute: DateTime.now().minute,
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.access_time_rounded,
                            color: Colors.black,
                          ),
                        ),
                        label: Text(
                          "Time",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Filter(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future UpdateBottomSheetDialog() {
    return Get.bottomSheet(
      BottomSheet(
        backgroundColor: Colors.grey.shade100,
        onClosing: () {},
        builder: (context) => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Update Details",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextField(
                      controller: idu,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        label: Text(
                          "id",
                          style: TextStyle(color: Colors.black),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${categorycontroller.categoryNameList[categorycontroller.categoryIndex.value]}",
                              ),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              categorycontroller.categorySelected.value = false;
                              categorycontroller.categoryIndex.value = 0;
                              Transactioncontroller.PName =
                                  TextEditingController(
                                text:
                                    '${categorycontroller.categoryNameList[categorycontroller.categoryIndex.value]}',
                              );
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20),
                                ),
                                builder: (context) {
                                  return CategoryBottomsheet();
                                },
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: Ppriceu,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        label: Text(
                          "Price",
                          style: TextStyle(color: Colors.black),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: Ptypeu,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: Obx(
                          () => Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                value:
                                    Transactioncontroller.ChangePayment.value,
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "Credit Card",
                                    ),
                                    value: "Credit Card",
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "GPay",
                                    ),
                                    value: "GPay",
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "Paytm",
                                    ),
                                    value: "Paytm",
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "Cash",
                                    ),
                                    value: "Cash",
                                  ),
                                ],
                                onChanged: (value) {
                                  Transactioncontroller.ChangePayment.value =
                                      value!;
                                },
                              ),
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: Pdateu,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async => Transactioncontroller
                              .current.value = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2012),
                            lastDate: DateTime(2122),
                          ))!,
                          icon: Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                        ),
                        label: Text(
                          "date",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: Ptimeu,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                hour: DateTime.now().hour,
                                minute: DateTime.now().minute,
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.access_time_rounded,
                            color: Colors.black,
                          ),
                        ),
                        label: Text(
                          "Time",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "cancel",
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              onPressed: () {
                                Transactioncontroller.updateData(
                                  id: idu.text,
                                  name: categorycontroller.categoryNameList[
                                      categorycontroller.categoryIndex.value],
                                  price: Ppriceu.text,
                                  type: Ptypeu.text,
                                  date: Pdateu.text,
                                  time: Ptimeu.text,
                                  Status: Pstastusu.text,
                                );
                                Transactioncontroller.totalData();
                                Get.back();
                              },
                              child: Text("yes"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Filter() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                dbHelper dbhelper = dbHelper();
                dbhelper.insertData(
                  id: Transactioncontroller.id.text,
                  Pname: categorycontroller
                      .categoryNameList[categorycontroller.categoryIndex.value],
                  Pprice: Transactioncontroller.Pprice.text,
                  Ptype: Transactioncontroller.ChangePayment.value,
                  Pdate: Transactioncontroller.Pdate.text,
                  Ptime: Transactioncontroller.Ptime.text,
                  Status: 0,
                );
                Transactioncontroller.ReadData();
                Transactioncontroller.totalData();
                Navigator.pop(context);
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Income',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                dbHelper dbhelper = dbHelper();
                dbhelper.insertData(
                  id: Transactioncontroller.id.text,
                  Pname: categorycontroller
                      .categoryNameList[categorycontroller.categoryIndex.value],
                  Pprice: Transactioncontroller.Pprice.text,
                  Ptype: Transactioncontroller.ChangePayment.value,
                  Pdate: Transactioncontroller.Pdate.text,
                  Ptime: Transactioncontroller.Ptime.text,
                  Status: 1,
                );
                Transactioncontroller.ReadData();
                Transactioncontroller.totalData();
                Navigator.pop(context);
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Expanse',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
