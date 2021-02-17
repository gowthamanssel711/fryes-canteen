import 'package:flutter/material.dart';
import 'package:fryes_canteen/CanteenScreens/CanteenMainScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 380,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Icon(Icons.lens, size: 15, color: Colors.green),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "hello user ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 47,
                width: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  // maxLines: 1,
                  //     keyboardType: TextInputType.emailAddress,
                  //    autofocus: false,
                  //    validator: (value) => value.isEmpty ? 'Enter Dish ' : null,
                  //    onSaved: (value) => _name = value.trim(),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'user id',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 47,
                width: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'password',
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
              //  Text("you can change it later inside the app",
              //        style: TextStyle(fontSize: 10)),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 47,
                width: 250,
                margin: EdgeInsets.all(20),
                child: RaisedButton(
                  color: Colors.red[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CanteenMainScreen()));
                  },
                  child: Text("get started",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
