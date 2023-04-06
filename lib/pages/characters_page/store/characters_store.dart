import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/pages/character_details_page/store/character_details_store.dart';
import 'package:rick_morty_test/repositores/character_service.dart';
import 'package:rick_morty_test/routes/app_routes.gr.dart';

part 'characters_store.g.dart';

enum StatusPage { isFailed, initial, isLoading, isSuccess, isLoadMore }

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

  int pageCounter = 1;

  @observable
  Observable<StatusPage> statusPage = Observable(StatusPage.initial);

  @action
  Future getCharacters(bool isLoadMore) async {
    statusPage.value =
        isLoadMore ? StatusPage.isLoadMore : StatusPage.isLoading;
    final result = await _characterService.getCharacters(pageCounter);
    if (result.isSuccess) {
      characters.addAll(result.data!);
      pageCounter++;
      statusPage.value = StatusPage.isSuccess;
    } else {
      statusPage.value = StatusPage.isFailed;
    }
  }

  @action
  toCharacterDetailsPage(Character character) {
    _characterDetailsStore?.character = character;
    return _characterService.appRoutes
        .push(CharacterDetailsRoute(controller: _characterDetailsStore!));
  }
}
