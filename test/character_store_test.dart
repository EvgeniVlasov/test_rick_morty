import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/providers/app_response.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/pages/characters_page/store/characters_store.dart';
import 'package:rick_morty_test/repositores/character_service_test.dart';

void main() async {
  group('testing characters store', () {
    test('test getInitialCharacters method success response', () async {
      final CharacterServiceTest serviceTest = CharacterServiceTest(
          responseCharacters:
              AppResponse<ObservableList<Character>?, Exception>.success(
                  data: ObservableList<Character>.of(List<Character>.generate(
                      5, (index) => Character(id: index)))),
          notificationCharacterLazy: null);
      final controller = CharactersStore(serviceTest);
      await controller.getInitialCharacters();
      expect(controller.statusPage.value, StatusPage.isSuccess);
    });

    test('test getInitialCharacters method failed result', () async {
      final CharacterServiceTest serviceTest = CharacterServiceTest(
          responseCharacters:
              AppResponse<ObservableList<Character>?, Exception>.error(),
          notificationCharacterLazy: null);
      final controller = CharactersStore(serviceTest);
      await controller.getInitialCharacters();
      expect(controller.statusPage.value, StatusPage.isFailed);
    });

    test('test getMoreCharacters method success response', () async {
      final CharacterServiceTest serviceTest = CharacterServiceTest(
          responseCharacters:
              AppResponse<ObservableList<Character>?, Exception>.success(
                  data: ObservableList<Character>.of(List<Character>.generate(
                      5, (index) => Character(id: index)))),
          notificationCharacterLazy: null);
      final controller = CharactersStore(serviceTest);
      await controller.getMoreCharacters();
      expect(controller.statusPage.value, StatusPage.isSuccess);
    });

    test('test getMoreCharacters method failed result', () async {
      final CharacterServiceTest serviceTest = CharacterServiceTest(
          responseCharacters:
              AppResponse<ObservableList<Character>?, Exception>.error(),
          notificationCharacterLazy: null);
      final controller = CharactersStore(serviceTest);
      await controller.getMoreCharacters();
      expect(controller.statusPage.value, StatusPage.isFailed);
    });

    test('test searchCharacters method success response', () async {
      final CharacterServiceTest serviceTest = CharacterServiceTest(
          responseCharacters:
              AppResponse<ObservableList<Character>?, Exception>.success(
                  data: ObservableList<Character>.of(List<Character>.generate(
                      5, (index) => Character(id: index)))),
          notificationCharacterLazy: null);
      final controller = CharactersStore(serviceTest);
      await controller.searchCharacter('');
      expect(controller.statusPage.value, StatusPage.isSuccess);
    });

    test('test getMoreCharacters method failed result', () async {
      final CharacterServiceTest serviceTest = CharacterServiceTest(
          responseCharacters:
              AppResponse<ObservableList<Character>?, Exception>.error(),
          notificationCharacterLazy: null);
      final controller = CharactersStore(serviceTest);
      await controller.searchCharacter('');
      expect(controller.statusPage.value, StatusPage.isFailed);
    });
  });
}
