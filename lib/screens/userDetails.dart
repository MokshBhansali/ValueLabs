import 'package:flutter/material.dart';
import 'package:valuelabs/utils/screenUtils.dart';

class UserDetails extends StatefulWidget {
  final name;
  final details;
  final image;
  UserDetails({this.name, this.details, this.image});
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.name),
      ),
      body: Container(
        height: getScrennheight(context, 1.0),
        width: getScreenWidth(context, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              this.widget.image,
              height: getScrennheight(context, .3),
              fit: BoxFit.fill,
            ),
            Text(
              this.widget.name ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              this.widget.details ?? "",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
