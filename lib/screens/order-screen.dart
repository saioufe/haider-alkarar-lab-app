import 'package:flutter/material.dart';
import '../widgets/order-item.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  double _progressSlideSheet = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'الطلبات',
                  style: GoogleFonts.tajawal().copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).bottomAppBarColor,
                      fontSize: 28),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 30, right: 30),
            child: Column(
              children: <Widget>[
                AnimatedContainer(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            offset: Offset(0, 2))
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Color(0xff37c5d2),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  duration: Duration(milliseconds: 500),
                  height: _progressSlideSheet == 0
                      ? 180
                      : 180 - _progressSlideSheet * 65,
                  curve: Curves.elasticOut,
                ),
                SizedBox(
                  height: 20,
                ),
                _progressSlideSheet < 1
                    ? AnimatedOpacity(
                        opacity: 1 - _progressSlideSheet,
                        duration: Duration(milliseconds: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Feather.chevron_up,
                              color: Colors.grey,
                              size: 12,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('اسحب الى الاعلى لعرض المزيد....',
                                style: GoogleFonts.tajawal().copyWith(
                                    color: Colors.grey[400], fontSize: 12)),
                          ],
                        ),
                      )
                    : AnimatedOpacity(
                        opacity: _progressSlideSheet,
                        duration: Duration(milliseconds: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Feather.chevron_down,
                              color: Colors.grey,
                              size: 12,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('اسحب الى الاعلى لعرض المزيد',
                                style: GoogleFonts.tajawal().copyWith(
                                    color: Colors.grey[400], fontSize: 12)),
                          ],
                        ),
                      ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            right: 50,
            child: AnimatedPadding(
              padding: EdgeInsets.only(top: 130 + _progressSlideSheet * 21),
              duration: Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              child: Image.network(
                'https://www.zzlocal.com/images/visa-logo-black-and-white.png',
                height: 80,
                width: 80,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            left: 50,
            child: AnimatedOpacity(
              opacity: 1 - _progressSlideSheet,
              duration: Duration(milliseconds: 50),
              child: AnimatedPadding(
                padding: EdgeInsets.only(top: 150),
                duration: Duration(milliseconds: 500),
                curve: Curves.elasticOut,
                child: Image.network(
                  'https://img.icons8.com/cotton/2x/sim-card-chip.png',
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            left: 50,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 50),
              opacity: 1 - _progressSlideSheet,
              child: AnimatedPadding(
                padding: EdgeInsets.only(top: 220),
                duration: Duration(milliseconds: 500),
                curve: Curves.elasticOut,
                child: Text(
                  '1535    1518    1996    1885',
                  style: GoogleFonts.lato().copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            left: 50,
            child: AnimatedPadding(
              padding: EdgeInsets.only(top: 255 - _progressSlideSheet * 80),
              duration: Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              child: Text(
                'R\$ 245,00',
                style: GoogleFonts.lato().copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28),
              ),
            ),
          ),
          SlidingSheet(
            listener: (state) {
              setState(() {
                _progressSlideSheet = state.progress;
              });
            },
            elevation: 5,
            cornerRadius: 20,
            shadowColor: Colors.grey[300],
            maxWidth: MediaQuery.of(context).size.width / 1.2,
            closeOnBackdropTap: true,
            snapSpec: const SnapSpec(
              snappings: [
                0.40,
                0.72,
              ],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                color: Color(0xfff7f7f7),
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          height: 5,
                          width: 60,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            OrderItem(
                              icone: Icon(
                                Feather.shopping_bag,
                                color: Colors.white,
                              ),
                              texto: 'سيف ماهر محمد',
                              preco: 'R\$240,00',
                            ),
                            OrderItem(
                              icone: Icon(
                                Feather.headphones,
                                color: Colors.white,
                              ),
                              texto: 'علي عباس السبع',
                              preco: 'R\$100,00',
                            ),
                            OrderItem(
                              icone: Icon(
                                Feather.alert_triangle,
                                color: Colors.white,
                              ),
                              texto: 'Manutenção',
                              preco: 'R\$500,00',
                            ),
                            OrderItem(
                              icone: Icon(
                                Feather.pie_chart,
                                color: Colors.white,
                              ),
                              texto: 'Alimentação',
                              preco: 'R\$300,00',
                            ),
                            OrderItem(
                              icone: Icon(
                                Feather.shopping_bag,
                                color: Colors.white,
                              ),
                              texto: 'Compras',
                              preco: 'R\$240,00',
                            ),
                            OrderItem(
                              icone: Icon(
                                Feather.headphones,
                                color: Colors.white,
                              ),
                              texto: 'Entretenimento',
                              preco: 'R\$100,00',
                            ),
                            OrderItem(
                              icone: Icon(
                                Feather.alert_triangle,
                                color: Colors.white,
                              ),
                              texto: 'Manutenção',
                              preco: 'R\$500,00',
                            ),
                            OrderItem(
                              icone: Icon(
                                Feather.pie_chart,
                                color: Colors.white,
                              ),
                              texto: 'Alimentação',
                              preco: 'R\$300,00',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
