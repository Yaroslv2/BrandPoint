import 'package:shared_preferences/shared_preferences.dart';

class User {
  final username;
  final password;
  final email;

  User({this.username, this.password, this.email});
}

readToken() async {
  final prefs = await SharedPreferences.getInstance();
  const key = "token";
  final rToken = prefs.get(key);
  return rToken;
}

saveToken(String email, String password, String username) async {
  final prefs = await SharedPreferences.getInstance();
  const key = "token";
  List<String> value = [email, password, username];
  prefs.setStringList(key, value);
}

removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  const key = "token";
  prefs.remove(key);
}
