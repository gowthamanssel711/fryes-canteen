import 'package:flutter/material.dart';
import 'package:fryes_canteen/Models/EditMenuItemsModel.dart';
import 'package:fryes_canteen/CanteenItemScreens/EditMenuItemsScreen.dart';
import 'package:fryes_canteen/BackendmodelDBModel/backend_classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class CanteenEditMenuScreen extends StatefulWidget {
  CanteenMain canteendb = new CanteenMain();

  @override
  _CanteenEditMenuScreenState createState() => _CanteenEditMenuScreenState();
}

class _CanteenEditMenuScreenState extends State<CanteenEditMenuScreen> {
  DateTime _dateTime = DateTime.now();

  List<EditMenuItems> menuitem = List<EditMenuItems>();
  TextEditingController _timeController = TextEditingController();
  List<EditMenuItems> menuitems = [
    EditMenuItems(text: "Cheese Cake", price: 'rs. 20'),
    EditMenuItems(text: "Cheese Cake", price: 'rs. 20'),
    EditMenuItems(text: "Cheese Cake", price: 'rs. 20'),
    EditMenuItems(text: "Cheese Cake", price: 'rs. 20'),
  ];

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      final firestore = FirebaseFirestore.instance;
      getAllItems().then((value) {});
    });
  }

  Future getAllItems() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection("psgtech").get();
    qn.docs.forEach((element) {
      print(element.data()["price"]);
      setState(() {
        menuitem.add(
          EditMenuItems(
            text: element.data()["name"],
            price: element.data()["price"],
          ),
        );
      });
    });
    print(menuitem.length);
  }

  String _name;
  String _price;
  String _from;
  String _to;
  String _category;

  TimeOfDay time;

  final _newdish = new GlobalKey<FormState>();

  bool _istakeaway = false;
  bool _isdinein = false;

  String _type = "";
  bool _isaddon = false;
  String _currText = '';
  int _groupValue = -1;
  String _categoryselection = 'veg';
  int id = 1;

  List<String> accept_tk = ["accept takeaway"];
  List<String> add_on = ["add-on"];
  List<String> accept_dinein = ["accept dinein"];

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Edit Menu",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w700)),
                Row(
                  children: <Widget>[
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
            Container(
              child: Column(
                children: <Widget>[
                  DefaultTabController(
                    length: 3,
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
                                    "Items",
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
                                    "Categories",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.search),
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
                              child: ListView.builder(
                                  itemCount: menuitem.length,
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.only(left: 16),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return EditMenuItemsScreen(
                                        editmenu: menuitem[index]);
                                  }),
                            ),
                            Container(
                              height: 200,
                              child: ListView.builder(
                                itemCount: menuitem.length,
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.only(left: 16),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return EditMenuItemsScreen(
                                      editmenu: menuitem[index]);
                                },
                              ),
                            ),
                            Container(
                              height: 200,
                              child: ListView.builder(
                                  itemCount: menuitem.length,
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.only(left: 16),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return EditMenuItemsScreen(
                                        editmenu: menuitem[index]);
                                  }),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sdia();

          // _pickTime();
        },
        backgroundColor: Colors.red[300],
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Null> _selectTime(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        print(picked);
      });
  }

  _pickTime() async {
    print("time picker calleds");
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
      });
  }

  Future _sdia() async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[100],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Row(
              children: <Widget>[
                Text("Add New Dish "),
              ],
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: newdishadd(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          _categoryselection = 'veg';
                          id = 1;
                        });
                      },
                    ),
                    Text(
                      'veg',
                      style: new TextStyle(fontSize: 17.0),
                    ),
                    Radio(
                      value: 2,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          _categoryselection = 'egg';
                          id = 2;
                        });
                      },
                    ),
                    Text(
                      'egg',
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    Radio(
                      value: 3,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          _categoryselection = 'non_veg';
                          id = 3;
                        });
                      },
                    ),
                    Text(
                      'non-veg',
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        children: accept_tk
                            .map((t) => CheckboxListTile(
                                  title: Text(t),
                                  value: _istakeaway,
                                  onChanged: (val) {
                                    setState(() {
                                      _istakeaway = val;
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        children: accept_dinein
                            .map((t) => CheckboxListTile(
                                  title: Text(t),
                                  value: _isdinein,
                                  onChanged: (val) {
                                    setState(() {
                                      _isdinein = val;
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        children: add_on
                            .map((t) => CheckboxListTile(
                                  title: Text(t),
                                  value: _isaddon,
                                  onChanged: (val) {
                                    setState(() {
                                      _isaddon = val;
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                        child: Text("Add"),
                        // submitstatus == "disable" ? null : () => getrequest()
                        onPressed: () {
                          // widget.canteendb.demo("ab");
                          _newdish.currentState.save();
                          _storedb();
                          //String not_vull = widget.canteendb.demo("ab");
                          Navigator.pop(context);
                        }),
                    FlatButton(
                        child: Text("Cancel"),
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

  Widget hourMinute12H() {
    return new TimePickerSpinner(
      spacing: 20,
      is24HourMode: false,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget newdishadd() {
    return Form(
      key: _newdish,
      child: Column(
        children: <Widget>[
          _inputname(),
          SizedBox(
            height: 10,
          ),
          _inputprice(),
          SizedBox(
            height: 10,
          ),
          _inputfrom(),
          SizedBox(
            height: 10,
          ),
          _inputto(),
          SizedBox(
            height: 10,
          ),
          _inputcategory(),
        ],
      ),
    );
  }

  Widget _inputname() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("name    : "),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Container(
            height: 47,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.text,
              autofocus: false,
              validator: (value) => value.isEmpty ? 'Enter price ' : null,
              onSaved: (value) => _name = value.trim(),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 17),
                //       hintText: 'user id',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputprice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("price     : "),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Container(
            height: 47,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              autofocus: false,
              validator: (value) => value.isEmpty ? 'Enter Dish ' : null,
              onSaved: (value) => _price = value.trim(),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 17),
                //       hintText: 'user id',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputfrom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("from    :  "),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Container(
            height: 47,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                controller: _timeController,
                autofocus: false,
                validator: (value) => value.isEmpty ? 'Enter Dish ' : null,
                onSaved: (value) => _from = value.trim(),
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 17),
                  //       hintText: 'user id',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputto() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("to        :  "),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Container(
            height: 47,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              validator: (value) => value.isEmpty ? 'Enter Dish ' : null,
              onSaved: (value) => _to = value.trim(),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 17),
                //       hintText: 'user id',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputcategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("category"),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Container(
            height: 47,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              validator: (value) => value.isEmpty ? 'Enter Dish ' : null,
              onSaved: (value) => _category = value.trim(),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 17),
                //       hintText: 'user id',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _storedb() async {
    print(_name);
    print(_price);
    print(_from);
    print(_to);
    print(_category);
    print(_categoryselection);
    print(_istakeaway);
    print(_isdinein);
    print(_isaddon);
    await widget.canteendb
        .addNewDish("psgtech", _name, _price, _from, _to, _category,
            _categoryselection, _istakeaway, _isdinein, _isaddon)
        .then((value) {
      setState(() {
        menuitem.add(
          EditMenuItems(
            text: _name,
            price: _price,
          ),
        );
      });
    });
  }
}
