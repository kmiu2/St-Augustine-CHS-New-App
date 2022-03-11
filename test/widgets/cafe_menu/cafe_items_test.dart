import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:staugustinechsnewapp/widgets/cafe_menu/cafe_items.dart';

void main() {
  group('CafeItems widget tests', () {
    testWidgets('it displays title', (tester) async {
      String testTitle = 'Cafe Items';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CafeItems(
              title: testTitle,
              items: const [],
            ),
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
    });

    testWidgets('it displays items', (tester) async {
      String testTitle = 'Cafe Items';
      List<Map<String, String>> testItems = [
        {
          'food': 'Food Item',
          'price': '4.30',
          'image': 'assets/images/cat.jpg',
        },
        {
          'food': 'Food Item',
          'price': '1.45',
          'image': 'assets/images/cat.jpg',
        },
        {
          'food': 'Food Item',
          'price': '5.65',
          'image': 'assets/images/cat.jpg',
        },
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CafeItems(
              title: testTitle,
              items: testItems,
            ),
          ),
        ),
      );

      expect(find.text('Food Item'), findsNWidgets(3));
      expect(find.text('\$4.30'), findsNWidgets(1));
    });
  });
}
