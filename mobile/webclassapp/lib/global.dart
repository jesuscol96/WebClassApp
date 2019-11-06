library my_prj.globals;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PostLogin {
  final String username;
  final String password;
  final bool is_login;
  final bool is_user;
  final bool is_superuser;
  final String role;
  final bool is_student;
  final bool is_instructor;

  final String email;
  final String firstname;
  final String lastname;
  final String phone;
  final String gender;
  final String date_of_birth;
  final bool is_successful;

  PostLogin({this.is_user, this.is_successful,this.username, this.is_superuser, this.role, this.is_student, this.is_instructor, this.password, this.is_login,this.email,this.firstname,this.lastname,this.gender,this.date_of_birth,this.phone});

  factory PostLogin.fromJson(Map<String, dynamic> json) {
    return PostLogin(
      username: json['username'],
      password: json['password'],
      is_login: json['is_login'],
      is_user: json['is_user'],
      is_superuser: json['is_superuser'],
      role: json['role'],
      is_student: json['is_student'],
      is_instructor: json['is_instructor'],
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phone: json['phone'],
      gender: json['gender'],
      date_of_birth: json['date_of_birth'],
      is_successful: json['is_successful'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;
    map['is_login'] = is_login;
    map["is_user"] = is_user;
    map["is_superuser"] = is_superuser;
    map['role'] = role;
    map["is_student"] = is_student;
    map["is_instructor"] = is_instructor;
    map['email'] = email;
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map['phone'] = phone;
    map["gender"] = gender;
    map['date_of_birth'] = date_of_birth;
    map['is_successful'] = is_successful;

    return map;
  }
}

class Session {
  Map<String, String> headers = {};

  Future<PostLogin> fetchPost() async {
    final response = await http.get('http://' + serverIp + '/index_flutter', headers: headers);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      var map =PostLogin.fromJson(json.decode(response.body));
      print(map.username);
      updateCookie(response);
      return PostLogin.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<PostLogin> createPost(String url, {Map body}) async {
    return http.post(url, body: body,headers: headers).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      updateCookie(response);
      return PostLogin.fromJson(json.decode(response.body));
    });
  }

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
      (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}

String serverIp = '192.168.1.4';
var client = new http.Client();
var session = Session();