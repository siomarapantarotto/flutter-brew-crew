import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: RaisedButton(
            child: Text('Sign in anon'),
            onPressed: () async{
              dynamic authResult = await _authService.signInAnonymously();
              if (authResult == null) {
                print('ERROR: failed signing in anonymously!');
              } else {
                print('SUCCESS: user signed in anonymously');
                print(authResult.uid);
              }
            },
            ),          
          ),
    );
  }
}