import 'package:expence_tracker/screen/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/DB_Helper.dart';
import 'Category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    addControllor.ReadData();
    addControllor.totalData();
  }

  AddControllor addControllor = Get.put(
    AddControllor(),
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
                    Container(
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
                                  () => addControllor.expenseDataTotal.isEmpty
                                      ? Text(
                                          "00",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          "₹ ${addControllor.expenseDataTotal.value[0]['total_expense']}.00",
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
                    Container(
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
                                  () => addControllor.incomeDataTotal.isEmpty
                                      ? Text('\$' "00",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.bold))
                                      : Text(
                                          "₹ ${addControllor.incomeDataTotal.value[0]['total_income']}.00",
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
                        "Balance : ₹ ${addControllor.DataTotal.value}.00",
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
                              addControllor.ReadData();
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
                //////////////////////////////////////////////////////////////////////////////////
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
                                      "${addControllor.ProductList[index]['id']}");
                              PNameu = TextEditingController(
                                  text:
                                      "${addControllor.ProductList[index]['Pname']}");
                              Ppriceu = TextEditingController(
                                  text:
                                      "${addControllor.ProductList[index]['Pprice']}");
                              Ptypeu = TextEditingController(
                                  text:
                                      "${addControllor.ProductList[index]['Ptype']}");
                              Pdateu = TextEditingController(
                                  text:
                                      "${addControllor.ProductList[index]['Pdate']}");
                              Ptimeu = TextEditingController(
                                  text:
                                      "${addControllor.ProductList[index]['Ptime']}");
                              Pstastusu = TextEditingController(
                                  text:
                                      "${addControllor.ProductList[index]['Status']}");
                              updateDialog();
                            },
                            child: Container(
                              height: 70,
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
                                  SizedBox(
                                    width: 2,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    child: addControllor.ProductList[index]
                                                ['Status'] ==
                                            0
                                        ? Icon(
                                            Icons.arrow_upward,
                                            color: Colors.green,
                                          )
                                        : Icon(
                                            Icons.arrow_downward,
                                            color: Colors.red,
                                          ),
                                    radius: 22,
                                  ),
                                  SizedBox(
                                    width: 21,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 55,
                                                child: Text(
                                                  "${addControllor.ProductList[index]['Pname']}",
                                                  style: GoogleFonts.poppins(
                                                    color: Color(0xff31435b),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 65,
                                              ),
                                              Text(
                                                "${addControllor.ProductList.value[index]['Ptype']}",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${addControllor.ProductList[index]['Pprice']}",
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      addControllor.deleteData(
                                        id: addControllor.ProductList[index]
                                            ['id'],
                                      );
                                      addControllor.ReadData();
                                      addControllor.totalData();
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
                      itemCount: addControllor.ProductList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => SingleChildScrollView(
                child: AlertDialog(
                  backgroundColor: Colors.grey.shade400,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: addControllor.id,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          label:
                              Text("id", style: TextStyle(color: Colors.black)),
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
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Obx(() => Text(
                                "${addControllor.categoryNameList[addControllor.categoryIndex.value]}")),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  addControllor.categorySelected.value = false;
                                  addControllor.categoryIndex.value = 0;
                                  addControllor.PName = TextEditingController(
                                      text:
                                          '${addControllor.categoryNameList[addControllor.categoryIndex.value]}');
                                  showModalBottomSheet(
                                    backgroundColor: Colors.grey.shade400,
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                20)),
                                    builder: (context) {
                                      return CategoryBottomsheet();
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.category,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextField(
                        controller: addControllor.Pprice,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          label: Text("Price",
                              style: TextStyle(color: Colors.black)),
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
                        controller: addControllor.Ptype,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Obx(
                            () => DropdownButton(
                              isExpanded: true,
                              value: addControllor.ChangePayment.value,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Offline"),
                                  value: "Offline",
                                ),
                                DropdownMenuItem(
                                  child: Text("Online"),
                                  value: "Online",
                                ),
                              ],
                              onChanged: (value) {
                                addControllor.ChangePayment.value = value!;
                              },
                            ),
                          ),
                          // label: Text("Payment Type",
                          //     style: TextStyle(color: Colors.black)),
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
                        controller: addControllor.Pdate,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () async => addControllor.current.value =
                                (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2012),
                              lastDate: DateTime(2122),
                            ))!,
                            icon:
                                Icon(Icons.calendar_month, color: Colors.black),
                          ),
                          label: Text("Date",
                              style: TextStyle(color: Colors.black)),
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
                        controller: addControllor.Ptime,
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
                                        minute: DateTime.now().minute));
                              },
                              icon: Icon(
                                Icons.access_time_rounded,
                                color: Colors.black,
                              )),
                          label: Text(
                            "Time",
                            style: TextStyle(color: Colors.black),
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
                      Align(alignment: Alignment.bottomCenter, child: IE()),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
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

  Widget IE() {
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
                print(addControllor.PName.text);
                dbHelper dbhelper = dbHelper();
                dbhelper.insertData(
                  id: addControllor.id.text,
                  Pname: addControllor
                      .categoryNameList[addControllor.categoryIndex.value],
                  Pprice: addControllor.Pprice.text,
                  Ptype: addControllor.ChangePayment.value,
                  Pdate: addControllor.Pdate.text,
                  Ptime: addControllor.Ptime.text,
                  Status: 0,
                );
                addControllor.ReadData();
                addControllor.totalData();
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
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
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
                  id: addControllor.id.text,
                  Pname: addControllor
                      .categoryNameList[addControllor.categoryIndex.value],
                  Pprice: addControllor.Pprice.text,
                  Ptype: addControllor.ChangePayment.value,
                  // Ptype: addControllor.Ptype.value,
                  Pdate: addControllor.Pdate.text,
                  Ptime: addControllor.Ptime.text,
                  Status: 1,
                );
                addControllor.ReadData();
                addControllor.totalData();
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
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateDialog() {
    showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.grey.shade400,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Obx(
                      () => Text(
                        "${addControllor.categoryNameList[addControllor.categoryIndex.value]}",
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        addControllor.categorySelected.value = false;
                        addControllor.categoryIndex.value = 0;
                        addControllor.PName = TextEditingController(
                          text:
                              '${addControllor.categoryNameList[addControllor.categoryIndex.value]}',
                        );
                        showModalBottomSheet(
                          backgroundColor: Colors.grey.shade400,
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(20),
                          ),
                          builder: (context) {
                            return CategoryBottomsheet();
                          },
                        );
                      },
                      icon: Icon(
                        Icons.category,
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
                    () => DropdownButton(
                      value: addControllor.ChangePayment.value,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "Offline",
                          ),
                          value: "Offline",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Online",
                          ),
                          value: "Online",
                        ),
                      ],
                      onChanged: (value) {
                        addControllor.ChangePayment.value = value!;
                      },
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
                    onPressed: () async =>
                        addControllor.current.value = (await showDatePicker(
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
                          addControllor.updateData(
                            id: idu.text,
                            Pname: addControllor.categoryNameList[
                                addControllor.categoryIndex.value],
                            Pprice: Ppriceu.text,
                            Ptype: Ptypeu.text,
                            Pdate: Pdateu.text,
                            Ptime: Ptimeu.text,
                            Status: Pstastusu.text,
                          );
                          addControllor.totalData();
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
    );
  }
}
