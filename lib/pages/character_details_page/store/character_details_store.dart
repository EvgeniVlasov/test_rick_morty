import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/pages/character_details_page/widgets/character_metadata/store/character_metadata_store.dart';
import 'package:rick_morty_test/repositores/character_service.dart';

part 'character_details_store.g.dart';

class CharacterDetailsStore = _CharacterDetailsStore
    with _$CharacterDetailsStore;

abstract class _CharacterDetailsStore with Store {
  final CharacterService? characterService;

  @observable
  Character? character;

  final CharacterMetadataStore characterMetadataStore =
      CharacterMetadataStore();

  _CharacterDetailsStore({required this.characterService}) {
    when((p0) => character != null, () {
      characterMetadataStore.character = character;
    });
  }
}
