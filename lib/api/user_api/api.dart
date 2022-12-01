import "package:http/http.dart" as http;
import "dart:convert";

// class User {
//   String email;
//   String password;
//   String username;

//   User({required this.email, required this.password, required this.username});

//   factory User.fromJson(Map<String, dynamic> json) =>
//       User(email: json["mail"], password: json["psw"], username: json["name"]);
// }

Future<dynamic> postUser(String _mail, String _psw, String _name) async {
  var params = {'mail': _mail, 'psw': _psw, 'name': _name};
  final response = await http.post(Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(params));
  if (response.statusCode == 200) {
    return print("Zaebis");
  }
}

String uri = "http://192.168.110.21:5000/registration";
