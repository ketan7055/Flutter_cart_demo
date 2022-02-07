import 'package:cart/widgets/badge_icon.dart';
import 'package:cart/widgets/test_widget/customeButton.dart';
import 'package:cart/widgets/test_widget/widget_tester_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Flutter Custom Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(CustomButton());
    var text = find.byType(Text);
    expect(text, findsOneWidget);
  });

  testWidgets(" Badge Icon Widget Test", (WidgetTester tester) async {
    BadgeIcon badge = BadgeIcon(
      text: '',
      iconData: Icons.shopping_cart,
      notificationCount: 0,
      onTap: () {},
    );
    await tester.wrapAndPumpWidget(badge);
    final inkWell = tester.widget<InkWell>(find.byType(InkWell));
    expect(find.byWidget(inkWell), findsOneWidget);

    final Stack stack = tester.widget<Stack>(find.descendant(
        of: find.byWidget(inkWell), matching: find.byType(Stack)));
    final Positioned pos = tester.widget<Positioned>(find.descendant(
        of: find.byWidget(stack), matching: find.byType(Positioned)));
    final Container container = tester.widget<Container>(find.descendant(
        of: find.byWidget(pos), matching: find.byType(Container)));

    final Text text = tester.widget<Text>(find.descendant(
        of: find.byWidget(container), matching: find.byType(Text)));
    print("data :: ${text.data}");
    expect(text.data, '0');



  });
}
