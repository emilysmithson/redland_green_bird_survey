import 'package:firebase_database/firebase_database.dart';

class User {
  String? name;
  String? nickname;
  String? email;
  bool? permission;
  User({this.name, this.nickname, this.email, this.permission});
  late User currentUser;
  Future<void> addUserToDB() async {
    final DatabaseReference reference = FirebaseDatabase.instance.ref().child(
      "users",
    );
    final String newkey = reference.push().key!;
    reference.child(newkey).set({
      'name': currentUser.name,
      'email': currentUser.email,
      'permission': currentUser.permission,
      'nickname': currentUser.nickname,
    });
  }
}
