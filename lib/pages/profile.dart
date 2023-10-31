import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final name;

  Profile([@required this.name]);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            print('Back to previous page');
          },
        ),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/OIP.qBfu7l6bsokStHSwq8BSkwAAAA?pid=ImgDet&rs=1'
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 25,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
