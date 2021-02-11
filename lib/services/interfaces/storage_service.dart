import 'package:sphotos/entities/login_history_e.dart';

abstract class StorageService{
Future<LoginHistoryE> getLoginHistory();
}