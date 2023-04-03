import 'dart:io';

import 'package:call_app/contact_model%20class.dart';
import 'package:call_app/screen/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

List callhistory = [
  ContactModel(name: "prince", number: "4875436753"),
  ContactModel(name: "joyan", number: "4875436753"),
];

class Profilescreen extends StatefulWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {

  @override
  Widget build(BuildContext context) {
    List d = ModalRoute.of(context)!.settings.arguments as List;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                ListTile(
                  title: Text("Contacts",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                  leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          Icon(Icons.arrow_back_ios_new, color: Colors.blue)),
                  trailing: Icon(Icons.edit, color: Colors.blue),
                ),
                SizedBox(height: 100),
                Center(
                  child: Stack(
                    alignment: Alignment(0, -1.9),
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.shade100,
                                blurRadius: 15,
                                spreadRadius: 5,
                                offset: Offset(0, 0.2))
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            Text("${d[0].name}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 10),
                            Text("+91 ${d[0].number}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await launchUrl(Uri.parse(
                                        "sms:${d[0].number}?body=hi! I am prince"));
                                  },
                                  child: Icon(Icons.message,
                                      color: Colors.blue, size: 35),
                                ),
                                InkWell(
                                    onTap: () async {
                                      setState(() {
                                        callhistory.add(d[0]);
                                      });
                                      await launchUrl(
                                          Uri.parse("tel:${d[0].number}"));
                                    },
                                    child: Icon(Icons.call,
                                        color: Colors.blue, size: 35)),
                                Icon(Icons.videocam_rounded,
                                    color: Colors.blue, size: 35),
                                Icon(Icons.email, color: Colors.blue, size: 35),
                              ],
                            ),
                            // SizedBox(height: 60),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment(1.4, -0.8),
                        children: [
                          d[0].img == null
                              ? CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 70,
                                  child: CircleAvatar(
                                    radius: 65,
                                    backgroundImage: NetworkImage(
                                        "https://www.nicepng.com/png/detail/811-8114232_silhouette-grey-person-icon.png"),
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 70,
                                  child: CircleAvatar(
                                    radius: 65,
                                    backgroundImage:
                                        FileImage(File("${d[0].img}")),
                                  ),
                                ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child:
                                d[0].fav==true?Icon(Icons.star, color: Colors.blue, size: 25):Icon(Icons.star_border, color: Colors.blue, size: 25),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue.shade100,
                            blurRadius: 15,
                            spreadRadius: 5,
                            offset: Offset(0, 0.2))
                      ],
                      color: Colors.white),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        message("Send Whatsapp Message"),
                        Divider(height: 1, color: Colors.blue),
                        InkWell(
                            onTap: () {
                              Share.share("${d[0].name}\n${d[0].number}");
                            },
                            child: message("Share Contact")),
                        Divider(height: 1, color: Colors.blue),
                        InkWell(onTap: () {
                          setState(() {
                            if(d[0].fav==true)
                              {
                                d[0].fav=false;
                              }
                            else
                              {
                                d[0].fav=true;
                              }
                          });
                          ContactModel c=ContactModel(fav: d[0].fav);
                        },child: message(d[0].fav==false?"Add To Favourite":"Remove To Favourite")),
                      ]),
                ),
                SizedBox(height: 25),
                InkWell(
                    onTap: () {
                      contactlist.remove(d[0].number);
                      Navigator.pop(context);
                    },
                    child: box("Delete Contact")),
                SizedBox(height: 25),
                box("Block Contact"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget message(String title) => Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          "$title",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      );

  Widget box(String dialogue) {
    return Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.blue.shade100,
              blurRadius: 15,
              spreadRadius: 5,
              offset: Offset(0, 0.2))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text("$dialogue",
            style: TextStyle(
                color: Colors.red.shade700,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
