import 'dart:io';

import 'package:call_app/contact_model%20class.dart';
import 'package:call_app/screen/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  String path = "";
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  InkWell(onTap: () {
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back,color: Colors.blue)),
                  SizedBox(width: 20),
                  Text(
                    "New Contact",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Stack(alignment: Alignment(1.2, 1), children: [
                        path == null
                            ? CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(
                                    "https://www.nicepng.com/png/detail/811-8114232_silhouette-grey-person-icon.png"),
                              )
                            : CircleAvatar(
                                radius: 70,
                                backgroundImage: FileImage(File("$path")),
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
                                                  path = xfile!.path;
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
                                                path = xfile!.path;
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
              ),
              SizedBox(height: 30),
              Center(
                child: InkWell(onTap: () {
                  ContactModel c=ContactModel(number: number.text,name: name.text,img: path);
                    contactlist.add(c);
                    Navigator.pop(context);
                },
                  child: Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Add Contact",
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
