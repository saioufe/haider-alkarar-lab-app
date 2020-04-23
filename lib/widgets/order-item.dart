import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderItem extends StatelessWidget {
  final Icon icone;
  final String texto;
  final String preco;

  const OrderItem({Key key, this.icone, this.texto, this.preco})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '19/4/2020',
              style: GoogleFonts.kodchasan().copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 11),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  texto,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.kodchasan().copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).bottomAppBarColor,
                      fontSize: 16),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    'هنا يتم كتابة نبذة عن الحالة المرضية',
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.kodchasan().copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 16),
                  ),
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
              child: icone,
            ),
          ],
        ),
      ),
    );
  }
}
