import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Mobil Proglamlama', (WidgetTester deneyici) async {
    await deneyici.pumpWidget(BenimUygulamam());

    expect(find.text('Instagram'), findsOneWidget);

    expect(find.byIcon(Icons.home), findsOneWidget);

    final begenmeTusu = find.byIcon(Icons.favorite_border).first;
    await deneyici.tap(begenmeTusu);
    await deneyici.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}