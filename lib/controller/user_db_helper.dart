import 'package:auth_app_user/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<UserModel> userList = [];

class User {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addUserToDB(String name, String phone) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();

    UserModel user = UserModel(
      id: id,
      name: name,
      phone: phone,
    );
    try {
      print("the function is called");
      await firestore.collection("userss").doc(id).set(user.toMap());
    } on Exception catch (e) {
      print("the error is found $e");
    }
  }

  getUsersFromDB() async {
    try {
      print("function is called");
      final users = await firestore.collection("userss").get();
      userList.clear();
      for (var element in users.docs) {
        userList.add(UserModel.fromMap(element));
      }
      return userList;
    } on Exception catch (e) {
      print("the error is found $e");
    }
  }

  deleteUserFromDB(String id) async {
    try {
      print("function is called");
      await firestore.collection("userss").doc(id).delete();
      getUsersFromDB();
    } catch (e) {
      print('error on $e');
    }
  }
}
