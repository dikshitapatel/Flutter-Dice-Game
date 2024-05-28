import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_io/io.dart' show Platform;
import 'package:flutter/cupertino.dart';

class AuthorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 139, 199, 237).withOpacity(0.9), // Light blue background
      appBar: AppBar(
        title: Text("About the Author"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/profile.jpg'), 
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 20),
            Text(
              "Dikshita Patel",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "I'm a Computer Science graduate student from Syracuse University, New York. Before joining SU, I gained 2 years of professional experience at JP Morgan Chase & Co., where I started as a Software Engineer Program Intern and then as a Software Engineer Analyst. I was responsible for solving complex problems and engaging in software development. You can find more about me on LinkedIn and GitHub.",
                style: TextStyle(fontSize: 16, color: Colors.pink),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              child: Text('LinkedIn & GitHub'),
              onPressed: () => _showSocialLinks(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showSocialLinks(BuildContext context) {
  if (Platform.isIOS) {
    // CupertinoAlertDialog for iOS
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text("My Profiles"),
        content: Text("LinkedIn: linkedin.com/in/dikshita-patel/\nGitHub: github.com/dikshitapatel/"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            child: Text("Open LinkedIn"),
            onPressed: () => launchUrl(Uri.parse("https://linkedin.com/in/dikshita-patel/")),
          ),
          CupertinoDialogAction(
            child: Text("Open GitHub"),
            onPressed: () => launchUrl(Uri.parse("https://github.com/dikshitapatel/")),
          ),
        ],
      ),
    );
  } else {
    // AlertDialog for Android and other platforms
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("My Profiles"),
        content: Text("LinkedIn: linkedin.com/in/dikshita-patel/\nGitHub: github.com/dikshitapatel/"),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text("Open LinkedIn"),
            onPressed: () => launchUrl(Uri.parse("https://linkedin.com/in/dikshita-patel/")),
          ),
          TextButton(
            child: Text("Open GitHub"),
            onPressed: () => launchUrl(Uri.parse("https://github.com/dikshitapatel/")),
          ),
        ],
      ),
    );
  }
}
}
