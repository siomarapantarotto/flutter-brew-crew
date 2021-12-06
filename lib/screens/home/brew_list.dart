import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/brew.dart';

class BrewList extends StatefulWidget {
  BrewList({Key? key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew?>?>(context);
    if (brews != null) {
      brews.forEach((brew) {
        debugPrint(brew!.name);
        debugPrint(brew.sugars);
      });
    }

    return Container();
  }
}
