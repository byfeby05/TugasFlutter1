import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pertama/customs/cutom_buttom.dart';
import 'package:pertama/pages/profile.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final globalKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: Container(
        padding: EdgeInsets.only(
          top: 64,
          bottom: 64,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Center(
                child: Text(
                  'EDIT PROFILE',
                  style: TextStyle(fontSize: 40, color: Colors.blueAccent),
                ),
              ),
            ),
            Container(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),
            Container(
              child: CustomButton(
              text: 'Update',
              onPressed: () {
                if (nameController.text == '') {
                    //showToast('Please input your name');
                    //showSnackBar('Please input your name');
                    //showAlertDialogMaterial('Please input your name');
                    showAlertDialogCurpertino('Please input your name');
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(
                          nameController.text,
                        ),
                      ),
                    );
                  }
              },
            ),
            ),
          ],
        ),
      ),
    );
  }

  showToast(text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showSnackBar(text) {
    final snackbar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          print('Clicked Undo');
        },
      ),
    );
    globalKey.currentState.showSnackBar(snackbar);
  }

  showAlertDialogMaterial(text) {
    showDialog(
      context: globalKey.currentContext,
      builder: (_) => AlertDialog(
        title: Text('Info'),
        content: Text(text),
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(globalKey.currentContext);
              print('Clicked No!');
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              print('Clicked Yes!');
            },
          ),
        ],
        elevation: 5,
        backgroundColor: Colors.white,
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: false,
    );
  }

  showAlertDialogCurpertino(text) {
    showDialog(
      context: globalKey.currentContext,
      builder: (_) => AlertDialog(
        title: Text('Info'),
        content: Text(text),
        actions: [
          CupertinoDialogAction(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(globalKey.currentContext);
              print('Clicked No!');
            },
          ),
          CupertinoDialogAction(
            child: Text('Yes'),
            onPressed: () {
              print('Clicked Yes!');
            },
          ),
        ],
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: false,
    );
  }
}
