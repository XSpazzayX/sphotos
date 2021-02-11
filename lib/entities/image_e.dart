import 'user_e.dart';

class ImageE {
  final String id;
  final Map<String, dynamic> urls;
  final UserE userE;

  ImageE(this.id, this.urls, this.userE);

  ImageE.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        urls = json['urls'],
        userE = UserE.fromJson(json['user']);

}
