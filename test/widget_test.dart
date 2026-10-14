import 'package:flutter_test/flutter_test.dart';
import 'package:stms_mobile/main.dart';

void main() {
  testWidgets('STMS home screen displays Bengali welcome and prayer times',
      (WidgetTester tester) async {
    await tester.pumpWidget(const StmsApp());

    expect(find.text('আসসালামু আলাইকুম'), findsOneWidget);
    expect(find.text('আজকের নামাজের সময়'), findsOneWidget);
    expect(find.text('ফজর'), findsOneWidget);
  });
}
