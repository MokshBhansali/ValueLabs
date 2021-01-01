import 'package:flutter/material.dart';
import 'package:valuelabs/screens/userDetails.dart';
import 'package:valuelabs/services/userServices.dart';
import 'package:valuelabs/utils/screenUtils.dart';
import '../global/images.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: UserSearch(mySearchList));
              }),
        ],
      ),
      body: FutureBuilder(
        future: getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var myData = snapshot.data[index];
                return ListTile(
                  onTap: () {
                    getNewScreen(
                        context,
                        UserDetails(
                          details: myData.terms != null
                              ? myData.terms.description[0].toString()
                              : "",
                          image: myData.thumbnail != null
                              ? myData.thumbnail.source
                              : MyImage.UserImage,
                          name: myData.title,
                        ));
                  },
                  title: Text(myData.title),
                  subtitle: Text(
                    myData.terms != null
                        ? myData.terms.description[0].toString()
                        : "",
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      myData.thumbnail != null
                          ? myData.thumbnail.source
                          : MyImage.UserImage,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class UserSearch extends SearchDelegate {
  final userList;
  UserSearch(this.userList);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty
        ? userList
        : userList
            .where((u) => (u.title.toLowerCase().contains(query.toLowerCase()) ||
                u.title.toLowerCase().contains(query.toLowerCase())))
            .toList();
    return myList.isEmpty
        ? Center(child: Text("No result Found"))
        : ListView.builder(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 70),
            shrinkWrap: true,
            itemCount: myList.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var myData = myList[index];
              return ListTile(
                onTap: () {
                  getNewScreen(
                      context,
                      UserDetails(
                        details: myData.terms != null
                            ? myData.terms.description[0].toString()
                            : "",
                        image: myData.thumbnail != null
                            ? myData.thumbnail.source
                            : MyImage.UserImage,
                        name: myData.title,
                      ));
                },
                title: Text(myData.title),
                subtitle: Text(
                  myData.terms != null
                      ? myData.terms.description[0].toString()
                      : "",
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    myData.thumbnail != null
                        ? myData.thumbnail.source
                        : MyImage.UserImage,
                  ),
                ),
              );
            },
          );
  }
}
