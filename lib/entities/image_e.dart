import 'user_e.dart';

class ImageE {
  final String id;
  final Map<String, dynamic> urls;
  final UserE userE;
  final String alt_description;
  final String description;

  ImageE(this.id, this.urls, this.userE, this.alt_description, this.description);

  ImageE.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        urls = json['urls'],
        userE = UserE.fromJson(json['user']),
        alt_description = json["alt_description"],
        description = json["description"];

}
