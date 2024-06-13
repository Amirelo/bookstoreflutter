import 'package:bookstore/src/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var db = FirebaseFirestore.instance;

Future<List<CategoryModel>> getCategories() async {
  return await db.collection("categories").get().then((querySnapshot) {
    List<CategoryModel> newList = [];
    debugPrint("----Data found ... geting data ...");
    for (var doc in querySnapshot.docs) {
      var curData = doc.data();
      debugPrint("-----${doc.id} => ${doc.data()}");
      CategoryModel category =
          CategoryModel(doc.id, curData["name"], curData["image"]);
      newList.add(category);
    }
    return newList;
  }).onError((error, stackTrace) {
    debugPrint("-----Error: $error");
    return List.empty();
  });
}
