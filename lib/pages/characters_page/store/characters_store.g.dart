// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on _CharactersStore, Store {
  late final _$charactersAtom =
      Atom(name: '_CharactersStore.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$statusPageAtom =
      Atom(name: '_CharactersStore.statusPage', context: context);

  @override
  Observable<StatusPage> get statusPage {
    _$statusPageAtom.reportRead();
    return super.statusPage;
  }

  @override
  set statusPage(Observable<StatusPage> value) {
    _$statusPageAtom.reportWrite(value, super.statusPage, () {
      super.statusPage = value;
    });
  }

  late final _$searchCharacterAsyncAction =
      AsyncAction('_CharactersStore.searchCharacter', context: context);

  @override
  Future<dynamic> searchCharacter(String name) {
    return _$searchCharacterAsyncAction.run(() => super.searchCharacter(name));
  }

  late final _$_getCharactersAsyncAction =
      AsyncAction('_CharactersStore._getCharacters', context: context);

  @override
  Future<void> _getCharacters([String? name]) {
    return _$_getCharactersAsyncAction.run(() => super._getCharacters(name));
  }

  late final _$_CharactersStoreActionController =
      ActionController(name: '_CharactersStore', context: context);

  @override
  Future<dynamic> getMoreCharacters() {
    final _$actionInfo = _$_CharactersStoreActionController.startAction(
        name: '_CharactersStore.getMoreCharacters');
    try {
      return super.getMoreCharacters();
    } finally {
      _$_CharactersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getInitialCharacters() {
    final _$actionInfo = _$_CharactersStoreActionController.startAction(
        name: '_CharactersStore.getInitialCharacters');
    try {
      return super.getInitialCharacters();
    } finally {
      _$_CharactersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toCharacterDetailsPage(Character character) {
    final _$actionInfo = _$_CharactersStoreActionController.startAction(
        name: '_CharactersStore.toCharacterDetailsPage');
    try {
      return super.toCharacterDetailsPage(character);
    } finally {
      _$_CharactersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
characters: ${characters},
statusPage: ${statusPage}
    ''';
  }
}
