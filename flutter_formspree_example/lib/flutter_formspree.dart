import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormspreeWidget extends StatefulWidget {
  @override
  _FormspreeWidgetState createState() => _FormspreeWidgetState();
}

class _FormspreeWidgetState extends State<FormspreeWidget> {
  Future<void> _send() async {
    var url = "https://formspree.io/f/123456";
    var name = "Tomer";
    var email = "tomer.shalom@gmail.com";
    var subject = "This is a test subject";
    var message = "Hello,\nWhat is up?";

    var response = await http.post(url, body: {
      "name": name,
      "email": email,
      "subject": subject,
      "message": message,
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: _send,
              child: Text("Send"),
            )
          ],
        ),
      ),
    );
  }
}
