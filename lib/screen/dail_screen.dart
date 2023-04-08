import 'package:call_app/contact_model%20class.dart';
import 'package:call_app/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Dialscreen extends StatefulWidget {
  const Dialscreen({Key? key}) : super(key: key);

  @override
  State<Dialscreen> createState() => _DialscreenState();
}

class _DialscreenState extends State<Dialscreen> {
  TextEditingController phonepnum = TextEditingController();
  String pnum = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    trailing: InkWell(onTap: () {
                      setState(() {
                            pnum=pnum.substring(0,pnum.length-1);
                            print(pnum);
                      });
                    },child: Icon(Icons.backspace, color: Colors.blue)),
                    title: Text("$pnum",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black)),
                    tileColor: Colors.white,
                    shape: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '1';
                            });
                          },
                          child: box("1")),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '2';
                            });
                          },
                          child: box("2")),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '3';
                            });
                          },
                          child: box("3")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '4';
                            });
                          },
                          child: box("4")),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '5';
                            });
                          },
                          child: box("5")),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '6';
                            });
                          },
                          child: box("6")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '7';
                            });
                          },
                          child: box("7")),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '8';
                            });
                          },
                          child: box("8")),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '9';
                            });
                          },
                          child: box("9")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '*';
                            });
                          },
                          child: box("*")),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '0';
                            });
                          },
                          child: box("0")),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pnum = pnum + '#';
                            });
                          },
                          child: box("#")),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse("tel:$pnum"));
                        ContactModel c=ContactModel(number: pnum,name: "Unkonw Number");
                        callhistory.add(c);
                      },
                      child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.call,
                            size: 25,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget box(String i) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Text(
            "$i",
            style: TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.w500),
          )),
    );
  }
}
