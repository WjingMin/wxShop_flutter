import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/MyhomePage.dart';
import 'Store/store.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Changecartlist>.value(value: Changecartlist([], 0)),
    // ChangeNotifierProvider<SearchSettings>.value(value: searchSettings)
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyhomePage(),
    );
  }
}
