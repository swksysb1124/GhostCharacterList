// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ui_test/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    StreamController<String> streamController = StreamController();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

Future<String> getData(id) async {
  return Future.delayed(Duration(seconds: 2), () => "data@$id");
}

Future<void> periodicalJob(Function(String) callback) async {
  Stream stream = Stream<int>.periodic(
          Duration(milliseconds: 200), (data) => data) // 生成週期性 Stream
      .where((data) => data % 2 == 0) // 過濾條件：必須為偶數
      .skip(2) // 略過前 2 個
      .take(10) // 共取 10 個
      .map((data) => 'count$data'); // 將資料流由 int 映射為 String

  stream.listen(
    callback,
    onError: (e) => print(e),
    onDone: () => print('DONE!'),
    cancelOnError: true,
  );
}
