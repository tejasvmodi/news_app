import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5CE1E6),
      body: Center(
        child: Container(
          
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
        
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/newsbanner.png',),fit: BoxFit.contain)
          ),
        ),
      )
    );
  }
}