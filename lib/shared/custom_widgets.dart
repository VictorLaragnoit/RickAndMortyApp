import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback? onTap;

  CustomListTitle(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // Calculate responsive values

    double fontSize = screenWidth * 0.02;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.blueAccent,
        onTap: onTap,
        child: SizedBox(
          height: screenHeight * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    icon,
                    size: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: fontSize),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
