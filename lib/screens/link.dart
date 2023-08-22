import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Direct Link Example'),
        ),
        body: InstagramLinkWidget(),
      ),
    );
  }
}

class InstagramLinkWidget extends StatelessWidget {
  _launchInstagram() async {
    // Gantilah dengan URL profil Instagram yang sesuai
    String instagramUrl = 'https://www.instagram.com/zakiyah.h_';
    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      // Handle jika tautan tidak dapat dibuka
      print('Tidak dapat membuka tautan Instagram');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchInstagram,
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 20.0,
          ),
          SizedBox(width: 8.0),
          Text(
            'Instagram:  ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '@zakiyah.h_',
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}
