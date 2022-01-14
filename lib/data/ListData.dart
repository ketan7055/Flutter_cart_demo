import 'dart:convert';

import 'package:cart/data/ListItem.dart';
import 'package:flutter/cupertino.dart';

class ListData extends ChangeNotifier {
  List<ListItem> itmes = [
    ListItem(
        ID: "306",
        name: 'Lemongrass Chicken (serves 2)',
        image: "images/dinner1.jpg",
        count: 0,
        price: 50,
        type: CATEGORY_TYPE.MAIN_COURSE),
    ListItem(
        ID: "307",
        name: 'Flank Steak  with Sherried Mushroom Sauce Dinner for Two',
        image: "images/dinner2.jpg",
        count: 0,
        price: 150,
        type: CATEGORY_TYPE.MAIN_COURSE),
    ListItem(
        ID: "308",
        name: 'Southwest Chili Dinner for Two',
        image: "images/dinner3.jpg",
        count: 0,
        price: 200,
        type: CATEGORY_TYPE.MAIN_COURSE),
    ListItem(
        ID: "309",
        name: 'Quinoa Chocolate Bites (serves 5)',
        image: "images/dinner4.png",
        count: 0,
        price: 700,
        type: CATEGORY_TYPE.MAIN_COURSE),

    ListItem(
        ID: "307",
        name: 'Chocolate Shake',
        image: "images/disert2.jpg",
        count: 0,
        price: 150,
        type: CATEGORY_TYPE.DISERT),
    ListItem(
        ID: "308",
        name: 'Pery-pery',
        image: "images/disert3.jpg",
        count: 0,
        price: 200,
        type: CATEGORY_TYPE.DISERT),
    ListItem(
        ID: "309",
        name: 'Baked cake oatmeal pie oat',
        image: "images/disert4.jpg",
        count: 0,
        price: 700,
        type: CATEGORY_TYPE.DISERT),
    ListItem(
        ID: "309",
        name: 'Chocolate cake',
        image: "images/disert5.jpg",
        count: 0,
        price: 700,
        type: CATEGORY_TYPE.DISERT),
    ListItem(
        ID: "309",
        name: 'Homemade toffee chocolate cake vanilla frosting',
        image: "images/disert6.jpg",
        count: 0,
        price: 85,
        type: CATEGORY_TYPE.DISERT),
  ];

  List<ListItem> disertList = [];
  List<ListItem> mainCourseList = [];
  List<ListItem> cartList = [];
  int cartItemCount = 0;
  double subTotal = 0.0;

  List<ListItem> getMainCourseList() {
    mainCourseList.clear();
    for (int i = 0; i < itmes.length; i++) {
      print("itmes[i].type main: ${itmes[i].type}");
      if (itmes[i].type == CATEGORY_TYPE.MAIN_COURSE) {
        mainCourseList.add(itmes[i]);
      }
    }
    print("mainCourseListlength : ${mainCourseList.length}");
    return mainCourseList;
  }

  List<ListItem> getDisertList() {
    disertList.clear();
    for (int i = 0; i < itmes.length; i++) {
      if (itmes[i].type == CATEGORY_TYPE.DISERT) {
        disertList.add(itmes[i]);
      }
    }
    return disertList;
  }

  List<ListItem> getCartList() {
    cartList.clear();
    for (int i = 0; i < itmes.length; i++) {
      print("itmes[i].count:: ${itmes[i].count}");
      if (itmes[i].count > 0) {
        cartList.add(itmes[i]);
      }
    }
    if (cartList.length > 0) {
      calculateSubTotal(cartList);
    }
    return cartList;
  }

  void addItem(ListItem data) {
    data.count = data.count + 1;
    calculateSubTotal(cartList);
    notifyListeners();
  }

  void remove(ListItem data) {
    if (data.count > 0) {
      data.count = data.count - 1;
    }
    calculateSubTotal(cartList);
    notifyListeners();
  }

  void calculateSubTotal(List<ListItem> cartList) {
    subTotal = 0.0;
    cartItemCount = 0;
    print("cartList.length: ${itmes.length}");
    for (int i = 0; i < itmes.length - 1; i++) {
      if(itmes[i].count > 0) {
        cartItemCount = cartItemCount + 1;
        subTotal = subTotal + (itmes[i].price * itmes[i].count).toDouble();
      }
    }
    notifyListeners();

  }
}
