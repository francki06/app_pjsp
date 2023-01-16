import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:enough_mail/smtp/smtp_client.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:pjsp/sqlite/db_helper.dart';
import 'package:pjsp/widget_list/Contact_list.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'modele/Contact_model.dart';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List<Contact_model> _pension = [];
  List<Contact_model> _contactDisplay = List<Contact_model>();

  List<String> attachment = <String>[];
  final TextEditingController _subjectController =
      TextEditingController(text: '''''');
  final TextEditingController _bodyController =
      TextEditingController(text: '''''');
  final TextEditingController _emailController =
      TextEditingController(text: '''''');
  final TextEditingController _phoneController =
      TextEditingController(text: '''''');
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  String userName = 'solde.pension.send@gmail.com';
  String password = 'Srspfianara';
  String domain = 'google.com';
  int imapServerPort = 993;
  bool isImapServerSecure = true;
  int popServerPort = 995;
  bool isPopServerSecure = true;
  String smtpServerHost = 'smtp.google.com';
  int smtpServerPort = 465;
  bool isSmtpServerSecure = true;
  _sendVerify() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      //_send();
      _sendEmail();
    } else {
      _btnController.reset();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Se connecter à un réseau"),
              content: Text(
                  "Pour envoyer cette doléance, vous devez activer votre données mobile ou WI-FI"),
              actions: [
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                )
              ],
            );
          });
    }
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  /*Future<void> _send() async {
    String username = 'solde.pension.send@gmail.com';
    String password = 'Srspfianara';

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username, 'PJSP')
      ..recipients.add('solde.pensions.dol@gmail.com')
      ..subject = 'Doleances'
      ..text = ''
      ..html = "<h3>Expediteur: " +
          _subjectController.text +
          "<h3>\n<p> Email : " +
          _emailController.text +
          "</p> \n <p> Téléphone : " +
          _phoneController.text +
          " </p> \n <p> Message : " +
          _bodyController.text +
          "  </p>";
    _btnController.start();
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      _btnController.success();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Information"),
              content: Text("Votre doléance a été envoyé avec succès!!"),
              actions: [
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    _btnController.stop();
                  },
                )
              ],
            );
          });
    } on MailerException catch (e) {
      _btnController.error();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Erreur"),
              content: Text(
                  "Une erreur est survenue lors de l'envoie de la doléance. Veuillez réessayer!!"),
              actions: [
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    _btnController.stop();
                  },
                )
              ],
            );
          });
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }

    // Sending multiple messages with the same connection
    //
    // Create a smtp client that will persist the connection
    var connection = PersistentConnection(smtpServer);

    // Send the first message
    await connection.send(message);

    // send the equivalent message

    // close the connection
    await connection.close();
  } */

  // Send Email with emailjs
  Future _sendEmail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    /*const serviceId = "service_j67qf1q";
    const templateId = "template_9zytpms";
    const userId = "iZk0FiRAMgfM3OsYE";*/
    const serviceId = "service_a64zmll";
    const templateId = "template_4datu0k";
    const userId = "OqcMdOUhis2AH7Mg7";
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params": {
            "name": _subjectController.text,
            "email": _emailController.text,
            "message": _bodyController.text,
            "phone": _phoneController.text,
          }
        }));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      _btnController.success();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Information"),
              content: Text("Votre doléance a été envoyé avec succès!!"),
              actions: [
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    _btnController.stop();
                  },
                )
              ],
            );
          });
    } else {
      _btnController.stop();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Erreur"),
              content: Text(
                  "Une erreur est survenue lors de l'envoie de la doléance. Veuillez réessayer!!"),
              actions: [
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    _btnController.stop();
                  },
                )
              ],
            );
          });
    }
    return response.statusCode;
  }

  Future<List<Contact_model>> services;
  var dbHelper;
  final _formKey = GlobalKey<FormState>();
  String _selectVal = 'Filtrer par catégorie';
  List _selectName = [
    'Filtrer par catégorie',
    'Service Régional de la Solde et des Pensions',
    'Antenne de la Solde et des Pensions',
    'Service Centrale de la Solde et des Pensions'
  ];
  String formValide = "valide";
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

  refreshList() async {
    services = dbHelper.getServices('');
    _pension = await services;
    setState(() {
      _contactDisplay = _pension;
    });
  }

  showViaSelect(String id) async {
    services = dbHelper.getServices(id);
    _pension = await services;
    setState(() {
      _contactDisplay = _pension;
    });
  }

  GoogleSignIn googleSignIn = new GoogleSignIn(
    scopes: <String>['https://www.googleapis.com/auth/gmail.send'],
  );

  Future<Null> handleSignOut() async {
    googleSignIn.disconnect();
  }

  Future<void> smtpExample() async {
    var client = SmtpClient('enough.de', isLogEnabled: true);
    await client.connectToServer(smtpServerHost, smtpServerPort,
        isSecure: isSmtpServerSecure);
    var ehloResponse = await client.ehlo();
    if (!ehloResponse.isOkStatus) {
      print('SMTP: unable to say helo/ehlo: ${ehloResponse.message}');
      return;
    }
    var loginResponse = await client.login(
        'rollandanjaratianafaneva@gmail.com', '20001031yves');
    if (loginResponse.isOkStatus) {
      var builder = MessageBuilder.prepareMultipartAlternativeMessage();
      builder.from = [
        MailAddress('My name', 'rollandanjaratianafaneva@gmail.com')
      ];
      builder.to = [MailAddress('Your name', 'anjaratiana@yopmail.com')];
      builder.subject = 'My first message';
      builder.addTextPlain('hello world.');
      builder.addTextHtml('<p>hello <b>world</b></p>');
      var mimeMessage = builder.buildMimeMessage();
      var sendResponse = await client.sendMessage(mimeMessage);
      print('message sent: ${sendResponse.isOkStatus}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a92a3),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height - 60,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, right: 20, left: 20),
                    width: 30.0,
                    height: 25.0,
                    child: Icon(
                      Icons.contact_mail,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    height:
                        (MediaQuery.of(context).size.height * 0.2) / 1.2 - 42,
                    child: Text(
                      'Services',
                      style: TextStyle(
                        fontFamily: 'verdana',
                        fontSize: 18,
                        color: const Color(0xfff9f9f9),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.2 - 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  color: const Color(0xffe7e8ea),
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(
                            text: "Contacts",
                          ),
                          Tab(
                            text: "Doléance",
                          ),
                        ],
                        indicatorColor: const Color(0xffffa914),
                        labelColor: const Color(0xff20494f),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 1.3 - 68,
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(children: [
                          Column(
                            children: [
                              //list
                              Container(
                                  child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16.0, top: 16),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xffffa914), width: 1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        dropdownColor: Color(0xfff9f9f9),
                                        elevation: 5,
                                        isExpanded: true,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 36,
                                        hint: Text("Select Contact"),
                                        value: _selectVal,
                                        style: TextStyle(
                                            color: Color(0xff20494f),
                                            fontSize: 14),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectVal = value;
                                          });
                                          if (value ==
                                              'Service Régional de la Solde et des Pensions') {
                                            showViaSelect('1');
                                          } else if (value ==
                                              'Antenne de la Solde et des Pensions') {
                                            showViaSelect('2');
                                          } else if (value ==
                                              'Filtrer par catégorie') {
                                            refreshList();
                                          } else {
                                            showViaSelect('3');
                                          }
                                        },
                                        items: _selectName.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              )),

                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: _contactDisplay.length == null
                                      ? 0
                                      : _contactDisplay.length + 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    print(index);
                                    if (index == _contactDisplay.length) {
                                      return Padding(
                                          padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 15,
                                          ),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 18),
                                              )));
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 6, right: 15, top: 15),
                                        child: Contact_list(
                                          id: _contactDisplay[index]
                                              .id
                                              .toString(),
                                          nom: _contactDisplay[index].nom,
                                          telephone:
                                              _contactDisplay[index].telephone,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 18,
                              right: 18,
                              top: 18,
                            ),
                            height:
                                MediaQuery.of(context).size.height / 1.3 - 11,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Doléance à propos des activités de la Direction de la Solde et des Pensions \n (Fitarainana na sosokevitra fanatsarana ny asa)",
                                        style: TextStyle(
                                          fontFamily: 'verdana',
                                          fontSize: 14,
                                          color: const Color(0xff20494f),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        height: formValide == null ? 60 : 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: TextFormField(
                                            cursorColor: Colors.black,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Saisissez votre nom!';
                                              }
                                              return null;
                                            },
                                            controller: _subjectController,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffffa914))),
                                              labelText:
                                                  "Expediteur (Mpandefa)",
                                              labelStyle: TextStyle(
                                                  color: Color(0xff20494f)),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        height: 40,
                                        child: TextFormField(
                                            cursorColor: Colors.black,
                                            controller: _emailController,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffffa914))),
                                              labelText:
                                                  "Votre adresse email (Adiresy mailaka)",
                                              labelStyle: TextStyle(
                                                  color: Color(0xff20494f)),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        height: formValide == null ? 60 : 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: TextFormField(
                                            cursorColor: Colors.black,
                                            controller: _phoneController,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Saisissez votre numero téléphone';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffffa914))),
                                              labelText:
                                                  "Téléphone (Laharana finday)",
                                              labelStyle: TextStyle(
                                                  color: Color(0xff20494f)),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: TextFormField(
                                            cursorColor: Colors.black,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Saisissez votre message!';
                                              }
                                              return null;
                                            },
                                            maxLines: 8,
                                            controller: _bodyController,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffffa914))),
                                              labelText: "Message (Hafatra)",
                                              labelStyle: TextStyle(
                                                  color: Color(0xff20494f)),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: 15),
                                      RoundedLoadingButton(
                                        color: const Color(0xff20494f),
                                        successColor: const Color(0xff20494f),
                                        controller: _btnController,
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            // If the form is valid, display a Snackbar.
                                            _sendVerify();

                                            setState(() {
                                              formValide = "valide";
                                            });
                                          } else {
                                            _btnController.reset();
                                            print('formulaire invalide');
                                            setState(() {
                                              formValide = null;
                                            });
                                          }
                                        },
                                        valueColor: Colors.white,
                                        borderRadius: 20,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Envoyer",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      )
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
