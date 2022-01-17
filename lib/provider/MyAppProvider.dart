import 'package:cart/data/list_data.dart';
import 'package:cart/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/**
 * Provider for state management.
 */

class MyAppProvider extends StatelessWidget {
  const MyAppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListData>(
      create: (context) => ListData(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
