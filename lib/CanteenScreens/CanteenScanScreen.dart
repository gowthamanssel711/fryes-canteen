import 'package:flutter/material.dart';
import 'package:fryes_canteen/qr_scan/scan_qr.dart';

class CanteenScanScreen extends StatefulWidget {
  @override
  _CanteenScanScreenState createState() => _CanteenScanScreenState();
}

class _CanteenScanScreenState extends State<CanteenScanScreen> {
  final _newdish = new GlobalKey<FormState>();

  String _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Scan QR code",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Icon(Icons.flash_off,
                              size: 32, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 380,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ScanScreen()),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 190,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Text("scanning issues ? enter order id",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _newdish,
                      child: TextFormField(
                        maxLines: 1,
                        initialValue: _id,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        validator: (value) => value.isEmpty ? ' None ' : null,
                        onSaved: (value) => _id = value.trim(),
                      ),
                    ),
                    Container(
                      height: 47,
                      width: 200,
                      margin: EdgeInsets.all(20),
                      child: RaisedButton(
                        color: Colors.red[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          view_order()
                              .then((value) => {_sdia("name", "quantity")});
                        },
                        child: Text("submit",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Future _sdia(String name, String quantity) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Column(
              //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Idli      "),
                    SizedBox(
                      width: 15,
                    ),
                    Text("x 2")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text("Dosa    "),
                    SizedBox(
                      width: 15,
                    ),
                    Text("x 1")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text("Chapathi"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("x 3")
                  ],
                ),
              ],
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Row(children: <Widget>[
                Row(
                  children: <Widget>[
                    FlatButton(
                        child: Text("OK"),
                        // submitstatus == "disable" ? null : () => getrequest()
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ]);
            }),
          );
        });
  }

  Future view_order() async {}
}
