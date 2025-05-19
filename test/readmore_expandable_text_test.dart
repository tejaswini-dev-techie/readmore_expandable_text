import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:readmore_expandable_text/readmore_expandable_text.dart';

void main() {
  testWidgets('ReadMoreExpandableText displays text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReadMoreExpandableText(
            text: 'Test text',
          ),
        ),
      ),
    );

    expect(find.text('Test text'), findsOneWidget);
  });
}
