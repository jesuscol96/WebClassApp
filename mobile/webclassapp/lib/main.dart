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

void _showDialogCategory(context, Map category) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(category['name']),
        content: Text(category['description']),
        // content: new ListView(
        //   children: <Widget>[
        //     Text(category['description'])
        //   ],
        // ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          FlatButton(
            onPressed: () async{
              globals.PostLogin p = await globals.session.createPost('http://' + globals.serverIp + '/categorias/delete_category_flutter',
                        body: {'pk': category['pk'].toString()} );
              Navigator.of(context).pop();
              if (p.success)
                print('Delete was successful');
            },
            child: Text('Delete'),
            ),
          FlatButton(
            onPressed:null,
            child: Text('Suscribe'),
            ),
          new FlatButton(
            child: new Text("Close"),
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
        '/': (context) => MyHomePage(title: 'WebClassApp',),
        '/Login': (context) => Login(),
        '/Categorias': (context) => Categorias(),
        '/Cursos': (context) => Cursos(),
        '/Register': (context) => Register(),
        '/Ip': (context) => IpPost(),
        '/Suscripciones': (context) => Subscriptions(),
        '/MisCursos': (context) => MyCourses(),
        '/CrearCategorias': (context) => CrearCategoria(),
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
                Navigator.pushNamed(context, '/Suscripciones');
              },
            ),
            ListTile(
              title: Text('My courses'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/MisCursos');
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

class Categorias extends StatefulWidget{
  Categorias({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  Future<globals.PostLogin> post;

  @override
  void initState() {
    super.initState();
    post = globals.session.fetchPost('/categorias/index_flutter');
  }

  void _refresh() {
    setState(() {
      post = globals.session.fetchPost('/categorias/index_flutter');
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Categorías',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Categorías'),
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
                      ])
              );
            else if(snapshot.hasData) {
              return ListView(
                  children: <Widget>[
                        Text('Categorías'),
                        RaisedButton(
                          onPressed: (){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CrearCategoria()),);
                          },
                          child: Text('Crear Categoría'),
                        ),
                        for (var category in snapshot.data.categorias) Column(
                          children: <Widget>[
                            Text(category['name']),
                            Text(category['description']),
                            RaisedButton(
                              onPressed: (){
                                _showDialogCategory(context,category);
                              },
                              child:Text('Read More...'),
                            ),
                          ],
                          ),
                        //Text(snapshot.data.cursos[0]['title']),
                        RaisedButton(
                          onPressed: _refresh,
                          child: const Text('Refresh'),
                        )]
                  );
            } else if (snapshot.hasError) {
              return Center(
                  child: Column(
                      children: <Widget>[
                        Text("${snapshot.error}"),
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
    ),
    );
  }
}

class Cursos extends StatefulWidget{
  Cursos({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CursosState createState() => _CursosState();
}

class _CursosState extends State<Cursos> {
  Future<globals.PostLogin> post;

  @override
  void initState() {
    super.initState();
    post = globals.session.fetchPost('/cursos/index_flutter');
  }

  void _refresh() {
    setState(() {
      post = globals.session.fetchPost('/cursos/index_flutter');
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cursos',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Cursos'),
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
                      ])
              );
            else if(snapshot.hasData) {
              return ListView(
                  children: <Widget>[
                        Text('Cursos'),
                        RaisedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CrearCurso()),);
                          },
                          child: Text('Crear Curso'),
                        ),
                        for (var curso in snapshot.data.cursos) Column(
                          children: <Widget>[
                            Text(curso['title']),
                            Text(curso['description']),
                            RaisedButton(
                              onPressed:() {
                                globals.curso = curso;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => VerCurso()),);
                              },
                              child: Text('Read More'),
                            )
                          ],
                          ),
                        //Text(snapshot.data.cursos[0]['title']),
                        RaisedButton(
                          onPressed: _refresh,
                          child: const Text('Refresh'),
                        )]
                  );
            } else if (snapshot.hasError) {
              return Center(
                  child: Column(
                      children: <Widget>[
                        Text("${snapshot.error}"),
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
    ),
    );
  }
}

class Subscriptions extends StatefulWidget{
  Subscriptions({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  Future<globals.PostLogin> post;

  @override
  void initState() {
    super.initState();
    post = globals.session.fetchPost('/cursos/ver_subscriptions_flutter');
  }

  void _refresh() {
    setState(() {
      post = globals.session.fetchPost('/cursos/ver_subscriptions_flutter');
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Subcripciones',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Subscripciones'),
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
                      ])
              );
            else if(snapshot.hasData) {
              return ListView(
                  children: <Widget>[
                        Text('Suscripciones'),
                        RaisedButton(
                          onPressed: null,
                          child: Text('Crear Suscripciones'),
                        ),
                        for (var suscripcion in snapshot.data.cursos) Column(
                          children: <Widget>[
                            Text(suscripcion['course_id'].toString()),
                            Text(suscripcion['user_id'].toString()),
                            Text('Next Suscription')
                          ],
                          ),
                        //Text(snapshot.data.cursos[0]['title']),
                        RaisedButton(
                          onPressed: _refresh,
                          child: const Text('Refresh'),
                        )]
                  );
            } else if (snapshot.hasError) {
              return Center(
                  child: Column(
                      children: <Widget>[
                        Text("${snapshot.error}"),
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
    ),
    );
  }
}

class MyCourses extends StatefulWidget{
  MyCourses({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  Future<globals.PostLogin> post;

  @override
  void initState() {
    super.initState();
    post = globals.session.fetchPost('/cursos/my_courses_flutter');
  }

  void _refresh() {
    setState(() {
      post = globals.session.fetchPost('/cursos/my_courses_flutter');
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mis Cursos',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Mis Cursos'),
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
                      ])
              );
            else if(snapshot.hasData) {
              return ListView(
                  children: <Widget>[
                        Text('Mis Cursos'),
                        RaisedButton(
                          onPressed: null,
                          child: Text('Crear Cursos'),
                        ),
                        for (var curso in snapshot.data.cursos) Column(
                          children: <Widget>[
                            Text(curso['title']),
                            Text(curso['description']),
                            Text('Next Course')
                          ],
                          ),
                        //Text(snapshot.data.cursos[0]['title']),
                        RaisedButton(
                          onPressed: _refresh,
                          child: const Text('Refresh'),
                        )]
                  );
            } else if (snapshot.hasError) {
              return Center(
                  child: Column(
                      children: <Widget>[
                        Text("${snapshot.error}"),
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

class CrearCategoria extends StatelessWidget {
  final Future<globals.PostLogin> post;

  CrearCategoria({Key key, this.post}) : super(key: key);
  static final CREATE_POST_URL = 'http://' + globals.serverIp + '/categorias/process_new_categories_flutter';
  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Crear Categoría",
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Crear Categoría'),
          ),
          body: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new ListView(
              children: <Widget>[
                new TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Name....", labelText: 'Post Name'),
                ),
                new TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: "Description....", labelText: 'Post Description'),
                ),
                new RaisedButton(
                  onPressed: () async {
                    globals.PostLogin p = await globals.session.createPost(CREATE_POST_URL,
                        body: {'name': nameController.text,'description': descriptionController.text});
                    if (p.success){
                        print('Creation Successful');
                    }
                  },
                  child: const Text("Create"),
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
    post = globals.session.fetchPost('/index_flutter');
  }

  void _refresh() {
    setState(() {
      post = globals.session.fetchPost('/index_flutter');
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

class VerCurso extends StatelessWidget{

  // VerCurso({Key key, this.curso}) : super(key: key);
  // final Map curso;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descripción del curso'),
      ),
      body: ListView(
        children: <Widget>[
          Text(globals.curso['title']),
          RaisedButton(
            onPressed: () async{
              globals.PostLogin p = await globals.session.createPost('http://' + globals.serverIp + '/cursos/process_subscribe_flutter',
                  body: {'pk': globals.curso['id'].toString()} );
              Navigator.of(context).pop();
              if (p.success)
                print('Suscribe was successful');
            },
            child: Text('Suscribe'),
            ),
          //Text(globals.curso['subtitle']),
          Text(globals.curso['about_instructor']),
          Text(globals.curso['playlist_url']),
          Text(globals.curso['what_will_students_learn']),
          Text(globals.curso['target_students']),
          Text(globals.curso['requirements']),
          Text(globals.curso['discount_price'].toString()),
          Text(globals.curso['actual_price'].toString()),
        ],
      ),
    );
  }
}

class CrearCurso extends StatelessWidget {
  final Future<globals.PostLogin> post;

  CrearCurso({Key key, this.post}) : super(key: key);
  static final CREATE_POST_URL = 'http://' + globals.serverIp + '/cursos/process_new_curso_flutter';
  TextEditingController titleController = new TextEditingController();
  TextEditingController subtitleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController categoria_idController = new TextEditingController();
  TextEditingController about_instructorController = new TextEditingController();
  TextEditingController playlist_urlController = new TextEditingController();
  TextEditingController what_will_students_learnController = new TextEditingController();
  TextEditingController target_studentsController = new TextEditingController();
  TextEditingController requirementsController = new TextEditingController();
  TextEditingController discount_priceController = new TextEditingController();
  TextEditingController actual_priceController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Crear Curso",
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Crear Curso'),
          ),
          body: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new ListView(
              children: <Widget>[
                new TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: "Title....", labelText: 'Post Title'),
                ),
                new TextField(
                  controller: subtitleController,
                  decoration: InputDecoration(
                      hintText: "Subtitle....", labelText: 'Post Subtitle'),
                ),
                new TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: "Description....", labelText: 'Post Description'),
                ),
                new TextField(
                  controller: categoria_idController,
                  decoration: InputDecoration(
                      hintText: "Category id....", labelText: 'Post Category id'),
                ),
                new TextField(
                  controller: about_instructorController,
                  decoration: InputDecoration(
                      hintText: "About Instructor....", labelText: 'Post About Instructor'),
                ),
                new TextField(
                  controller: playlist_urlController,
                  decoration: InputDecoration(
                      hintText: "Playlist URL....", labelText: 'Post Playlist URL'),
                ),
                new TextField(
                  controller: what_will_students_learnController,
                  decoration: InputDecoration(
                      hintText: "What Will Students Learn....", labelText: 'Post What Will Students Learn'),
                ),
                new TextField(
                  controller: target_studentsController,
                  decoration: InputDecoration(
                      hintText: "Target Students....", labelText: 'Post Target Students'),
                ),
                new TextField(
                  controller: requirementsController,
                  decoration: InputDecoration(
                      hintText: "Requirements....", labelText: 'Post Requirements'),
                ),
                new TextField(
                  controller: discount_priceController,
                  decoration: InputDecoration(
                      hintText: "Discount Price....", labelText: 'Post Discount Price'),
                ),
                new TextField(
                  controller: actual_priceController,
                  decoration: InputDecoration(
                      hintText: "Actual Price....", labelText: 'Post Actual Price'),
                ),
                new RaisedButton(
                  onPressed: () async {
                    globals.PostLogin p = await globals.session.createPost(CREATE_POST_URL,
                        body: {'title': titleController.text,'subtitle': subtitleController.text, 'description': descriptionController.text, 'categoria_id': categoria_idController.text, 'about_instructor': about_instructorController.text, 'about_instructor': about_instructorController.text, 'playlist_url': playlist_urlController.text, 'what_will_students_learn': what_will_students_learnController.text, 'target_students': target_studentsController.text, 'requirements': requirementsController.text, 'discount_price': discount_priceController.text, 'actual_price': actual_priceController.text});
                    if (p.status=='done'){
                      print('Creation Successful');
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Create"),
                )
              ],
            ),
          )),
    );
  }
}