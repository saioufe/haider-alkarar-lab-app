import 'package:a_alkarar_lab/models/userPortfolio.dart';
import 'package:flutter/material.dart';

class StaffTemplate extends StatelessWidget {
  final UserPortfolio staffPort;

  StaffTemplate({this.staffPort});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          staffPort.name,
          style: TextStyle(
            fontFamily: 'tajawal',
            color: Theme.of(context).bottomAppBarColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13.0, left: 14),
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 4),
                shape: BoxShape.circle),
            child: ClipOval(
              child: Image.asset(
                staffPort.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
