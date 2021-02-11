import 'package:shared_preferences/shared_preferences.dart';
import 'package:sphotos/entities/login_history_e.dart';
import 'package:sphotos/services/interfaces/storage_service.dart';

class SharedPreferencesService extends StorageService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<LoginHistoryE> getLoginHistory() async {
    final SharedPreferences prefs = await this._prefs;
    final bool isFirstLogin = prefs.getBool('first_login') ?? false;
    return Future.value(LoginHistoryE(isFirstLogin));
  }
}
