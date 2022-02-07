import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WrapAndPump on WidgetTester {
  Future<void> wrapAndPumpWidget(
      Widget widget, {
        Brightness brightness = Brightness.light,
      }) async {
    binding.window.platformBrightnessTestValue = brightness;

    final Widget materialAppTestWrapper = _MaterialAppTestWrapper(
      child: widget,
    );

    await pumpWidget(materialAppTestWrapper);
    await pump();
  }
}

class WrapAndPumpImport {} // Importer helper class. Does nothing.

class _MaterialAppTestWrapper extends StatelessWidget {
  const _MaterialAppTestWrapper({Key? key, required this.child})
      : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: child),

    );
  }
}