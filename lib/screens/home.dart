import 'package:yapp/screens/checkbox2.dart';
import 'package:yapp/screens/maroon.dart';
import 'package:yapp/screens/student.dart';
import 'package:flutter/material.dart';
import 'checkbox1.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 206, 166, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Text(
                'Hello, Welcome!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(10, 110, 189, 1),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/me.jpg'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                          child: Text(
                        'Zakiyah Humaira',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                      SizedBox(height: 32),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Notes:',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookScreen()),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey[300],
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.auto_awesome_mosaic_outlined,
                                    color: Color.fromRGBO(179, 19, 18, 1),
                                    size: 30.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'Book Screen',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoteScreen()),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey[300],
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.auto_awesome_mosaic_outlined,
                                    color: Color.fromRGBO(179, 19, 18, 1),
                                    size: 30.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'Note Screen',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          // Tambahkan elemen lain di sini
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Github:  ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SelectableText(
                                'https://github.com/zakiyahhumaira',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                          Row(
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
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SelectableText(
                                '@zakiyah.h_',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
