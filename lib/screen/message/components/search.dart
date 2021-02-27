import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screen/message/components/chating.dart';
import 'package:shop_app/services/database.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchControl = TextEditingController();

  Database database = Database();

  QuerySnapshot searchSnapshot;

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.docs.length,
            itemBuilder: (context, index) {
              return SearchTile(
                username: searchSnapshot.docs[index].data()["name"],
                email: searchSnapshot.docs[index].data()["email"],
                press: () {
                  sendUserCreateChatroom(
                    searchSnapshot.docs[index].data()["name"],
                    searchSnapshot.docs[index].data()["email"],
                  );
                },
              );
            })
        : Container();
  }

  initSearch() {
    database.getUserbyname(searchControl.text).then((e) {
      setState(() {
        searchSnapshot = e;
      });
    });
  }

  sendUserCreateChatroom(String username, String useremail) {
    if (useremail != gmail) {
      String chatroomId = getChatroomId(username, myName);
      String useremails = getChatroomId(useremail, gmail);

      List<String> users = [username, myName];
      List<String> uemails = [useremail, gmail];

      Map<String, dynamic> chatroomMap = {
        "users": users,
        "emails": uemails,
        "chatroomId": chatroomId,
        "useremail": useremails,
      };

      database.createChatroom(chatroomId, chatroomMap);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Chatting(
                    cUsername: username,
                    chatroomId: chatroomId,
                  )));
    } else {
      print("you can't chat to yourself");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("find your friends"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: kSecondc.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: searchControl,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Enter your friend name",
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenWidth(9)),
                  ),
                  onChanged: (v) {
                    initSearch();
                  },
                ),
              ),
              searchList(),
            ],
          )),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String username, email;
  final Function press;

  const SearchTile({Key key, this.username, this.email, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: kmedium,
              ),
              Text(
                email,
                style: kmedium,
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
              onTap: press,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Icon(
                  Icons.message,
                  color: Colors.grey[700],
                ),
              )),
        ],
      ),
    );
  }
}

getChatroomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}
