import 'package:flutter/material.dart';
import 'package:brew_crew/models/app_user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<AppUser?>(context);
    //final AppUser? user = Provider.of<AppUser?>(context);
    debugPrint('Inside wrapper.dart - user: ' + user.toString());

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    
  }
}
