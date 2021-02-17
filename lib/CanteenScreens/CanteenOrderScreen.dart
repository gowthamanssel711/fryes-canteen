import 'package:flutter/material.dart';
import 'package:fryes_canteen/Models/OrderedItemScreenModel.dart';
import 'package:fryes_canteen/CanteenItemScreens/OrderedItemsScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

class CanteenOrderScreen extends StatefulWidget {
  @override
  _CanteenOrderScreenState createState() => _CanteenOrderScreenState();
}

class _CanteenOrderScreenState extends State<CanteenOrderScreen> {
  List<OrderedItems> allitems = [];
  List<OrderedItems> temp_allitems = [];
  int sort_time = 10;

  String _selectedItem = 'Sun';
  List _options = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  List<OrderedItems> finalitems = [
    OrderedItems(text: "Cheese Cake", number: "x2", time: 'rs. 20'),
    OrderedItems(text: "Choclate Milk Shake", number: "x3", time: 'rs. 20'),
    OrderedItems(text: "Dosa", number: "x5", time: 'rs. 20'),
  ];

  List<OrderedItems> nextitem = [
    OrderedItems(text: "Cheese Cake", number: "x2", time: 'rs. 20'),
    OrderedItems(text: "Choclate Milk Shake", number: "x3", time: 'rs. 20'),
    OrderedItems(text: "Dosa", number: "x5", time: 'rs. 20'),
    OrderedItems(text: "Idli", number: "x1", time: 'rs. 20'),
    OrderedItems(text: "Idli", number: "x3", time: 'rs. 20'),
  ];

  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp()
        .whenComplete(() => {get_cart().then((value) => {})});
  }

  Future get_cart() async {
    FirebaseDatabase db = new FirebaseDatabase();
    QuerySnapshot qn = await db
        .reference()
        .child("date_cateen_name_college")
        .child("tk_and_di")
        .once()
        .then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, values) {
        setState(() {
          allitems.add(OrderedItems(
              text: values["name"],
              time: values["time"],
              number: values["quantity"].toString()));
        });
        setState(() {
          temp_allitems = allitems;
        });
      });
    });
  }

  Future filter_by_time(int filter_time) {
    var duration = new Duration(hours: 0, minutes: filter_time);
    List<DateTime> ti = [];
    List<DateTime> ti_range = [];
    DateFormat dateFormat = DateFormat("HH:mm");
    DateTime user_time = dateFormat.parse("14:40");
    print("filter function  " + filter_time.toString());
    temp_allitems.forEach((element) {
      ti.add(dateFormat.parse(element.time));
    });
    ti.sort();
    print(ti);

    if (ti[0].isBefore(ti[ti.length - 1])) {
      print(ti[0].add(duration));
      print("while loop " + ti[0].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Orders",
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
            Row(
              children: <Widget>[
                Text("Delivery by",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  width: 5,
                ),
                Text("11:00AM",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: allitems.length,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  print(allitems);
                  return OrderItemScreen(ordereditem: allitems[index]);
                },
              ),
            ),
            SizedBox(
              height: 15,
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
        filter_by_time(sort_time);
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
        filter_by_time(sort_time);
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
        filter_by_time(sort_time);
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
        filter_by_time(sort_time);
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
