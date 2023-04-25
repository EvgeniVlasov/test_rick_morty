// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:rick_morty_test/main.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/pages/characters_page/characters_screen.dart';
import 'package:rick_morty_test/pages/home_page/home_screen.dart';
import 'package:rick_morty_test/providers/app_response.dart';
import 'package:rick_morty_test/repositores/character_service.dart';
import 'package:rick_morty_test/repositores/character_service_prod.dart';
import 'package:rick_morty_test/repositores/character_service_test.dart';
import 'package:rick_morty_test/routes/app_routes.dart';
import 'package:rick_morty_test/main.dart' as app;

void main() {
  testWidgets('integrations test app', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    getIt.registerSingleton<AppRoutes>(AppRoutes());
    getIt.registerSingleton<CharacterService>(CharacterServiceTest(
        responseCharacters:
            AppResponse<ObservableList<Character>?, Exception>.success(
                data: ObservableList<Character>.of(List<Character>.generate(
                    5, (index) => Character(id: index))))));
    await tester.pumpWidget(MyApp(appRoutes: AppRoutes()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('scaffold_key')), findsOneWidget);
    expect(find.byKey(const Key('characters_btn')), findsOneWidget);
    await tester.tap(find.byKey(const Key('characters_btn')));
    await tester.pump();
  });
}
