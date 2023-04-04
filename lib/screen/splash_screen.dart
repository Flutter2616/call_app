import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, 'dash');
    },);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo.png",height: 200,width: 200,fit: BoxFit.fill),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Circle",style: GoogleFonts.pacifico(color: Colors.blue,fontSize: 50)),
                  SizedBox(width: 10),
                  Text("call",style: GoogleFonts.fasthand(fontSize: 50,color: Colors.black)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
