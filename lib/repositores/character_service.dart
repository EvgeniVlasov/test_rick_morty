import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/character_notification_lazy.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/providers/app_response.dart';
import 'package:rick_morty_test/providers/dio_client.dart';
import 'package:rick_morty_test/providers/storage_provider.dart';
import 'package:rick_morty_test/routes/app_routes.dart';

abstract class CharacterService {
  final DioClient? dioClient;
  final AppRoutes? appRoutes;
  final StorageProvider? storageProvider;

  CharacterService(this.dioClient, this.appRoutes, this.storageProvider);

  Future<AppResponse<ObservableList<Character>?, Exception>> getCharacters(
      [int? page, String? name]);

  Future<void> removeDataNotification();

  NotificationCharacterLazy? get contentMessageNotification;
}
