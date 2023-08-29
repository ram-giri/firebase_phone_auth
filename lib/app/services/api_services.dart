import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;
import 'package:user_app/app/models/user_model.dart';
// import '../data/set_user.dart';

// class ApiService {
//   static const String url = "http://user-service.pokee.app/v1/user/";

//   // Get User
//   static Future getUser(String id) async {
//     try {
//       http.Response response = await http.get(Uri.parse(url + id));
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Create User
//   Future createUser(SetUser user) async {
//     try {
//       http.Response response = await http.post(
//         Uri.parse(url),
//         body: SetUser.userToJson(user),
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

class FirebseService {
  final userRef = FirebaseFirestore.instance.collection('users');
  // List<GetUser> users = [];

  static Future<List<AuthUser>> getAllUser() async {
    var userRef = FirebaseFirestore.instance.collection('users');
    final userDoc = await userRef.get();
    return userDoc.docs
        .map((e) => AuthUser.fromQueryDocumentShnapshot(e))
        .toList();
  }

  static Future<AuthUser?> getUser(String id) async {
    var userRef = FirebaseFirestore.instance.collection('users');
    final userDoc = await userRef.doc(id).get();
    if (userDoc.exists == false) {
      return null;
    }
    return AuthUser.fromMap(userDoc.data()!);
  }

  Future<dynamic> addData(Map<String, dynamic> data, String id) async {
    await userRef.doc(id).set(data);
  }

  deleteData(String id) async {
    await userRef.doc(id).delete();
  }
}
