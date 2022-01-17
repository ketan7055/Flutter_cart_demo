import 'dart:convert';

import 'package:cart/data/item_data.dart';
import 'package:flutter/cupertino.dart';

class ListData extends ChangeNotifier {


  /**
   * static meal list.
   */
  List<ItemData> items = [
    ItemData(
        ID: "306",
        name: 'Lemongrass Chicken (serves 2)',
        image: "images/dinner1.jpg",
        count: 0,
        price: 15,
        type: CATEGORY_TYPE.MAIN_COURSE),
    ItemData(
        ID: "307",
        name: 'Flank Steak  with Sherried Mushroom Sauce Dinner for Two',
        image: "images/dinner2.jpg",
        count: 0,
        price: 20,
        type: CATEGORY_TYPE.MAIN_COURSE),
    ItemData(
        ID: "308",
        name: 'Southwest Chili Dinner for Two',
        image: "images/dinner3.jpg",
        count: 0,
        price: 23,
        type: CATEGORY_TYPE.MAIN_COURSE),
    ItemData(
        ID: "309",
        name: 'Quinoa Chocolate Bites (serves 5)',
        image: "images/dinner4.png",
        count: 0,
        price: 7,
        type: CATEGORY_TYPE.MAIN_COURSE),

    ItemData(
        ID: "307",
        name: 'Chocolate Shake',
        image: "images/disert2.jpg",
        count: 0,
        price: 13,
        type: CATEGORY_TYPE.DESSERT),
    ItemData(
        ID: "308",
        name: 'Pery-pery',
        image: "images/disert3.jpg",
        count: 0,
        price: 20,
        type: CATEGORY_TYPE.DESSERT),
    ItemData(
        ID: "309",
        name: 'Baked cake oatmeal pie oat',
        image: "images/disert4.jpg",
        count: 0,
        price: 25,
        type: CATEGORY_TYPE.DESSERT),
    ItemData(
        ID: "309",
        name: 'Chocolate cake',
        image: "images/disert5.jpg",
        count: 0,
        price: 12,
        type: CATEGORY_TYPE.DESSERT),
    ItemData(
        ID: "309",
        name: 'Homemade toffee chocolate cake vanilla frosting',
        image: "images/disert6.jpg",
        count: 0,
        price: 10,
        type: CATEGORY_TYPE.DESSERT),
  ];

  List<ItemData> dessertList = [];
  List<ItemData> mainCourseList = [];
  List<ItemData> cartList = [];
  int cartItemCount = 0;
  double subTotal = 0.0;

  List<ItemData> getMainCourseList() {
    mainCourseList.clear();
    for (int i = 0; i < items.length; i++) {
      if (items[i].type == CATEGORY_TYPE.MAIN_COURSE) {
        mainCourseList.add(items[i]);
      }
    }
    return mainCourseList;
  }

  List<ItemData> getDessertList() {
    dessertList.clear();
    for (int i = 0; i < items.length; i++) {
      if (items[i].type == CATEGORY_TYPE.DESSERT) {
        dessertList.add(items[i]);
      }
    }
    return dessertList;
  }

  List<ItemData> getCartList() {
    cartList.clear();
    for (int i = 0; i < items.length; i++) {
      if (items[i].count > 0) {
        cartList.add(items[i]);
      }
    }
    if (cartList.isNotEmpty) {
      calculateSubTotal(cartList);
    }
    return cartList;
  }

  void addItem(ItemData data) {
    data.count = data.count + 1;
    calculateSubTotal(cartList);
    notifyListeners();
  }

  void remove(ItemData data) {
    if (data.count > 0) {
      data.count = data.count - 1;
    }
    calculateSubTotal(cartList);
    notifyListeners();
  }

  void calculateSubTotal(List<ItemData> cartList) {
    subTotal = 0.0;
    cartItemCount = 0;
    for (int i = 0; i < items.length; i++) {
      if(items[i].count > 0) {
        cartItemCount = cartItemCount + 1;
        subTotal = subTotal + (items[i].price * items[i].count).toDouble();
      }
    }

  }
}
