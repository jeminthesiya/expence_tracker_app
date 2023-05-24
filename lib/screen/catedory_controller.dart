import 'package:flutter/material.dart';
import 'package:get/get.dart';

class categoryController extends GetxController
{
  RxInt categoryIndex = 0.obs;
  RxBool categorySelected = true.obs;

  RxList<Icon> categoryIconList = <Icon>[
    Icon(
      Icons.fastfood,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.book_outlined,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.video_call,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.shopping_cart,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.home,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.sports_baseball,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.fitness_center,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.health_and_safety,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.car_rental,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.airplanemode_active,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.location_city,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.card_giftcard,
      color: Colors.white,
      size: 22,
    ),
    Icon(
      Icons.menu_outlined,
      color: Colors.white,
      size: 22,
    ),
  ].obs;

  RxList categoryNameList = [
    'Food',
    'Bills and Utility',
    'Entertainment',
    'Shopping',
    'Rent',
    'Sport',
    'Fitness',
    'HealthCare',
    'Transportation',
    'Travelling',
    'Education',
    'Gift',
    "Others",
  ].obs;

  RxList<Color> categoryColorList = <Color>[
    Colors.redAccent.shade400,
    Colors.blueGrey,
    Colors.blueAccent.shade100,
    Colors.deepPurpleAccent.shade200,
    Colors.blueGrey,
    Colors.deepPurpleAccent.shade200,
    Colors.teal.shade400,
    Colors.blue.shade400,
    Colors.pink.shade300,
    Colors.blueAccent.shade100,
    Colors.blue.shade400,
    Colors.pink.shade300,
    Colors.teal.shade400,
  ].obs;

}