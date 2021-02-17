import 'package:flutter/material.dart';

class CanteenAccountScreen extends StatefulWidget {
  @override
  _CanteenAccountScreenState createState() => _CanteenAccountScreenState();
}

class _CanteenAccountScreenState extends State<CanteenAccountScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("account",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                  Row(
                    children: <Widget>[
                      Icon(Icons.wb_sunny),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Colors.red[300],
                        activeColor: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text("Canteen Name",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.edit),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 100,
                                width: 125,
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
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Column(
                                    children: <Widget>[
                                      Text("no of orders",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600)),
                                      Text("25",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 125,
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
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: <Widget>[
                                  Center(
                                      child: Text("revenue",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600))),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Row(
                                      children: <Widget>[
                                        Text("rs."),
                                        Text("1500",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.business),
                              SizedBox(
                                width: 20,
                              ),
                              Text("view detailed analysis",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: <Widget>[Icon(Icons.arrow_forward_ios)],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Support",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700))),
              SizedBox(height: 15),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.call),
                              SizedBox(
                                width: 20,
                              ),
                              Text("helpline",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: <Widget>[Icon(Icons.arrow_forward_ios)],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.mail_outline),
                              SizedBox(
                                width: 20,
                              ),
                              Text("feedback",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: <Widget>[Icon(Icons.arrow_forward_ios)],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.info),
                              SizedBox(
                                width: 20,
                              ),
                              Text("how to use",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: <Widget>[Icon(Icons.arrow_forward_ios)],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.library_books),
                              SizedBox(
                                width: 20,
                              ),
                              Text("policies",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: <Widget>[Icon(Icons.arrow_forward_ios)],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: BorderSide(color: Colors.red[300]),
                    ),
                    onPressed: () {},
                    child: Text("Logout",
                        style: TextStyle(
                            color: Colors.red[300],
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
