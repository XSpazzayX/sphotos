class UserE{
  final String _username;
  UserE.fromJson(Map<String,dynamic> json):_username = json["username"];

  String get username => _username;
}