import 'package:flutter/material.dart';
import 'package:brew_crew/models/app_user.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  // All Firebase versions have been updated and now you have to call Firebase.initializeApp() before
  // using any Firebase product. The 2 lines bellow were added due to it. @see: pubspec.yaml file.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      catchError: (user, appUser) => null,
      initialData:null,
      value: AuthService().streamUser,
      child: const MaterialApp(
        home: Wrapper(),
        ),
    );
  }
}

