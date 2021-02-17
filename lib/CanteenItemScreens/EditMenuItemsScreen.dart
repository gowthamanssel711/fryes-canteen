import 'package:flutter/material.dart';
import 'package:fryes_canteen/Models/EditMenuItemsModel.dart';
import 'package:fryes_canteen/BackendmodelDBModel/backend_classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditMenuItemsScreen extends StatefulWidget {
  CanteenMain canteendb = new CanteenMain();
  EditMenuItems editmenu;
  EditMenuItemsScreen({@required this.editmenu});

  @override
  _EditMenuItemsScreenState createState() => _EditMenuItemsScreenState();
}

class _EditMenuItemsScreenState extends State<EditMenuItemsScreen> {
  final _newdish = new GlobalKey<FormState>();
  bool _istakeaway = false;
  bool _isdinein = false;
  String _type = "";
  bool _isaddon = false;
  String _currText = '';
  int _groupValue = -1;
  String _categoryselection = 'veg';
  int id = 1;

  String _price;
  String _from;
  String _to;
  String _category;

  List<String> accept_tk = ["accept takeaway"];
  List<String> add_on = ["add-on"];
  List<String> accept_dinein = ["accept dinein"];
  String _name = "";
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 2.0, right: 2.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Container(
              //color: Colors.white,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Center(
                              child: Icon(Icons.lens,
                                  size: 15, color: Colors.green),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                widget.editmenu.text,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                widget.editmenu.price,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                            child: Icon(Icons.edit),
                            onTap: () {
                              print("pressed");
                              get_dishdetails("psgtech", widget.editmenu.text)
                                  .then((value) {
                                _sdia();
                              });

                              //            widget.canteendb
                              //               .getAllItems(widget.editmenu.text);
                            }),
                        SizedBox(
                          width: 20,
                        ),
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
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                thickness: 1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future get_dishdetails(String canteen_name, String dish_name) async {
    print(canteen_name);
    print(dish_name);

    DocumentSnapshot qn = await FirebaseFirestore.instance
        .collection(canteen_name)
        .doc(dish_name)
        .get();
    setState(() {
      _name = qn.get("name");
      _price = qn.get("price");
      _from = qn.get("from");
      _to = qn.get("to");
      _category = qn.get("category");
      if (qn.get("add_on")) {
        _isaddon = true;
      }
      if (qn.get("take_away")) {
        _istakeaway = true;
      }
      if (qn.get("dine_in")) {
        _isdinein = true;
      }
      if (qn.get("type") == "veg") {
        id = 1;
      }

      if (qn.get("type") == "egg") {
        id = 2;
      }
      if (qn.get("type") == "non_veg") {
        id = 3;
      }
    });

    print(qn.get("name"));
    print(qn);
    return "fetched";
  }

  Future _sdia() async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Row(
              children: <Widget>[
                Text("Edit"),
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

  Widget newdishadd() {
    return Form(
      key: _newdish,
      child: Column(
        children: <Widget>[
          _inputname(),
          _inputprice(),
          _inputfrom(),
          _inputto(),
          _inputcategory(),
        ],
      ),
    );
  }

  Widget _inputname() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("name"),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: TextFormField(
            maxLines: 1,
            initialValue: _name,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            validator: (value) => value.isEmpty ? 'Enter Dish ' : null,
            onSaved: (value) => _name = value.trim(),
          ),
        ),
      ],
    );
  }

  Widget _inputprice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("price"),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: TextFormField(
            initialValue: _price,
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            validator: (value) => value.isEmpty ? 'Enter Dish ' : null,
            onSaved: (value) => _price = value.trim(),
          ),
        ),
      ],
    );
  }

  Widget _inputfrom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("from"),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: TextFormField(
            initialValue: _from,
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            validator: (value) => value.isEmpty ? 'Enter Dish ' : null,
            onSaved: (value) => _from = value.trim(),
          ),
        ),
      ],
    );
  }

  Widget _inputto() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("to"),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: TextFormField(
            initialValue: _to,
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            validator: (value) => value.isEmpty ? 'Enter Dish ' : null,
            onSaved: (value) => _to = value.trim(),
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
          child: TextFormField(
            initialValue: _category,
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            validator: (value) => value.isEmpty ? 'Enter Dish ' : null,
            onSaved: (value) => _category = value.trim(),
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
    print(_isaddon);
    await widget.canteendb
        .updatedish("psgtech", _name, _price, _from, _to, _category,
            _categoryselection, _istakeaway, _isdinein, _isaddon)
        .then((value) {
      setState(() {});
    });
  }
}
