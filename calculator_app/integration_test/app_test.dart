import 'package:calculator_app/calculator_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robot/evaluate_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("integrate all feature", (widgetTester) async {
    final evaluateRobot = EvaluateRobot(widgetTester);
    print("🚀 Memuat UI aplikasi...");
    await evaluateRobot.loadUI(const CalculatorApp());
    print("✅ UI berhasil dimuat!");

    print("⌨️ Mengetik formula yang benar: 3*25");
    await evaluateRobot.typeFormula("3*25");
    print("👆 Menekan tombol eksekusi...");
    await evaluateRobot.tapButton();

    print("⏳ Menunggu hasil muncul...");
    await widgetTester.pumpAndSettle(); 

    print("🔍 Mencari teks hasil...");
    bool resultExists = find.text("75.0").evaluate().isNotEmpty;
    print("📌 Teks ditemukan: $resultExists");

    if (!resultExists) {
      print("⚠️ ERROR: Teks hasil '75.0' tidak ditemukan!");
    }

    await evaluateRobot.checkResultText("75.0");

    print("⌨️ Mengetik formula yang salah: Math");
    await evaluateRobot.typeFormula("Math");
    print("👆 Menekan tombol eksekusi...");
    await evaluateRobot.tapButton();

    print("⏳ Menunggu hasil error muncul...");
    await widgetTester.pumpAndSettle();

    print("🔍 Mencari teks error...");
    bool errorExists =
        find.text("Cannot evaluate that formula.").evaluate().isNotEmpty;
    print("📌 Teks error ditemukan: $errorExists");

    if (!errorExists) {
      print("⚠️ ERROR: Teks error tidak ditemukan!");
    }

    await evaluateRobot.checkResultText("Cannot evaluate that formula.");
  });
}
