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


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebClassApp',
      theme: new ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Example',),
        '/Login': (context) => Login(),
        '/Categorias': (context) => Categorias(),
        '/Cursos': (context) => Cursos(),
        '/Register': (context) => Register(),
        '/Ip': (context) => IpPost(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  var p;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body:  new Center(
          child: (p = Index()),
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
              title: Text('Register'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/Register');
              }
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                globals.session = globals.Session();
                Navigator.pop(context);
                p.initState();
              }
            ),
            ListTile(
                title: Text('IP Post'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/Ip');
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
            child: new ListView(
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

  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Index> {
  Future<globals.PostLogin> post;

  TextEditingController ipController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    post = globals.session.fetchPost();
  }

  void _refresh() {
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
                              new TextField(
                                controller: ipController,
                                decoration: InputDecoration(
                                    hintText: "IP....", labelText: 'Post IP'),
                              ),
                              RaisedButton(
                                  onPressed: (){
                                    globals.serverIp = ipController.text;
                                  },
                                  child: const Text('Set IP')
                              ),
                              RaisedButton(
                                onPressed: _refresh,
                                child: const Text('Refresh'),
                              ),
                            ])
                    );
              else if(snapshot.hasData) {
                return Center(
                    child: Column(
                            children: <Widget>[
                              Text(snapshot.data.username),
                              new TextField(
                                controller: ipController,
                                decoration: InputDecoration(
                                    hintText: "IP....", labelText: 'Post IP'),
                              ),
                              RaisedButton(
                                onPressed: (){
                                  globals.serverIp = ipController.text;
                                },
                                child: const Text('Set IP')
                              ),
                              RaisedButton(
                                 onPressed: _refresh,
                                 child: const Text('Refresh'),
                        )]
                    )
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Column(
                        children: <Widget>[
                          Text("${snapshot.error}"),
                          new TextField(
                            controller: ipController,
                            decoration: InputDecoration(
                                hintText: "IP....", labelText: 'Post IP'),
                          ),
                          RaisedButton(
                              onPressed: (){
                                globals.serverIp = ipController.text;
                              },
                              child: const Text('Set IP')
                          ),
                          RaisedButton(
                            onPressed: _refresh,
                            child: const Text('Refresh'),
                          ),
                        ]));
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

class IpPost extends StatelessWidget {
  TextEditingController IpController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IpPost'),
      ),
      body: Column(
        children: <Widget>[
          new TextField(
            controller: IpController,
            decoration: InputDecoration(
            hintText: "IP...", labelText: 'Post Ip'),
      ),
          RaisedButton(
            onPressed: (){
              globals.serverIp = IpController.text;
              Navigator.pop(context);
            },
            child: const Text('Set IP'),
          ),]
      ),
    );
  }
}
