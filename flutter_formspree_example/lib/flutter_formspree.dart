import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormspreeWidget extends StatefulWidget {
  final String formId;
  final String initialEmail;
  final String initialName;
  final String initialSubject;
  final Map metadata;

  FormspreeWidget({
    @required this.formId,
    this.metadata,
    this.initialEmail,
    this.initialName,
    this.initialSubject,
  }) : assert(formId != null);

  @override
  _FormspreeWidgetState createState() => _FormspreeWidgetState();
}

class _FormspreeWidgetState extends State<FormspreeWidget> {
  Future<void> _send() async {
    var url = "https://formspree.io/f/${this.widget.formId}";
    var name = "Tomer";
    var email = "tomer.shalom@gmail.com";
    var subject = "This is a test subject";
    var message = "Hello,\nWhat is up?";

    var response = await http.post(url, headers: {
      "Accept": "application/json",
    }, body: {
      "name": name,
      "email": email,
      "subject": subject,
      "message": message,
    });

    if (response.statusCode == 200) {
      print("OK");
    } else {
      print("Some error occured");
    }
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
