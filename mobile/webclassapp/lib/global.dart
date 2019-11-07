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

  final List cursos;
  final String title;
  final String description;
  final int id;
  final String user_id;
  final String category_id;
  final String sub_title;
  final String about_instructor;
  final String playlist_url;
  final String tags;
  final String photo;
  final String promo_video_url;
  final int creator_status;
  final int admin_status;
  final String what_will_students_learn;
  final String target_students;
  final String requirements;
  final double discount_price;
  final double actual_price;
  final int view_count;
  final String subscriber_count;
  final String deleted_at;
  final String created_at;
  final String updated_at;

  PostLogin({this.is_user, this.cursos, this.id, this.user_id, this.category_id, this.title, this.sub_title, this.description, this.about_instructor, this.playlist_url, this.tags, this.photo, this.promo_video_url, this.creator_status, this.admin_status, this.what_will_students_learn, this.target_students, this.requirements, this.discount_price, this.actual_price, this.view_count, this.subscriber_count, this.deleted_at, this.created_at, this.updated_at, this.is_successful,this.username, this.is_superuser, this.role, this.is_student, this.is_instructor, this.password, this.is_login,this.email,this.firstname,this.lastname,this.gender,this.date_of_birth,this.phone});

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
      cursos: json['cursos'],
      title: json['title'],
      description: json['description'],
      id: json['id'],
      user_id: json['user_id'],
      category_id: json['category_id'],
      sub_title: json['sub_title'],
      about_instructor: json['about_instructor'],
      playlist_url: json['playlist_url'],
      tags: json['tags'],
      promo_video_url: json['promo_video_url'],
      creator_status: json['creator_status'],
      admin_status: json['admin_status'],
      what_will_students_learn: json['what_will_students_learn'],
      target_students: json['target_students'],
      requirements: json['requirements'],
      discount_price: json['discount_price'],
      actual_price: json['actual_price'],
      view_count: json['view_count'],
      subscriber_count: json['subscriber_count'],
      deleted_at: json['deleted_at'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
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

    map["cursos"] = cursos;
    map['id'] = id;
    map['user_id'] = user_id;
    map["category_id"] =category_id;
    map['title'] = title;
    map['sub_title'] =sub_title;
    map["description"] =description;
    map['about_instructor'] = about_instructor;
    map['playlist_url'] = playlist_url;
    map["tags"] = tags;
    map['photo'] = photo;
    map['promo_video_url'] =promo_video_url;
    map["creator_status"] =creator_status;
    map['admin_status'] =admin_status;
    map['what_will_students_learn'] = what_will_students_learn;
    map["target_students"] = target_students;
    map['requirements'] =requirements;
    map['discount_price'] =discount_price;
    map["actual_price"] = actual_price;
    map['view_count'] = view_count;
    map['subscriber_count'] = subscriber_count;
    map["deleted_at"] = deleted_at;
    map['created_at'] = created_at;
    map['updated_at'] = updated_at;

    return map;
  }
}

class Session {
  Map<String, String> headers = {};

  Future<PostLogin> fetchPost(String link) async {
    final response = await http.get('http://' + serverIp + link, headers: headers);

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

//String serverIp = '159.90.175.129';
String serverIp = '192.168.1.4';
var session = Session();