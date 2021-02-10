import 'user_e.dart';

class ImageE {
  final String _id;
  final Map<String, String> _urls;
  final UserE _userE;

  ImageE(this._id, this._urls, this._userE);

  ImageE.fromJson(Map<String, dynamic> json)
      : _id = json["id"],
        _urls = json['urls'],
        _userE = UserE.fromJson(json['user']);

  UserE get userE => _userE;

  Map<String, String> get urls => _urls;

  String get id => _id;
}
