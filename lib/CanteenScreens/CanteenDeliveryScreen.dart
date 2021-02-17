import 'package:flutter/material.dart';
import 'package:fryes_canteen/Models/DeliveryItemsModels.dart';
import 'package:fryes_canteen/CanteenItemScreens/DeliveryItemScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class CanteenDeliveryScreen extends StatefulWidget {
  @override
  _CanteenDeliveryScreenState createState() => _CanteenDeliveryScreenState();
}

class _CanteenDeliveryScreenState extends State<CanteenDeliveryScreen> {
  List<DeliveryItemsModel> allitems_old = [];
  int sort_time = 10;
  List<DeliveryItemsModel> allitems = [
    DeliveryItemsModel(
        text: "Cheese Cake",
        number: "x2",
        time: 'rs. 20',
        dinein: '2',
        takeaway: '3'),
    DeliveryItemsModel(
        text: "Choclate MilkShake",
        number: "x2",
        time: 'rs. 20',
        dinein: '3',
        takeaway: '1'),
    DeliveryItemsModel(
        text: "Dosa", number: "x2", time: 'rs. 20', dinein: '6', takeaway: '2'),
  ];

  int di = 0;
  int tk = 0;
  String dine;
  String take;
  int t_a = 0;
  int d_q = 0;
  List<DeliveryItemsModel> allitems2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() => {get_cart()});
  }

  Future get_cart() async {
    FirebaseDatabase db = new FirebaseDatabase();

    await db
        .reference()
        .child("date_cateen_name_college")
        .child("tk_and_di")
        .once()
        .then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, values) async {
        quantity_dn(key).then((dn_val) => {
              quantity_tk(key).then((tk_val) => {
                    setState(() {
                      allitems2.add(DeliveryItemsModel(
                          text: values["name"],
                          number: values["static_quan"],
                          time: '12:00',
                          dinein: dn_val,
                          takeaway: tk_val));
                    })
                  })
            });
      });
    });
  }

  Future quantity_dn(String key) async {
    FirebaseDatabase db = new FirebaseDatabase();

    await db
        .reference()
        .child("date_cateen_name_college")
        .child("dine_in")
        .child(key)
        .once()
        .then((DataSnapshot snapshotsd) {
      if (snapshotsd.value != null) {
        setState(() {
          d_q = snapshotsd.value["quantity"];
          print("dine in from function  " + key + "   " + d_q.toString());
        });
      }
    });
    print("dine in from function  " + key + "   " + d_q.toString());
    return d_q.toString();
  }

  Future quantity_tk(String key) async {
    FirebaseDatabase db = new FirebaseDatabase();

    await db
        .reference()
        .child("date_cateen_name_college")
        .child("take_away")
        .child(key)
        .once()
        .then((DataSnapshot snapshotsd) {
      if (snapshotsd.value != null) {
        setState(() {
          t_a = snapshotsd.value["quantity"];
          print("dine in from function  " + key + "   " + t_a.toString());
        });
      }
    });
    print("dine in from function  " + key + "   " + t_a.toString());
    return t_a.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Delivery",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w700)),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        print("shorted");
                        showAlertDialog(context);
                      },
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Icon(Icons.filter_list,
                              size: 32, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  DefaultTabController(
                    length: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            tabs: [
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Main",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Point A",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Point B",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Point C",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                            labelColor: Colors.black,
                            indicatorColor: Colors.red[300],
                          ),
                        ),
                        Container(
                          //Add this to give height

                          height: MediaQuery.of(context).size.height - 325,
                          child: TabBarView(children: [
                            Container(
                              height: 200,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text("Delivery by",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("12:11PM",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text("D",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("|"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("T",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                      itemCount: allitems2.length,
                                      scrollDirection: Axis.vertical,
                                      padding: EdgeInsets.only(left: 16),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return DeliveryItems(
                                            deliveryitem: allitems2[index]);
                                      }),
                                ],
                              ),
                            ),
                            Container(
                              height: 200,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text("Delivery by",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("12:11PM",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text("D",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("|"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("T",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                      itemCount: allitems.length,
                                      scrollDirection: Axis.vertical,
                                      padding: EdgeInsets.only(left: 16),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return DeliveryItems(
                                            deliveryitem: allitems[index]);
                                      }),
                                ],
                              ),
                            ),
                            Container(
                              height: 200,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text("Delivery by",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("12:11PM",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text("D",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("|"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("T",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                      itemCount: allitems2.length,
                                      scrollDirection: Axis.vertical,
                                      padding: EdgeInsets.only(left: 16),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return DeliveryItems(
                                            deliveryitem: allitems2[index]);
                                      }),
                                ],
                              ),
                            ),
                            Container(
                              height: 200,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text("Delivery by",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("12:11PM",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text("D",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("|"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("T",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                      itemCount: allitems.length,
                                      scrollDirection: Axis.vertical,
                                      padding: EdgeInsets.only(left: 16),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return DeliveryItems(
                                            deliveryitem: allitems[index]);
                                      }),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the list options
    Widget optionOne = SimpleDialogOption(
      child: const Text('10 Min',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400)),
      onPressed: () {
        setState(() {
          sort_time = 10;
        });
        Navigator.of(context).pop();
      },
    );
    Widget optionTwo = SimpleDialogOption(
      child: const Text('20 Min',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400)),
      onPressed: () {
        setState(() {
          sort_time = 20;
        });
        Navigator.of(context).pop();
      },
    );
    Widget optionThree = SimpleDialogOption(
      child: const Text('30 Min',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400)),
      onPressed: () {
        setState(() {
          sort_time = 30;
        });
        Navigator.of(context).pop();
      },
    );
    Widget optionFour = SimpleDialogOption(
      child: const Text('1 Hr',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400)),
      onPressed: () {
        setState(() {
          sort_time = 60;
        });
        Navigator.of(context).pop();
      },
    );

    // set up the SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      children: <Widget>[
        optionOne,
        optionTwo,
        optionThree,
        optionFour,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
