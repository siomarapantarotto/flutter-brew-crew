import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
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

    void _showsSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
          );
      });
    }



    return StreamProvider<List<Brew>>.value(
      value: DatabaseService(uid: '').brews,
      initialData: List.empty(),
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text('Brew Crew'),
          elevation: 0.0,
          actions: <Widget>[            
            TextButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Logout'),
              onPressed: () async {
                await _authService.signOut();
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('Settings'),
              onPressed: () => _showsSettingsPanel(),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration (
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover
            ),            
          ),
          child: BrewList()
          ),
      ),
    );
  }
}
