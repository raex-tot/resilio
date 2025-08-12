import 'package:dbt_plus/features/common/tension_slider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('tension slider updates', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: TensionSlider()));
    final slider = find.byType(Slider);
    expect(slider, findsOneWidget);
    await tester.drag(slider, const Offset(100, 0));
    await tester.pump();
  });
}
