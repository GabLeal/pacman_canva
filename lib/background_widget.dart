import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          color: Colors.black,
          child: Image.asset(
            'assets/images/pac_man_background.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: size.height,
          width: size.width,
          color: Colors.black.withOpacity(0.7),
        ),
      ],
    );
  }
}
