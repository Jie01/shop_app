import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  getUserbyname(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  getUserbyEmail(String useremail) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: useremail)
        .get();
  }

  uploadUserInfo(Map userInfo) {
    FirebaseFirestore.instance
        .collection("users")
        .add(userInfo)
        .catchError((v) {
      print("------------${v.toString()}-------------");
    });
  }

  createChatroom(String chatroomId, Map chatroomMap) {
    FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chatroomId)
        .set(chatroomMap)
        .catchError((e) => print(e.toString()));
  }

  addMessage(String chatroomId, Map messageMap) {
    FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chatroomId)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print("${e} is message error");
    });
  }

  getChatMessage(String chatroomId) async {
    return await FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chatroomId)
        .collection("chats")
        .orderBy("unitime", descending: false)
        .snapshots();
  }

  getChatroom(String useremail) async {
    return await FirebaseFirestore.instance
        .collection("chatroom")
        .where("emails", arrayContains: useremail)
        .snapshots();
  }
}
