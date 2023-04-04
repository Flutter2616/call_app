import 'dart:io';

import 'package:call_app/contact_model%20class.dart';
import 'package:flutter/material.dart';

List<ContactModel> contactlist = [
  ContactModel(name: "prince", number: "4875436753"),
  ContactModel(name: "joyan", number: "4875436753"),
  ContactModel(name: "janam", number: "4875436753"),
  ContactModel(name: "sakshi", number: "4875436753"),
];

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController search = TextEditingController();
  bool fav=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'add').then((value) {setState(() {

            });} );
          },child: Icon(Icons.add,color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade50,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text("Contacts",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 30),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                    controller: search,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        prefixIcon:
                            Icon(Icons.search, color: Colors.grey.shade400)),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  height: 75,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.shade100,
                          blurRadius: 5,
                          offset: Offset(0, 5))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://cdn3.vectorstock.com/i/thumb-large/54/17/person-gray-photo-placeholder-man-vector-24005417.jpg"),
                            radius: 25),
                        SizedBox(width: 15),
                        Text(
                          "My Contact",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "My contacts",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) => box(contactlist[index],index),
                      itemCount: contactlist.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget box(ContactModel c,int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(onTap: () {
        Navigator.pushNamed(context, 'profile',arguments: index).then((value) {
          setState(() {

          });
        });
      },
        child: Container(
          alignment: Alignment.center,
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                c.img == null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn3.vectorstock.com/i/thumb-large/54/17/person-gray-photo-placeholder-man-vector-24005417.jpg"),
                        radius: 20)
                    : CircleAvatar(
                        backgroundImage: FileImage(File("${c.img}")), radius: 20),
                SizedBox(width: 15),
                Text(
                  "${c.name}",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Spacer(),
                c.fav==true?Icon(Icons.star,color: Colors.blue,size: 20):Icon(Icons.star,color: Colors.white,size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
