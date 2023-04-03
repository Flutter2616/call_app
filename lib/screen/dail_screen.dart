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
  TextEditingController phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              width: double.infinity,alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phonenumber,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your phone number",
                      suffixIcon: InkWell(
                        onTap: () {
                          launchUrl(Uri.parse("tel:${phonenumber.text}"));
                          setState(() {
                            ContactModel c=ContactModel(number: phonenumber.text);
                            callhistory.add(c);
                          });
                        },
                        child: Icon(
                          Icons.call,
                          color: Colors.blue,
                          size: 25,
                        ),
                      )),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
