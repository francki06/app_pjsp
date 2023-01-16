import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pjsp/sqlite/db_helper.dart';
import 'package:pjsp/widget_list/Solde_list.dart';

import 'modele/Pension_model.dart';
import 'modele/Solde_model.dart';
import 'widget_list/Pension_list.dart';

class Search extends StatefulWidget {
  final String searchNature;
  const Search({Key key, this.searchNature}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}
class _SearchState extends State<Search> {
  List<Solde_model> _solde =  [
        new Solde_model(id:1,nom:"Nomination hee non fonctionnaire permanent"),
        new Solde_model(id:2,nom:"Nomination d'un fonctionnaire"),
        new Solde_model(id:3,nom:"Recrutement d'un ELD"),
        new Solde_model(id:4,nom:"Integration"),
        new Solde_model(id:5,nom:"Titularisation"),
        new Solde_model(id:6,nom:"Avancement d'echelon"),
        new Solde_model(id:7,nom:"Reclassement indiciaire"),

      ];
  List<Solde_model> _soldeDisplay = List<Solde_model>();
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
  
  var dbHelper;
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
                _soldeDisplay = _solde.where((promotion) {
                  var promoTitle = promotion.nom.toLowerCase();
                  return promoTitle.contains(text);
                }).toList();
                _pensionDisplay = _pension.where((promotion) {
                  var promoTitle = promotion.nom.toLowerCase();
                  return promoTitle.contains(text);
                }).toList();
              });
            },
          )),
    );
  }

 void refreshList()  async {

      Future<List<Pension_model>> servicespp = dbHelper.getPensions();  
      _pension = await servicespp ;
      Future<List<Solde_model>> servicess = dbHelper.getSoldes();  
      _solde = await servicess ;
      setState(() {
      
      if(widget.searchNature !=""){
        print("search nature"+widget.searchNature);
         _soldeDisplay = _solde.where((promotion) {
                  var promoTitle = promotion.nom.toLowerCase();
                  return promoTitle.contains(widget.searchNature.toLowerCase());
                }).toList();
                _pensionDisplay = _pension.where((promotion) {
                  var promoTitle = promotion.nom.toLowerCase();
                  return promoTitle.contains(widget.searchNature.toLowerCase());
                }).toList();
      }else{
          _soldeDisplay = _solde;
          _pensionDisplay = _pension;
      
      }
      });
      
    }
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
                  height: (MediaQuery.of(context).size.height * 0.2) /1.2 +3 ,
                  child: Column(
                    children: [
                Container(
                padding: const EdgeInsets.only(top:40,),
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
                height: (MediaQuery.of(context).size.height) /1.2 -78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  color: const Color(0xffe7e8ea),
                ),
               child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: ((MediaQuery.of(context).size.height) -19.5) /2.6 -15,
                      child: Column(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left:20,top:10,bottom:5),
                          child:  Text(
                                "Solde",
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 16,
                                color:const Color(0xff20494f),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: _soldeDisplay.length == null
                                ? 0
                                : _soldeDisplay.length,
                            itemBuilder: (BuildContext context, int index) {
                              print(index);
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 15,),
                                child: Solde_list(
                                  id: _soldeDisplay[index].id.toString(),
                                  nom: _soldeDisplay[index].nom ?. isEmpty ? "EMPTY" : _soldeDisplay[index].nom,
                                ),
                              );
                            },
                      ),
                  ),
                      ],),
                    ),
                    Container(
                      height: ((MediaQuery.of(context).size.height) -19.5) /2.6 -10,
                      child: Column(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left:20,bottom: 5,top:5),
                          child:  Text(
                                "Pensions",
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 16,
                                color: const Color(0xff20494f),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: _pensionDisplay.length == null
                                ? 0
                                : _pensionDisplay.length,
                            itemBuilder: (BuildContext context, int index) {
                              print(index);
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 15,),
                                child: Pension_list(
                                  id: _pensionDisplay[index].id.toString(),
                                  nom: _pensionDisplay[index].nom ?. isEmpty ? "EMPTY" : _pensionDisplay[index].nom,
                                ),
                              );
                            },
                      ),
                  ),
                      ],),
                    ),
                    
                  ],
                ),
                ),
              ),
              ],
            ),
            
        ),
      ),
      
    
    );
  }
}
