import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pjsp/Apropos.dart';
import 'package:pjsp/Contact.dart';
import 'package:pjsp/Pension.dart';
import 'package:pjsp/Search.dart';
import 'package:pjsp/Solde.dart';

class BottomNavBar extends StatefulWidget {
  final String defaultPageShow;
  final String searchNature;
  const BottomNavBar({Key key, this.defaultPageShow, this.searchNature}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {
   List<String> _navigationQueue =List();
  Widget _showPage;
  int _index_show = 0;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    
    if(widget.defaultPageShow == "pension")
    {
       _showPage = new Pension();
       _index_show = 3;
       _navigationQueue.add( "pension");
    }else if(widget.defaultPageShow == "solde"){
       _showPage = new Solde();
       _index_show = 2;
       _navigationQueue.add("solde");
    }else{
      _showPage = new Search(searchNature: widget.searchNature,);
       _index_show = 1;
       _navigationQueue.add("recherche");
    }
  }

 Future<bool> _onBackPressed(){
   
       _navigationQueue.removeLast();
       if(_navigationQueue.isEmpty){
          Navigator.pop(context);
       }else
        if( _navigationQueue.last == "pension")
          {
             setState(() {
            _showPage = new Pension();
            _index_show = 3;
             });
          }else if(_navigationQueue.last == "solde"){
            setState(() {
            _showPage = new Solde();
            _index_show = 2;
             });
          }else if(_navigationQueue.last == "recherche"){
            setState(() {
            _showPage = new Search(searchNature: "",);
            _index_show = 1;
             });
          }else if(_navigationQueue.last == "contact"){
            setState(() {
            _showPage = new Contact();
            _index_show = 4;
             });
          }else if(_navigationQueue.last == "apropos"){
            setState(() {
            _showPage = new Apropos();
            _index_show = 5;
             });
          }else{
            Navigator.pop(context);
          }
          
    
    true;
  }

  @override
  Widget build(BuildContext context) {
    _pageShooser(int page){
        switch(page){
          case 0:
            Navigator.pop(context);
            break;
          case 3:
            _showPage = Pension();
            if(_navigationQueue.last != "pension"){
              _navigationQueue.add( "pension");
            }
            break;
          case 1:
            _showPage = Search(searchNature: "");
             if(_navigationQueue.last != "recherche"){
              _navigationQueue.add( "recherche");
            }
            break;
          case 2:
            _showPage = Solde();
             if(_navigationQueue.last != "solde"){
              _navigationQueue.add( "solde");
            }
            break;
          case 4: 
            _showPage = Contact();
             if(_navigationQueue.last != "contact"){
              _navigationQueue.add( "contact");
            }
            break;
          case 5:
            _showPage = Apropos();
             if(_navigationQueue.last != "apropos"){
              _navigationQueue.add( "apropos");
            }
           break;
          default:
            _showPage = new Container(
              child: new Center(
                child: new Text(
                    "No page found by page chooser",
                    style: new TextStyle(fontSize:30),  
                  )
              ),
            );
        }
     }
    
    return new WillPopScope(
      onWillPop: _onBackPressed,
          child: Scaffold(
        backgroundColor: const Color(0xff1a92a3),
        body: Container(
          child: _showPage,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: _index_show,
          color:  Color(0xff1a92a3),
          buttonBackgroundColor:  Color(0xffe7e8ea),
          backgroundColor:  Color(0xffe7e8ea),
          height: 60,
          items:[
            Icon(Icons.home, size: 30,color:Colors.black,),
            Icon(Icons.search, size: 30,color:Colors.black,),
            ImageIcon(
                AssetImage("assets/solde_round.png"),
                color: Colors.black,
                size: 30,
            ),ImageIcon(
                AssetImage("assets/pension_4-removebg-preview.png"),
                color: Colors.black,
                size: 30,
            ),
            Icon(Icons.contact_mail, size: 30,color:Colors.black,),
            Icon(Icons.info, size: 30,color:Colors.black,),
          ],
          animationDuration: Duration(
            milliseconds: 100,
          ),
          animationCurve: Curves.bounceInOut,
          onTap: (index){
            setState((){
              _pageShooser(index);
            }); 
            
          }, ),
      ),
    );
  }
}

