import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pjsp/modele/Piece_model.dart';
import 'package:pjsp/sqlite/db_helper.dart';
import 'package:pjsp/widget_list/Pension_dossier_list.dart';

import 'package:pjsp/modele/Article_model.dart';
import 'modele/Pension_piece_model.dart';
class DetailPension extends StatefulWidget {
  String id;
  String nom;
   DetailPension({
    Key key,
    this.id,
    this.nom,
  }) : super(key: key);
  @override
  _DetailPensionState createState() => _DetailPensionState();
}
class _DetailPensionState extends State<DetailPension> {
  String article;
  List<Article_model> _articles = List<Article_model>();
  Future<List<Piece_model>> pensions;
  List<Piece_model> _pensionss = List<Piece_model>();
  List<Pension_piece_model> _piecepensions = List<Pension_piece_model>();
   var dbHelper;
  var articlee;
  @override
    void initState() {
      super.initState();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
       dbHelper = DBHelper();
       refreshListArticle(widget.id);
       refreshList(widget.id);
    }

   void refreshList(String id) async{
      Future<List<Piece_model>> servicespp = dbHelper.getAllPieces(id);
      _pensionss = await servicespp ;
      print("index fichier piece "+ _pensionss.length.toString());
      
      setState(() {
        String id_dossier;
        String id_titre;
        for(int i = 0; i < _pensionss.length; i++){
        print("index fichier pension "+ i.toString());
        print("nom piece "+ _pensionss[i].nom_piece);
          if( i ==0){

             id_dossier = _pensionss[i].nom_soustitre;
             id_titre = _pensionss[i].nom_titre;
               _piecepensions.add(new Pension_piece_model(id:_pensionss[i].n_titre.toString(),nom:_pensionss[i].nom_titre,soustitre:_pensionss[i].nom_soustitre, fichier:_pensionss[i].nom_piece));
              
          }else{
            if(_pensionss[i].nom_soustitre == id_dossier){
             _piecepensions.add(new Pension_piece_model(id:_pensionss[i].n_titre.toString(),nom:null,soustitre:null, fichier:_pensionss[i].nom_piece));
             }else{
              id_dossier = _pensionss[i].nom_soustitre;
                  if(id_titre ==  _pensionss[i].nom_titre){
                        id_dossier = _pensionss[i].nom_soustitre;
                       _piecepensions.add(new Pension_piece_model(id:_pensionss[i].n_titre.toString(),nom:null,soustitre:_pensionss[i].nom_soustitre, fichier:_pensionss[i].nom_piece));
                  }else{
                      id_titre =  _pensionss[i].nom_titre;
                      id_dossier = _pensionss[i].nom_soustitre;
                    _piecepensions.add(new Pension_piece_model(id:_pensionss[i].n_titre.toString(),nom:_pensionss[i].nom_titre,soustitre:_pensionss[i].nom_soustitre, fichier:_pensionss[i].nom_piece));
                  }
             
           }
          }
      }
      });
      
        
    }

    void refreshListArticle(String id)  async {

      Future<List<Article_model>> servicess = dbHelper.getArticleByNature(id);  
      _articles = await servicess ;
      print("article length "+ _articles.length.toString());
    }
  
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xff1a92a3),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          
          child: Column(
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height * 0.3) /1.3 +5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [        
                           
                          Container(
                              margin: const EdgeInsets.only(top:40, right: 20,left: 10),
                              width: 30.0,
                              height: 25.0,
                              child:GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.chevron_left, size: 25,color: Color(0xfff9f9f9),)),
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
                  SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                  width: 37.0,
                  height: 36.0,
                  margin: EdgeInsets.only(left:15,right:10,top:5, bottom: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: const Color(0xffe7e8ea),
                    ),
                   child: Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/pension_4-removebg-preview.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
              Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child:  Text(
                      widget.nom,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 14,
                        color: const Color(0xffe7e8ea),
                      ),
                      textAlign: TextAlign.left,
                    ),
                )
                ],
              ),
              
                  ],
                ),
              ),
               SizedBox(height: 15,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height) /1.3 -20 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(48.0),
                      topLeft:  Radius.circular(48.0),
                    ),
                    color: const Color(0xffe7e8ea),
                  ),
                  child:DefaultTabController(
                length: 2,
                                      child: Column(
                      children: [
                        TabBar(tabs: [
                          Tab(text: "Référence",),
                          Tab( text:"Liquidation",),
                        ],
                        indicatorColor: const Color(0xffffa914),
                        labelColor: const Color(0xff20494f),
                        ),
                        Container(
                              height: MediaQuery.of(context).size.height/1.3-70 ,
                              width: MediaQuery.of(context).size.width,
                          child: TabBarView(
                            
                            children: [
                             Column(children: [
                              Expanded(child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: _articles.length == null
                                  ? 0
                                  : _articles.length,
                              itemBuilder: (BuildContext context, int index) {
                                print("index articles length "+_articles.length.toString());
                                return Padding(
                                  padding:
                                      const EdgeInsets.only( left:30),
                                  child:Container(
      
                                      child:
                                        Padding(
                                                padding: const EdgeInsets.only(left:10, right: 10, top: 8),
                                                child: 
                                                                Text(
                                                                  _articles[index].text == null ? "- empty":"- "+_articles[index].text +"  ",
                                                                  style: TextStyle(
                                                                    fontFamily: 'Segoe UI',
                                                                    fontSize: 14,
                                                                    color: const Color(0xff20494f),
                                                                  ),
                                                                  textAlign: TextAlign.left,
                                                                ),
                                                              
                                              ),
                                    
                                    ),
                                );
                              },
                            ),),
                            ],),
                              Column(children: [
                               Expanded(
                                    child:
                                        ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: _piecepensions.length == null
                                                  ? 0
                                                  : _piecepensions.length +1,
                                              itemBuilder: (BuildContext context, int index) {
                                                print("index dossier pension length "+_piecepensions.length.toString());
                                                if(index == _piecepensions.length){
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
                                                            const EdgeInsets.only(left:30),
                                                        child:
                                                            Pension_dossier_list(
                                                                  id: _piecepensions[index].id,
                                                                  nom: _piecepensions[index].nom,
                                                                  fichier: _piecepensions[index].fichier,
                                                                  soustitre: _piecepensions[index].soustitre,
                                                                ),
                                                          
                                                          
                                                      );
                                                }
                                                
                                              },
                                            ),
                                      
                                  ),
                          ],),
                         ],),
                        ),
                      ],
                    ),
                  ),
                ),
               
            ],
          ),
        
      ),
    );
  }
}

