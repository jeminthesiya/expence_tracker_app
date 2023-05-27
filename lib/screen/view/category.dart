import 'package:expence_tracker/screen/controller/catedory_controller.dart';
import 'package:expence_tracker/screen/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBottomsheet extends StatelessWidget {
  const CategoryBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Transaction_controller Transactioncontroller = Get.put(
      Transaction_controller(),
    );

    categoryController categorycontroller = Get.put(
      categoryController(),
    );

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          categorycontroller.categoryIndex.value = index;
          categorycontroller.categorySelected.value = true;
          Transactioncontroller.ReadData();
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: categorycontroller.categoryColorList[index],
                child: categorycontroller.categoryIconList[index],
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${categorycontroller.categoryNameList[index]}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: categorycontroller.categoryIconList.length,
    );
  }
}
