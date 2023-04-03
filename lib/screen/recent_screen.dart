import 'dart:io';

import 'package:call_app/contact_model%20class.dart';
import 'package:call_app/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class Recentscreen extends StatefulWidget {
  const Recentscreen({Key? key}) : super(key: key);

  @override
  State<Recentscreen> createState() => _RecentscreenState();
}

class _RecentscreenState extends State<Recentscreen> {
  bool swi = false;
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        swi = false;
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: swi == false
                              ? Colors.white
                              : Colors.grey.shade400),
                      child: Text(
                        "All",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        swi = true;
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: swi == true
                              ? Colors.white
                              : Colors.grey.shade400),
                      child: Text(
                        "Missed",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
                title: Text(
                  "Recents",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                ),
                trailing: Icon(
                  Icons.edit_calendar_outlined,
                  color: Colors.blue,
                  size: 25,
                )),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
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
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Box(callhistory[index]);
                },
                itemCount: callhistory.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Box(ContactModel c) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text("${c.name}",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 20)),
        trailing: Icon(Icons.info_outline, color: Colors.blue),
        leading: c.img == null
            ? CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    "https://www.nicepng.com/png/detail/811-8114232_silhouette-grey-person-icon.png"))
            : CircleAvatar(
                radius: 35, backgroundImage: FileImage(File("${c.img}"))),
        subtitle: Text("+91 ${c.number}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400)),
        tileColor: Colors.white,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
    );
  }
}
