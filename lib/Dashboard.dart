import 'package:auto_complete_search/auto_complete_search.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pjsp/DetailPension.dart';
import 'package:pjsp/DetailSolde.dart';
import 'package:pjsp/page/BottomNavBar.dart';
import 'package:pjsp/sqlite/db_helper.dart';

import 'modele/Activite_model.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<List<Activite_model>> services;
  var dbHelper;
  List<Activite_model> suggestions = [];

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

  void refreshList() async {
    Future<List<Activite_model>> servicess = dbHelper.getAllNature();
    suggestions = await servicess;
    print(" length suggestions " + suggestions.length.toString());
    setState(() {
      textField = new AutoCompleteTextField<Activite_model>(
        decoration: new InputDecoration(
          hintText: "Rechercher...",
          border: InputBorder.none,
        ),
        itemSubmitted: (item) => setState(() {
          selected = item;
          if (item.type == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailSolde(
                      id: item.id.toString(),
                      nom: item.nom,
                      article: item.article,
                    )));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailPension(
                      id: item.id.toString(),
                      nom: item.nom,
                    )));
          }
        }),
        key: key,
        textChanged: (newText) => inputvalue = newText,
        suggestions: suggestions,
        itemBuilder: (context, suggestion) => new Padding(
            child: new ListTile(
              title: new Text(
                suggestion.nom,
                style: TextStyle(
                  fontFamily: 'Verdana',
                  fontSize: 13,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 0)),
        itemSorter: (a, b) => a.id == b.id
            ? 0
            : a.id > b.id
                ? -1
                : 1,
        itemFilter: (suggestion, input) => removeDiacritics(suggestion.nom)
            .toLowerCase()
            .contains(input.toLowerCase()),
      );
      searchField = AutoCompleteSearchField(
          itemSubmitted: (item) => setState(() {
                selected = item;
                if (item.type == 1) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailSolde(
                            id: item.id.toString(),
                            nom: item.nom,
                            article: item.article,
                          )));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPension(
                            id: item.id.toString(),
                            nom: item.nom,
                          )));
                }
              }),
          key: keysearch,
          controller: acticitetrl,
          textChanged: (newText) => inputvalue = newText,
          decoration: new InputDecoration(
            hintText: "Rechercher...",
            border: InputBorder.none,
          ),
          itemSorter: (a, b) => a.id == b.id
              ? 0
              : a.id > b.id
                  ? -1
                  : 1,
          submitOnSuggestionTap: true,
          suggestions: suggestions,
          suggestionsDirection: SuggestionsDirection.down,
          suggestionWidgetSize: 50,
          itemBuilder: (context, suggestion) => new Padding(
              child: new ListTile(
                title: new Text(
                  suggestion.nom,
                  style: TextStyle(
                    fontFamily: 'Verdana',
                    fontSize: 13,
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 0)),
          itemFilter: (suggestion, input) => removeDiacritics(suggestion.nom)
              .toLowerCase()
              .contains(input.toLowerCase()));
    });
  }

  GlobalKey key = new GlobalKey<AutoCompleteTextFieldState<Activite_model>>();
  final TextEditingController acticitetrl = TextEditingController();
  GlobalKey keysearch =
      new GlobalKey<AutoCompleteSearchFieldState<Activite_model>>();
  Activite_model selected;
  String inputvalue = "";
  AutoCompleteTextField<Activite_model> textField;
  AutoCompleteSearchField<Activite_model> searchField;

  _loadSearch(String input) {
    print("valeur input  $input");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BottomNavBar(
                defaultPageShow: "search",
                searchNature: input,
              )),
    );
  }

  _loadSolde() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BottomNavBar(
                defaultPageShow: "solde",
              )),
    );
  }

  _loadPension() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BottomNavBar(
                defaultPageShow: "pension",
              )),
    );
  }

  String removeDiacritics(String str) {
    var withDia =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < withDia.length; i++) {
      str = str.replaceAll(withDia[i], withoutDia[i]);
    }

    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a92a3),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 7.5,
                    margin: const EdgeInsets.only(top: 40),
                    child: Image(
                      image: const AssetImage('assets/MEF.png'),
                      height: MediaQuery.of(context).size.height / 7.5 - 10,
                      fit: BoxFit.fill,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 7.5 - 10,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    color: const Color(0x43afbe),
                  ),
                  child: Text(
                    'DIRECTION GENERALE DU BUDGET ET DES FINANCES \n DIRECTION DE LA SOLDE ET DES PENSIONS',
                    style: TextStyle(
                      fontFamily: 'Verdana',
                      fontSize: 15,
                      color: const Color(0xffe5e5e5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 7.5 - 10,
                    margin: const EdgeInsets.only(top: 5),
                    child: Image(
                      image: const AssetImage('assets/PJSP.png'),
                      height: MediaQuery.of(context).size.height / 7.5 - 10,
                      fit: BoxFit.fill,
                    )),
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Text(
                    'Bienvenue dans PJSP, une application mobile pour consulter les Pièces Justificatives requises en matière de  Solde et des Pensions',
                    style: TextStyle(
                      fontFamily: 'Verdana',
                      fontSize: 13,
                      color: const Color(0xffe5e5e5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      height: 39.0,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                        color: const Color(0xffe7e8ea),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffe5e5e5)),
                      ),
                      child: searchField,
                    ),
                    GestureDetector(
                      onTap: () => _loadSearch(inputvalue),
                      child: Container(
                        width: 48.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          color: const Color(0xffffa914),
                          border: Border.all(
                              width: 1.0, color: const Color(0xffe5e5e5)),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Activités',
                  style: TextStyle(
                    fontFamily: 'Verdana',
                    fontSize: 13,
                    color: const Color(0xffe7e8ea),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _loadSolde(),
                      child: Container(
                        margin: const EdgeInsets.only(left: 40),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 3.2,
                        height: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffe7e8ea),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff20494f)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/solde_round.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Solde',
                                style: TextStyle(
                                  fontFamily: 'Impact',
                                  fontSize: 15,
                                  color: const Color(0xff20494f),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () => _loadPension(),
                      child: Container(
                        margin: const EdgeInsets.only(right: 40),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 3.2,
                        height: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffe7e8ea),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff20494f)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/pension_4-removebg-preview.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Pensions',
                                style: TextStyle(
                                  fontFamily: 'Impact',
                                  fontSize: 15,
                                  color: const Color(0xff20494f),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
