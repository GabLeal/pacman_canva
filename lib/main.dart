import 'package:flutter/material.dart';
import 'package:pacman/background_widget.dart';
import 'package:pacman/pacman/pac_man.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const BackgroundWidget(),
            const PacMan(),
            Positioned(
              top: size.height / 4,
              child: const Text(
                'pac man',
                style: TextStyle(
                  fontFamily: 'crackMan',
                  fontSize: 50,
                  color: Color(0xFFfdff00),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
