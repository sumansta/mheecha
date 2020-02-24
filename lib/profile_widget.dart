import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          Stack(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
                radius: 64.0,
              ),
              Positioned(
                bottom: -4.0,
                right: -24.0,
                child: FlatButton(
                  color: Colors.green[400],
                  onPressed: () {
                    showDialog(
                      context: context,
                      child: _ProfileFormDialog(),
                    );
                  },
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 18.0,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Anna Alvarado',
            style: TextStyle(fontFamily: 'Acme', fontSize: 20.0),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.green),
            ),
            onPressed: () {},
            child: Text('PRO'),
          )
        ],
      ),
    );
  }
}

Widget _ProfileFormDialog() {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            Container(
              child: RaisedButton(
                child: Text('Submit'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    ),
  );
}
