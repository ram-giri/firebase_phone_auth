import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthUser {
  final String id;
  final String fullName;
  final String userName;
  final String phoneNumber;
  AuthUser({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.phoneNumber,
  });
  static AuthUser userFromJson(String str) => AuthUser.fromMap(json.decode(str));

  static String userToJson(AuthUser data) => json.encode(data.toMap());

  factory AuthUser.fromQueryDocumentShnapshot(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final id = snapshot.id;
    data['id'] = id;
    return AuthUser.fromMap(data);
  }



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'userName': userName,
      'phoneNumber': phoneNumber,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      userName: map['userName'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}
