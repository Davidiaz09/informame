import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _bd = FirebaseFirestore.instance;

  FirebaseService(FirebaseFirestore firebaseFirestore);

  Future<void> addUserArticle(Map<String, dynamic> articleData) async {
    try {
      await _bd.collection('article').add(articleData);
    } catch (e) {
      throw Exception('Error adding user article: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getUserArticles() async {
    try {
      QuerySnapshot querySnapshot = await _bd.collection('article').get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      throw Exception('Error getting user articles: $e');
    }
  }
}
