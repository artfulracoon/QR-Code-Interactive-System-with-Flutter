import 'package:cloud_firestore/cloud_firestore.dart';

class CafeRepo {
  CafeRepo._();
  static final _instance = CafeRepo._();
  factory CafeRepo() => _instance;

  FirebaseFirestore db = FirebaseFirestore.instance;

  DocumentSnapshot? cafeData;
  DocumentSnapshot? cafeSadakatData;

  Map menuData = {};
  List categories = [];

  Future<void> getData(String? cafeLink) async {
    await db
        .collection('cafes')
        .where('cafe_link', isEqualTo: cafeLink)
        .get()
        .then((value) => cafeData = (value.docs).first);

    final DocumentReference menuRef = cafeData!["cafe_menu"];

    for (final e in cafeData!["categories"]) {
      categories.add(e);
      menuData[e] = (await menuRef.collection(e).get()).docs;
    }
    //print(cafeData!.data());
    //print(menuData["ET"][0].data());
    //print(categories);
  }

  Future<void> getUserData(String? userID) async {
    await db
        .collectionGroup('sadakat')
        .get()
        .then((value) => cafeSadakatData = (value.docs).first);

    //print(cafeSadakatData!["how_many"]);
    //print(cafeSadakatData!["max"]);
  }
}
