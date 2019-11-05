import 'package:flutter/material.dart';
import 'global.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PostLogin {
  final String username;
  final String password;
  final bool is_login;

  PostLogin({this.username, this.password, this.is_login});

  factory PostLogin.fromJson(Map<String, dynamic> json) {
    return PostLogin(
      username: json['username'],
      password: json['password'],
      is_login: json['is_login']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;
    map['is_login'] = is_login;

    return map;
  }
}

Future<PostLogin> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return PostLogin.fromJson(json.decode(response.body));
  });
}


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebClassApp',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Example',),
        '/Login': (context) => Login(),
        '/Categorias': (context) => Categorias(),
        '/Cursos': (context) => Cursos(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body:  new Center(
          child: Text(globals.serverIp)
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Django'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Categorias'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/Categorias');
              },
            ),
            ListTile(
              title: Text('Cursos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/Cursos');
              },
            ),
            ListTile(
              title: Text('Subscriptions'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('My courses'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Admin'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/Login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Categorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Category Description'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/CategoriasDescription');
          },
        ),
      ),
    );
  }
}

class Cursos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cursos'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Course Description'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/CursosDescription');
          },
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  final Future<PostLogin> post;

  Login({Key key, this.post}) : super(key: key);
  static final CREATE_POST_URL = 'http://' + globals.serverIp + '/process_login_flutter';
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Login",
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: "Username....", labelText: 'Post Username'),
                ),
                new TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Password....", labelText: 'Post Password'),
                ),
                new RaisedButton(
                  onPressed: () async {
                    PostLogin newPost = new PostLogin(
                        username: usernameController.text, password: passwordController.text);
                    PostLogin p = await createPost(CREATE_POST_URL,
                        body: {'username': usernameController.text,'password': passwordController.text});
                    print(p.is_login);
                  },
                  child: const Text("Create"),
                )
              ],
            ),
          )),
    );
  }
}