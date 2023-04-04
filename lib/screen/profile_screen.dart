import 'dart:io';

import 'package:call_app/contact_model%20class.dart';
import 'package:call_app/screen/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();
  String? editpath;
  @override
  Widget build(BuildContext context) {
    int i = ModalRoute.of(context)!.settings.arguments as int;
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
                        setState(() {
                        });
                        Navigator.pop(context);
                      },
                      child:
                          Icon(Icons.arrow_back_ios_new, color: Colors.blue)),
                  trailing: InkWell(
                      onTap: () {
                        update(contactlist[i],i);
                      },
                      child: Icon(Icons.edit, color: Colors.blue)),
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
                            Text("${contactlist[i].name}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 10),
                            Text("+91 ${contactlist[i].number}",
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
                                        "sms:${contactlist[i].number}?body=hi! I am prince"));
                                  },
                                  child: Icon(Icons.message,
                                      color: Colors.blue, size: 35),
                                ),
                                InkWell(
                                    onTap: () async {
                                      setState(() {
                                        callhistory.add(contactlist[i]);
                                      });
                                      await launchUrl(
                                          Uri.parse("tel:${contactlist[i].number}"));
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
                          contactlist[i].img == null
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
                                        FileImage(File("${contactlist[i].img}")),
                                  ),
                                ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: contactlist[i].fav == true
                                ? Icon(Icons.star, color: Colors.blue, size: 25)
                                : Icon(Icons.star_border,
                                    color: Colors.blue, size: 25),
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
                              Share.share("${contactlist[i].name}\n${contactlist[i].number}");
                            },
                            child: message("Share Contact")),
                        Divider(height: 1, color: Colors.blue),
                        InkWell(
                            onTap: () {
                              setState(() {
                                if (contactlist[i].fav == true) {
                                  contactlist[i].fav = false;
                                } else {
                                  contactlist[i].fav = true;
                                }
                              });
                              ContactModel c = ContactModel(fav: contactlist[i].fav);
                            },
                            child: message(contactlist[i].fav == false
                                ? "Add To Favourite"
                                : "Remove To Favourite")),
                      ]),
                ),
                SizedBox(height: 25),
                InkWell(
                    onTap: () {
                      contactlist.removeAt(i);
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

  void update(ContactModel c,int index) {
    name=TextEditingController(text: c.name);
    number=TextEditingController(text: c.number);
    showDialog(
      context: context,
      builder: (context) {
       return AlertDialog(
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Update Contact",
                style: TextStyle(color: Colors.blue),
              ),
              FloatingActionButton(onPressed: () {
                setState(() {
                  contactlist[index]=ContactModel(name: name.text,number: number.text,img: editpath);
                });
                Navigator.pop(context);
              },child: Icon(Icons.done,size: 30,color: Colors.white)),
            ],
          ),content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Stack(alignment: Alignment(1.2, 1), children: [
                      c.img == null
                          ? CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://www.nicepng.com/png/detail/811-8114232_silhouette-grey-person-icon.png"),
                      )
                          : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(File("${c.img}")),
                      ),
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                elevation: 0,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                            onTap: () async {
                                              ImagePicker img = ImagePicker();
                                              XFile? xfile =
                                              await img.pickImage(
                                                  source: ImageSource
                                                      .gallery);
                                              setState(() {
                                                editpath = xfile!.path;
                                              });
                                            },
                                            child: img_option(
                                                Icon(Icons.image,
                                                    color: Colors.blue),
                                                "Gallery")),
                                        InkWell(
                                          onTap: () async {
                                            ImagePicker img = ImagePicker();
                                            XFile? xfile =
                                            await img.pickImage(
                                                source:
                                                ImageSource.camera);
                                            setState(() {
                                              editpath = xfile!.path;
                                            });
                                          },
                                          child: img_option(
                                              Icon(Icons.camera_alt,
                                                  color: Colors.blue),
                                              "Camera"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                title: Text("Image pick"),
                              );
                            },
                          );
                        },
                        child: Icon(Icons.camera_alt_outlined,
                            color: Colors.white, size: 25),
                      ),
                    ]),
                    TextFormField(
                      controller: name,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        prefixIcon: Icon(Icons.person_2_outlined,
                            color: Colors.blue, size: 25),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: number,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Number",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        prefixIcon: Icon(Icons.phone_enabled_outlined,
                            color: Colors.blue, size: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
          ),
        );
      },
    );
  }
  Column img_option(Icon i, String title) {
    return Column(
      children: [
        i,
        SizedBox(height: 4),
        Text("$title"),
      ],
    );
  }
}
