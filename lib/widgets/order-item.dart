import 'package:a_alkarar_lab/lab_icons_icons.dart';
import 'package:a_alkarar_lab/models/result.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Result result;

  OrderItem({@required this.result});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    result.date,
                    style: TextStyle(
                        fontFamily: 'tajawal',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 11),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        result.name,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontFamily: 'tajawal',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).bottomAppBarColor,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Theme.of(context).primaryColor,
                          Color(0xff37c5d2)
                        ])),
                    child: Icon(
                      LabIcons.molecule,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
