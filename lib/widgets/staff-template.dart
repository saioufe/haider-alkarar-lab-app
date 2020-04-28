import 'package:a_alkarar_lab/models/staff.dart';
import 'package:a_alkarar_lab/providers/allProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StaffTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allPosts = Provider.of<AllProvider>(context, listen: false);
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 3.55,
      child: Column(
          children: allPosts.staff.map((item) {
        return Template(
          staff: StaffModel(
            id: item.id,
            name: item.name,
            image: item.image,
          ),
        );
      }).toList()),
    );
  }
}

class Template extends StatelessWidget {
  final StaffModel staff;
  const Template({
    Key key,
    @required this.staff,
  }) : super(key: key);

  Widget build(BuildContext context) {
    print(staff.name);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width/2.2,
          child: Text(
            staff.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'tajawal',
              color: Theme.of(context).bottomAppBarColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              
            ),
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
              child: FadeInImage(
                placeholder: AssetImage('assets/images/men.png'),
                //height: MediaQuery.of(context).size.height * 0.35,
                image: NetworkImage(
                    "http://pandoradevs.com/images/staff/${staff.image}"),
                fit: BoxFit.cover,
                width: 70,
                height: 70,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
