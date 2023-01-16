import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pjsp/modele/Activite_model.dart';
import 'package:pjsp/modele/Contact_model.dart';
import 'package:pjsp/modele/Piece_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pjsp/modele/Pension_model.dart';
import 'package:pjsp/modele/Solde_model.dart';

import 'package:pjsp/modele/Article_model.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:pjsp/modele/Contact_model.dart';

class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TABLE = 'service';
  static const String DB_NAME = 'pjsp.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    print("mandeh ve ni copie");
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "pjsp.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "pjspsql.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    // open the database
    var dbb = await openDatabase(path, readOnly: true);
    return dbb;
  }

  Future<List<Contact_model>> getServices(String id) async {
    var dbClient = await db;
    if (id != '') {
      List<Map> maps = await dbClient.rawQuery(
          "select * from service where type = $id order by nom_service asc;");
      List<Contact_model> services = [];
      if (maps.length > 0) {
        for (int i = 0; i < maps.length; i++) {
          services.add(Contact_model.fromMap(maps[i]));
        }
      }
      return services;
    } else {
      List<Map> maps = await dbClient
          .rawQuery("select * from service  order by nom_service asc;");
      List<Contact_model> services = [];
      if (maps.length > 0) {
        for (int i = 0; i < maps.length; i++) {
          services.add(Contact_model.fromMap(maps[i]));
        }
      }
      return services;
    }
  }

  Future<List<Pension_model>> getPensions() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery(
        "select * from Nature where  n_typedocument =2 order by n_nature;");
    List<Pension_model> pensions = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        pensions.add(Pension_model.fromMap(maps[i]));
      }
    }
    return pensions;
  }

  Future<List<Solde_model>> getSoldes() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery(
        "select * from Nature  where   n_typedocument =1 order by n_nature;");
    List<Solde_model> soldes = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        soldes.add(Solde_model.fromMap(maps[i]));
      }
    }
    return soldes;
  }

  Future<List<Activite_model>> getAllNature() async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.rawQuery("select * from Nature order by n_nature;");
    List<Activite_model> services = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        services.add(Activite_model.fromMap(maps[i]));
      }
    }
    return services;
  }

  Future<List<Article_model>> getArticleByNature(String id) async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.rawQuery("select * from article where id_nature = $id;");
    List<Article_model> services = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        services.add(Article_model.fromMap(maps[i]));
      }
    }
    return services;
  }

  Future<List<Piece_model>> getAllPieces(String id) async {
    print("id pension = " + id);
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery(
        "select * from Nature,titre,sous_titre,piece where (Nature.n_nature = titre.n_nature) and (titre.n_titre = sous_titre.n_titre) and (sous_titre.n_soustitre = piece.n_soustitre) and (nature.n_nature = $id);");
    List<Piece_model> services = [];
    print("index fichier piece  ee" + maps.length.toString());
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        services.add(Piece_model.fromMap(maps[i]));
        print("  ee" + maps[i].toString());
      }
    }
    return services;
  }

  Future<List<Piece_model>> getAllPiecesSoldeVisa(String id) async {
    print("id pension = " + id);
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery(
        "select * from Nature,titre,sous_titre,piece where (Nature.n_nature = titre.n_nature) and (titre.n_titre = sous_titre.n_titre) and (sous_titre.n_soustitre = piece.n_soustitre) and (nature.n_nature = $id) and (titre.n_typepiece  = 1);");
    List<Piece_model> services = [];
    print("index fichier piece  ee" + maps.length.toString());
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        services.add(Piece_model.fromMap(maps[i]));
        print("  ee" + maps[i].toString());
      }
    }
    return services;
  }

  Future<List<Piece_model>> getAllPiecesSoldeMandat(String id) async {
    print("id pension = " + id);
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery(
        "select * from Nature,titre,sous_titre,piece where (Nature.n_nature = titre.n_nature) and (titre.n_titre = sous_titre.n_titre) and (sous_titre.n_soustitre = piece.n_soustitre) and (nature.n_nature = $id) and (titre.n_typepiece = 2);");
    List<Piece_model> services = [];
    print("index fichier piece  ee" + maps.length.toString());
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        services.add(Piece_model.fromMap(maps[i]));
        print("  ee" + maps[i].toString());
      }
    }
    return services;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
