import 'package:flutter/material.dart';

getScrennheight(context, scrnHeight) {
  return MediaQuery.of(context).size.height * scrnHeight;
}

getScreenWidth(context, scrnWidth) {
  return MediaQuery.of(context).size.height * scrnWidth;
}

getTopPadding(context) {
  return MediaQuery.of(context).padding.top;
}

getBottomPadding(context) {
  return MediaQuery.of(context).padding.bottom;
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacementNamed(context, page);
}

void nextScreen(context, page) {
  Navigator.pushNamed(context, page);
}

void backScreen(context) {
  Navigator.pop(context);
}

void getNewScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
