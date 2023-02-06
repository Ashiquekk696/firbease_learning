import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final CollectionReference dataReference =
      FirebaseFirestore.instance.collection('brews');
}
