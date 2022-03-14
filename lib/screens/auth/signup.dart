import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tpfm_app/screens/navy.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  final _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) {
                  _email = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Passowrd"),
                onChanged: (value) {
                  _password = value;
                },
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () async {
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    if (newuser != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => navy(context)));
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("SignUp"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
