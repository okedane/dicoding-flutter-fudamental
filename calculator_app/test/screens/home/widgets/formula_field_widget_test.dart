import 'package:calculator_app/screen/home/widgets/formula_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const key = Key("FormulaField");
  late TextEditingController textEditingController;
  late Widget widget;

  setUp(() {
    textEditingController = TextEditingController();
    widget = MaterialApp(
      home: Scaffold(
        body: FormulaField(key: key, tecFormula: textEditingController),
      ),
    );
  });

  group('formula field widget', () {
    testWidgets("have a DecoratedBox and TextFromField", (widgetTester) async {
      await widgetTester.pumpWidget(widget);

      final decoratedBox = find.byType(DecoratedBox);
      final textFormField = find.byType(TextFormField);

      expect(decoratedBox, findsOneWidget);
      expect(textFormField, findsOneWidget);
    });

    testWidgets("Have a DecoratedBox with style", (widgetTester) async {
      await widgetTester.pumpWidget(widget);

      final decoratedBoxFinder = find.byType(DecoratedBox);
      final decoratedBox = widgetTester.widget<DecoratedBox>(
        decoratedBoxFinder,
      );

      final border = Border.all(width: 2);
      final borderRadius = BorderRadius.circular(10);

      final boxDecoration = (decoratedBox.decoration as BoxDecoration);

      expect(boxDecoration.border, border);
      expect(boxDecoration.borderRadius, borderRadius);
    });

    testWidgets(
      "have a TextFromField with styles, like placeholder text and size",
      (widgetTester) async {
        const String hintPlaceholder = "Write a formula.";
        const int fontSize = 32;

        await widgetTester.pumpWidget(widget);

        final textFromFieldFinder = find.byType(TextField);
        final textFromFieldWidget = widgetTester.widget<TextField>(
          textFromFieldFinder,
        );

        expect(textFromFieldWidget.decoration?.hintText, hintPlaceholder);
        expect(textFromFieldWidget.style?.fontSize, fontSize);
        expect(textFromFieldWidget.maxLines, 3);
        expect(textFromFieldWidget.maxLines, 3);
      },
    );

    testWidgets("have to write some text", (widgetTester) async {
      const text = "2*2";
      await widgetTester.pumpWidget(widget);

      final textFormField = find.byType(TextFormField);

      await widgetTester.enterText(textFormField, text);
      expect(textEditingController.text, text);
    });
  });
}
