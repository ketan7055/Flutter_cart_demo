import 'package:cart/screen/cart_screen.dart';
import 'package:cart/data/meal_list.dart';
import 'package:cart/screen/dessert_listing_screen.dart';
import 'package:cart/widgets/badge_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:provider/provider.dart';

import 'main_course_listing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(247, 246, 242, 1),
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Main Course",
                ),
                Tab(
                  text: "Dessert",
                ),
              ],
            ),
            title: const Text("Meal List"),
            actions: [
              BadgeIcon(
                text: '',
                iconData: Icons.shopping_cart,
                notificationCount: Provider.of<ListData>(context).cartItemCount,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
              ),
            ],
            leading: Center(
                child: GestureDetector(
              child: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            )),
            centerTitle: true,
          ),
          body: const TabBarView(
            children: [MainCourseListingScreen(), DessertListingScreen()],
          ),
        ),
      ),
    );
  }
}
