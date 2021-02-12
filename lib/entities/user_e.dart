class UserE {
  final String username;

  UserE.fromJson(Map<String, dynamic> json) :username = json["username"];
}