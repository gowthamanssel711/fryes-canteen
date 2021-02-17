import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fryes_canteen/Models/EditMenuItemsModel.dart';

abstract class CanteenModel {
  Future<String> addNewDish(
      String canteenName,
      String name,
      String price,
      String from,
      String to,
      String category,
      String type,
      bool takeaway,
      bool dinein,
      bool addon);

  Future<String> updatedish(
      String canteenName,
      String name,
      String price,
      String from,
      String to,
      String category,
      String type,
      bool takeaway,
      bool dinein,
      bool addon);

  Future getAllItems(String name);
}

class CanteenMain extends CanteenModel {
  @override
  Future<String> addNewDish(
      String canteenName,
      String name,
      String price,
      String from,
      String to,
      String category,
      String type,
      bool takeaway,
      bool dinein,
      bool addon) async {
    await Firebase.initializeApp();
    final firestore = FirebaseFirestore.instance;
    print("backend called");

    await firestore.collection(canteenName).doc(name).set({
      'name': name,
      'category': category,
      'price': price,
      'from': from,
      'to': to,
      'type': type,
      'take_away': takeaway,
      'dine_in': dinein,
      'add_on': addon
    });
    return "added";
  }

  @override
  Future<String> updatedish(
      String canteenName,
      String name,
      String price,
      String from,
      String to,
      String category,
      String type,
      bool takeaway,
      bool dinein,
      bool addon) async {
    await Firebase.initializeApp();
    final firestore = FirebaseFirestore.instance;
    print("backend called");
    print("dine in in " + dinein.toString());

    await firestore.collection(canteenName).doc(name).update({
      'name': name,
      'category': category,
      'price': price,
      'from': from,
      'to': to,
      'type': type,
      'take_away': takeaway,
      'dine_in': dinein,
      'add_on': addon
    });
    return "added";
  }

  @override
  Future getAllItems(String name) async {
    List<EditMenuItems> menuitems = List<EditMenuItems>();

    List menus = [];

    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection("list").get();
    qn.docs.forEach((element) {
      print(element.data()["price"]);
      menuitems.add(
        EditMenuItems(
          text: element.data()["price"],
          price: element.data()["price"],
        ),
      );
      menus.add(element.data());
    });
    print(menuitems.length);
  }
}
