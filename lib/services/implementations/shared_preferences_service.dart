import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sphotos/entities/login_history_e.dart';
import 'package:sphotos/services/interfaces/storage_service.dart';

class SharedPreferencesService extends StorageService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  BehaviorSubject<LoginHistoryE> loginHistoryE$;

  Future<LoginHistoryE> getLoginHistory() async {
    final SharedPreferences prefs = await this._prefs;
    final bool isFirstLogin = prefs.getBool('first_login') ?? true;
    return Future.value(LoginHistoryE(isFirstLogin));
  }

  SharedPreferencesService(this.loginHistoryE$) {
    getLoginHistory().then((loginHistory) =>
        loginHistoryE$.add(loginHistory));
  }

  @override
  Future<void> saveLoginFirstTime() async {
    final SharedPreferences prefs = await this._prefs;
    await prefs.setBool("first_login", false);
    LoginHistoryE loginHistoryE = await getLoginHistory();
    loginHistoryE$.add(loginHistoryE);
  }
}
