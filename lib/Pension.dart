import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pjsp/widget_list/Pension_list.dart';

import 'package:pjsp/sqlite/db_helper.dart';
import 'modele/Pension_model.dart';

class Pension extends StatefulWidget {
  @override
  _PensionState createState() => _PensionState();
}
class _PensionState extends State<Pension> {
  List<Pension_model> _pension =  [
        new Pension_model(id:1,nom:"Dernier arrerage"),
        new Pension_model(id:2,nom:"Secours aux deces"),
        new Pension_model(id:3,nom:"Pension alimentaire"),
        new Pension_model(id:4,nom:"Transfert et remboursement des cotisations"),
        new Pension_model(id:5,nom:"Concession pension agent"),
        new Pension_model(id:6,nom:"Concession pension veuvage"),
        new Pension_model(id:7,nom:"Concession pension d'orpheleinat"),

      ];
  List<Pension_model> _pensionDisplay = List<Pension_model>();
  
  _searchbar() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black54.withOpacity(0.4),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
              hintText: "Rechercher",
            ),
            onChanged: (text) {
              text = text.toLowerCase();
              setState(() {
                _pensionDisplay = _pension.where((promotion) {
                  var promoTitle = promotion.nom.toLowerCase();
                  return promoTitle.contains(text);
                }).toList();
              });
            },
          )),
    );
  }

   Future<List<Pension_model>> pensions;
   var dbHelper;

    @override
    void initState() {
      super.initState();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      dbHelper = DBHelper();
      refreshList();
      
    }
    refreshList() async{
       Future<List<Pension_model>> servicespp = dbHelper.getPensions();  
      _pension = await servicespp ;
      setState(() {
      _pensionDisplay = _pension;
      });
    }

  

   dataTable(List<Pension_model> services){
     
      _pensionDisplay = services;
      _pension = services;
      return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _pensionDisplay.length == null
                          ? 0
                          : _pensionDisplay.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(_pensionDisplay.length);
                        print(index);
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 25, right: 15,),
                          child: Pension_list(
                            id: _pensionDisplay[index].id.toString() ?. isEmpty ? "EMPTY" : _pensionDisplay[index].id.toString(),
                            nom: _pensionDisplay[index].nom ?. isEmpty ? "EMPTY" : _pensionDisplay[index].nom,
                          ),
                        );
                      },
                    ),
            );
      }

    list() {
      return Expanded(
        child: FutureBuilder(
          future: pensions,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return dataTable(snapshot.data);
            }

            if (null == snapshot.data || snapshot.data.length == 0){
                return  Container(
                    child: Center(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: CircularProgressIndicator(backgroundColor: Color(0xffe7e8ea),valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff1a92a3)),),
                            height: 50.0,
                            width: 50.0,
                          ),
                          
                        ],
                      ),
                    )
                    );
            }
            return  Container(
                    child: Center(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: CircularProgressIndicator(backgroundColor: Color(0xffe7e8ea),valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff1a92a3)),),
                            height: 50.0,
                            width: 50.0,
                          ),
                          
                        ],
                      ),
                    )
                    );
          }
        )
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a92a3),
      body:SingleChildScrollView(
       scrollDirection: Axis.vertical, 
              child: Container(
          child:
            Column(
              children: [
                Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 0.3) /1.3,
                    child: Column(
                      children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [        
                             
                            Container(
                                margin: const EdgeInsets.only(top:40, right: 15,left:20),
                                width: 30.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage('assets/pension_4-removebg-preview.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                 margin: const EdgeInsets.only(top:40),
                                child: Text(
                                  'Pensions',
                                  style: TextStyle(
                                    fontFamily: 'verdana',
                                    fontSize: 18,
                                    color: const Color(0xfff9f9f9),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                  ],),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black87.withOpacity(0),
                        child: _searchbar(),
                      ),
                      ],
                    ),
                ),
                
              SizedBox(height:15),
              Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) /1.3 -75,
                padding: EdgeInsets.only(bottom: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  color: const Color(0xffe7e8ea),
                ),
                 child: Column(children: [
                        
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: _pensionDisplay.length == null
                                ? 0
                                : _pensionDisplay.length +1 ,
                            itemBuilder: (BuildContext context, int index) {
                              print(_pensionDisplay.length);
                              print(index);
                              if(index == _pensionDisplay.length){
                                  return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25, right: 15,),
                                          child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(0),
                                                  
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left:10, right: 10, top: 18),))
                                        );
                              }else{
                                  return Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 15,),
                                child: Pension_list(
                                  id: _pensionDisplay[index].id.toString(),
                                  nom: _pensionDisplay[index].nom ?. isEmpty ? "EMPTY" : _pensionDisplay[index].nom,
                                ),
                              );
                              }
                              
                            },
                      ),
                  ),
                      ],),
                    
              ),
              ],
            ),
            
        ),
      ),
      
    
    );
  }
}
