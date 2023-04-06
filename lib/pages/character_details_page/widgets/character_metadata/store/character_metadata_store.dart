import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/characters/character.dart';

part 'character_metadata_store.g.dart';

class CharacterMetadataStore = _CharacterMetadataStore
    with _$CharacterMetadataStore;

abstract class _CharacterMetadataStore with Store {
  @observable
  Character? character;

  _CharacterMetadataStore();
}
