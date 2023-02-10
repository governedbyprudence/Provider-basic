import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_checker/providers/Counter.dart';
import 'package:state_checker/providers/Internet.dart';
import 'package:state_checker/routes/homeScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>Counter()),
        ChangeNotifierProvider(create: (_)=>InternetProvider())
      ],
      child: MaterialApp(
        initialRoute: HomeScreenRoute.routeName,
        routes: {
          HomeScreenRoute.routeName:(context)=>HomeScreenRoute(),
        },
      ),
    )
  );
}

