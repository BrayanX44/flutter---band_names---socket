import 'package:flutter/material.dart';
import 'package:band_names/src/features/app/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Band Names',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage()
      },
      home: const HomePage(),
    );
  }
}