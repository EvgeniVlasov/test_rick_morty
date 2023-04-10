import 'dart:convert';

import 'package:rick_morty_test/models/character_notification_lazy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageProvider {
  final SharedPreferences prefs;

  StorageProvider(this.prefs);

  static Future<StorageProvider> init() async {
    final prefs = await SharedPreferences.getInstance();
    return StorageProvider(prefs);
  }

  static const _showMessageNotificationKeyLazy =
      'showMessageNotificationKeyLazy';

  Future<bool> setContentMessageLazy(String? message) async =>
      prefs.setString(_showMessageNotificationKeyLazy, message ?? '');

  NotificationCharacterLazy? getShowMessageLazy() {
    final result = prefs.getString(_showMessageNotificationKeyLazy);
    if (result != null) {
      return NotificationCharacterLazy.fromJson(jsonDecode(result));
    }
    return null;
  }

  Future<void> removeDataLazyNotification() async =>
      prefs.remove(_showMessageNotificationKeyLazy);
}
