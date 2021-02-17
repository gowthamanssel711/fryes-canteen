import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fryes_canteen/Models/OrderedItemScreenModel.dart';
import 'package:firebase_database/firebase_database.dart';

class OrderItemScreen extends StatefulWidget {
  OrderedItems ordereditem;
  OrderItemScreen({@required this.ordereditem});

  @override
  _OrderItemScreenState createState() => _OrderItemScreenState();
}

class _OrderItemScreenState extends State<OrderItemScreen> {
  String _quantity;
  final _newdish = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Firebase.initializeApp().whenComplete(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0, left: 2.0, right: 2.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(6.0),
          ),
          //color: Colors.white,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Center(
                          child:
                              Icon(Icons.lens, size: 15, color: Colors.green),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        child: Text(widget.ordereditem.text,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: InkWell(
                    child: Text("x " + widget.ordereditem.number,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    onTap: () {
                      print(widget.ordereditem.number);
                      _sdia(widget.ordereditem.text, widget.ordereditem.number);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future _sdia(String name, String quantity) async {
    return await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Row(
              //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name.toUpperCase()),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Container(
                      width: 50,
                      child: Form(
                        key: _newdish,
                        child: TextFormField(
                          maxLines: 1,
                          initialValue: _quantity,
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          validator: (value) => value.isEmpty ? ' None ' : null,
                          onSaved: (value) => _quantity = value.trim(),
                        ),
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: <Widget>[
                    Text("/ " + quantity),
                  ],
                )
              ],
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Row(children: <Widget>[
                Row(
                  children: <Widget>[
                    FlatButton(
                        child: Text("Update"),
                        // submitstatus == "disable" ? null : () => getrequest()
                        onPressed: () {
                          _newdish.currentState.save();
                          print(_quantity);
                          _storedb(name, _quantity);
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

  _storedb(String name, String quantity) async {
    print(name + "    " + quantity);
    FirebaseDatabase db = FirebaseDatabase();

    int old_quantity = 0;

    db
        .reference()
        .child("date_canteen_name_college")
        .child("tk_and_di")
        .child(name)
        .once()
        .then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, values) {
        print(values["quantity"]);
        old_quantity = int.parse(values['quantity']);
      });
    });

    db
        .reference()
        .child("date_cateen_name_college")
        .child("tk_and_di")
        .child(name)
        .update({
      "quantity": int.parse(quantity) - old_quantity,
    });
  }
}
