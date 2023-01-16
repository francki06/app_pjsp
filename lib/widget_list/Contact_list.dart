import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact_list extends StatelessWidget {
  final String id;
  final String nom;
  final telephone;
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
  const Contact_list({
    Key key,
    this.id,
    this.nom,
    this.telephone,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:10, right: 10, top: 8),
          child: Row(
            children: <Widget>[
              Container(
              width: 34.0,
              height: 34.0,
              padding: EdgeInsets.only(top:1),
              
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                  Icons.account_balance,
                  size: 25,
                  color:Colors.black45,
                ),
              ),
              GestureDetector(
                onTap: () {
                    _makePhoneCall('tel:$telephone');
                },
                child:Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width / 1.7,
                margin: EdgeInsets.only(left:10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      nom,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff20494f),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      telephone,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: const Color(0xff20494f),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
          ),   
              GestureDetector(
                onTap: () {
                    _makePhoneCall('tel:$telephone');
                },
                              child: Container(
                                alignment: Alignment.centerRight,
                width: 34.0,
                height: 34.0,
                padding: EdgeInsets.only(top:6),
                child: Icon(
                    Icons.phone,
                    size: 17,
                    color:Color(0xff1a92a3),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
