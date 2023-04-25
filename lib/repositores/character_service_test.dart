import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/character_notification_lazy.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/providers/app_response.dart';
import 'package:rick_morty_test/providers/dio_client.dart';
import 'package:rick_morty_test/providers/storage_provider.dart';
import 'package:rick_morty_test/repositores/character_service.dart';
import 'package:rick_morty_test/routes/app_routes.dart';

class CharacterServiceTest implements CharacterService {
  final AppResponse<ObservableList<Character>?, Exception>? responseCharacters;
  final NotificationCharacterLazy? notificationCharacterLazy;

  CharacterServiceTest(
      {this.responseCharacters, this.notificationCharacterLazy});

  @override
  AppRoutes? get appRoutes => null;

  @override
  DioClient? get dioClient => null;

  @override
  StorageProvider? get storageProvider => null;

  @override
  NotificationCharacterLazy? get contentMessageNotification =>
      notificationCharacterLazy;

  @override
  Future<AppResponse<ObservableList<Character>?, Exception>> getCharacters(
      [int? page, String? name]) async {
    final result = await Future.delayed(
        const Duration(milliseconds: 500), () => responseCharacters);
    if (result != null && result.isSuccess) {
      return AppResponse.success(data: result.data);
    } else {
      return AppResponse.error(error: result?.error ?? Exception('Response = null'));
    }
  }

  @override
  Future<void> removeDataNotification() async {}
}
