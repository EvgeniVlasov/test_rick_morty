import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/character_notification_lazy.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/pages/character_details_page/store/character_details_store.dart';
import 'package:rick_morty_test/providers/app_response.dart';
import 'package:rick_morty_test/repositores/character_service.dart';
import 'package:rick_morty_test/routes/app_routes.gr.dart';

part 'characters_store.g.dart';

enum StatusPage {
  isFailed,
  initial,
  isLoading,
  isSuccess,
  isLoadMore,
  showNotificationMessage
}

class CharactersStore = _CharactersStore with _$CharactersStore;

abstract class _CharactersStore with Store {
  final CharacterService _characterService;
  CharacterDetailsStore? _characterDetailsStore;

  _CharactersStore(this._characterService) {
    _characterDetailsStore =
        CharacterDetailsStore(characterService: _characterService);
  }

  @observable
  ObservableList<Character> characters = ObservableList.of(<Character>[]);

  int? pageCounter;

  @observable
  Observable<StatusPage> statusPage = Observable(StatusPage.initial);

  NotificationCharacterLazy? get contentNotificationMessage =>
      _characterService.contentMessageNotification;

  @observable
  Observable<String> titleMessage = Observable('');

  @observable
  Observable<String> subtitleMessage = Observable('');

  @action
  Future searchCharacter(String name) async {
    statusPage.value = StatusPage.isLoading;
    characters.clear();
    autorun(
      (_) async {
        final result = await _getCharacters(name);
        if (result.isSuccess) {
          statusPage.reportWrite(StatusPage.isSuccess, StatusPage.isLoading,
              () {
            statusPage.value = StatusPage.isSuccess;
          });
        } else {
          statusPage.value = StatusPage.isFailed;
        }
      },
      delay: 2000,
    );
  }

  @action
  Future getMoreCharacters() async {
    statusPage.value = StatusPage.isLoadMore;
    final result = await _getCharacters();
    if (result.isSuccess) {
      pageCounter = pageCounter != null ? pageCounter! + 1 : 2;
      statusPage.value = StatusPage.isSuccess;
    } else {
      statusPage.value = StatusPage.isFailed;
    }
  }

  @action
  Future<void> getInitialCharacters() async {
    statusPage.value = StatusPage.isLoading;
    final result = await _getCharacters();
    if (result.isSuccess) {
      if (contentNotificationMessage != null) {
        titleMessage.value = contentNotificationMessage!.title!;
        subtitleMessage.value = contentNotificationMessage!.subtitle!;
        statusPage.value = StatusPage.showNotificationMessage;
      }
      pageCounter = 2;
      statusPage.value = StatusPage.isSuccess;
    } else {
      statusPage.value = StatusPage.isFailed;
    }
  }

  @action
  Future<AppResponse<bool, Exception>> _getCharacters([String? name]) async {
    final result = await _characterService.getCharacters(
        name == null ? pageCounter : null, name);
    if (result.isSuccess) {
      characters.addAll(result.data!);
      return AppResponse.success();
    } else {
      return AppResponse.error(error: result.error);
    }
  }

  @action
  Future<void> removeDataMessageNotification() {
    _characterService.appRoutes?.pop();
    return _characterService.removeDataNotification();
  }

  @action
  toCharacterDetailsPage(Character character) {
    _characterDetailsStore?.character = character;
    return _characterService.appRoutes
        ?.push(CharacterDetailsRoute(controller: _characterDetailsStore!));
  }
}
