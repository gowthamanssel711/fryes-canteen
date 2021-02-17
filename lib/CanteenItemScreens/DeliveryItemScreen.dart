import 'package:flutter/material.dart';
import 'package:fryes_canteen/Models/DeliveryItemsModels.dart';

class DeliveryItems extends StatefulWidget {
  DeliveryItemsModel deliveryitem;
  DeliveryItems({@required this.deliveryitem});

  @override
  _DeliveryItemsState createState() => _DeliveryItemsState();
}

class _DeliveryItemsState extends State<DeliveryItems> {
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
                      Text(widget.deliveryitem.text,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(widget.deliveryitem.dinein,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      width: 10,
                    ),
                    Text("|"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(widget.deliveryitem.takeaway,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
