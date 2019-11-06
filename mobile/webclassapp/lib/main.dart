import 'package:flutter/material.dart';
import 'global.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void _showDialog(context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Login Success!"),
        content: new Text("Enjoy WebClassApp!"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

void _showDialogFalse(context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Login Failed"),
        content: new Text("Username and password are not recognizable. Register!"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Try again"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _showDialogRegister(context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Register Success!"),
        content: new Text("Enjoy WebClassApp!"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

void _showDialogFalseRegister(context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Register Failed"),
        content: new Text("Some data is missing or invalid!"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Try again"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
// class PostLogin {
//   final String username;
//   final String password;
//   final bool is_login;
//   final bool is_user;
//   final bool is_superuser;
//   final String role;
//   final bool is_student;
//   final bool is_instructor;

//   PostLogin({this.is_user, this.username, this.is_superuser, this.role, this.is_student, this.is_instructor, this.password, this.is_login});

//   factory PostLogin.fromJson(Map<String, dynamic> json) {
//     return PostLogin(
//       username: json['username'],
//       password: json['password'],
//       is_login: json['is_login'],
//       is_user: json['is_user'],
//       is_superuser: json['is_superuser'],
//       role: json['role'],
//       is_student: json['is_student'],
//       is_instructor: json['is_instructor'],
//     );
//   }

//   Map toMap() {
//     var map = new Map<String, dynamic>();
//     map["username"] = username;
//     map["password"] = password;
//     map['is_login'] = is_login;

//     return map;
//   }
// }

// class Session {
//   Map<String, String> headers = {};

//   Future<PostLogin> fetchPost() async {
//     final response = await http.get('http://' + globals.serverIp + '/index_flutter', headers: headers);

//     if (response.statusCode == 200) {
//       // If server returns an OK response, parse the JSON.
//       var map =PostLogin.fromJson(json.decode(response.body));
//       print(map.username);
//       updateCookie(response);
//       return PostLogin.fromJson(json.decode(response.body));
//     } else {
//       // If that response was not OK, throw an error.
//       throw Exception('Failed to load post');
//      }
//    }

//   Future<PostLogin> createPost(String url, {Map body}) async {
//   return globals.client.post(url, body: body,headers: headers).then((http.Response response) {
//     final int statusCode = response.statusCode;

//     if (statusCode < 200 || statusCode > 400 || json == null) {
//       throw new Exception("Error while fetching data");
//     }
//     updateCookie(response);
//     return PostLogin.fromJson(json.decode(response.body));
//   });
// }

//   void updateCookie(http.Response response) {
//     String rawCookie = response.headers['set-cookie'];
//     if (rawCookie != null) {
//       int index = rawCookie.indexOf(';');
//       headers['cookie'] =
//           (index == -1) ? rawCookie : rawCookie.substring(0, index);
//       }
//     }
//   }



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
        '/Index2': (context) =>  Index2(),
        '/Register': (context) => Register(),
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
          child: Index(),
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
            ListTile(
              title: Text('Index2'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/Index2');
              }
            ),
            ListTile(
              title: Text('Register'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/Register');
              }
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
  final Future<globals.PostLogin> post;

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
                    globals.PostLogin newPost = new globals.PostLogin(
                        username: usernameController.text, password: passwordController.text);
                    globals.PostLogin p = await globals.session.createPost(CREATE_POST_URL,
                        body: {'username': usernameController.text,'password': passwordController.text});
                    print(p.is_login);
                    if (p.is_login == false){
                        _showDialogFalse(context);
                    }
                    else{
                      _showDialog(context);
                      //Navigator.pop(context);
                    }
                  },
                  child: const Text("Login"),
                )
              ],
            ),
          )),
    );
  }
}

class Index extends StatefulWidget{
  Index({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Index> {
  Future<globals.PostLogin> post;

  @override
  void initState() {
    super.initState();
    post = globals.session.fetchPost();
  }

  void _refresh(){
    setState(() {
      post = globals.session.fetchPost();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FutureBuilder<globals.PostLogin>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData && (snapshot.data.username == 'none'))
                return Center(
                    child: Column(
                            children: <Widget>[
                              Text('You are not logged in. Please Log in'),
                              RaisedButton(
                                onPressed: _refresh,
                                child: const Text('Refresh'),
                              )
                            ])
                    );
              else if(snapshot.hasData) {
                return Text(snapshot.data.username);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      );
  }
}

class Index2 extends StatefulWidget{
  Index2({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyAppState2 createState() => _MyAppState2();
}

class _MyAppState2 extends State<Index2> {
  Future<globals.PostLogin> post;

  @override
  void initState() {
    super.initState();
    globals.client.post('http://' + globals.serverIp + '/process_login_flutter',body: {'username':'rootc', 'password':'1234'});
    post = globals.session.fetchPost();
  }

  void _refresh(){
    setState(() {
      post = globals.session.fetchPost();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index'),
      ),
      body: Center(
        child: FutureBuilder<globals.PostLogin>(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.hasData && (snapshot.data.username == 'none'))
              return Center(
                  child: Column(
                      children: <Widget>[
                        Text('You are not logged in. Please Log in'),
                        RaisedButton(
                          onPressed: _refresh,
                          child: const Text('Refresh'),
                        ),
                        Text(snapshot.data.username),
                      ])
              );
            else if(snapshot.hasData) {
              return Text(snapshot.data.username);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class Register extends StatelessWidget {
  final Future<globals.PostLogin> post;

  Register({Key key, this.post}) : super(key: key);
  static final CREATE_POST_URL = 'http://' + globals.serverIp + '/process_register_flutter';
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  TextEditingController dateofbirthController = new TextEditingController();
  TextEditingController roleController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Register",
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Register'),
          ),
          body: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new ListView(
              children: <Widget>[
                new TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: "Username....", labelText: 'Post Username'),
                ),
                new TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email....", labelText: 'Post Email'),
                ),
                new TextField(
                  controller: firstnameController,
                  decoration: InputDecoration(
                      hintText: "First Name....", labelText: 'Post First Name'),
                ),
                new TextField(
                  controller: lastnameController,
                  decoration: InputDecoration(
                      hintText: "Last Name....", labelText: 'Post Last Name'),
                ),
                new TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      hintText: "Phone....", labelText: 'Post Phone'),
                ),
                new TextField(
                  controller: genderController,
                  decoration: InputDecoration(
                      hintText: "Gender....", labelText: 'Post M or F'),
                ),
                new TextField(
                  controller: dateofbirthController,
                  decoration: InputDecoration(
                      hintText: "Date of Birth....", labelText: 'Example 2000-01-01'),
                ),
                new TextField(
                  controller: roleController,
                  decoration: InputDecoration(
                      hintText: "Role....", labelText: 'From 1 to 4'),
                ),
                new TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Password....", labelText: 'Post Password'),
                ),
                new RaisedButton(
                  onPressed: () async {
                    globals.PostLogin newPost = new globals.PostLogin(
                        username: usernameController.text, password: passwordController.text);
                    globals.PostLogin p = await globals.session.createPost(CREATE_POST_URL,
                        body: {'username': usernameController.text,'password': passwordController.text, 'email': emailController.text, 'firstname': firstnameController.text, 'lastname': lastnameController.text, 'phone': phoneController.text, 'gender': genderController.text, 'date_of_birth': dateofbirthController.text,'role':roleController.text});
                    print(p.is_successful);
                    if (p.is_successful == false){
                      _showDialogFalseRegister(context);
                    }
                    else{
                      _showDialogRegister(context);
                      //Navigator.pop(context);
                    }
                  },
                  child: const Text("Register"),
                )
              ],
            ),
          )),
    );
  }
}