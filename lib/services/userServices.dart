import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/userModel.dart';
  var mySearchList = List<Pages>();

getUser() async {
  String url =
      "https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=Sachin+T&gpslimit=10";
  var response = await http.get(url);
  var result = json.decode(response.body);
  var myPostList = List<Pages>();
  for (var item in result["query"]["pages"]) {
    var user = Pages.fromJson(item);
    myPostList.add(user);
    mySearchList.add(user);
  }
  return myPostList;
}
