// import 'package:flutter_test/flutter_test.dart';
// import 'package:get_it/get_it.dart';
// import 'package:mockito/annotations.dart';
// import 'package:rick_morty_test/pages/characters_page/store/characters_store.dart';
// import 'package:rick_morty_test/providers/dio_client.dart';
// import 'package:rick_morty_test/providers/storage_provider.dart';
// import 'package:rick_morty_test/repositores/character_service.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:rick_morty_test/providers/dio_client.dart';
//
// import 'callable_moc.dart';
// import 'character_store_test.mocks.dart';
// // import 'mock.dio_client.dart';
//
// @GenerateNiceMocks([MockSpec<CharacterService>()])
// void main() {
//   group('test characters store', () {
//     final statusPage = MockCallable<StatusPage>();
//     final controller = CharactersStore(MockCharacterService());
//     // when(controller.getInitialCharacters()).thenAnswer((_) => fakeCharacters)
//     print(controller.statusPage.value);
//     assert(controller.statusPage.value==StatusPage.isSuccess);
//   });
// }
