import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew?>?>.value(
      value: DatabaseService(uid: '').brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text('Brew Crew'),
          elevation: 0.0,
          actions: <Widget>[
            //FlatButton.icon(
            TextButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Logout'),
              onPressed: () async {
                await _authService.signOut();
              },
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
