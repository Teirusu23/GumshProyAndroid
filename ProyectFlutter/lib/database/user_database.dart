import 'package:sqflite/sqlite_api.dart';

class UserDatabase {
  static const NAMEDB = "USERDB";
  static const VERSIONDB = 1;

  static Database? _database; // _ = indica que la variable es privada
  get database{ //patron singleton
    if(_database != null) return _database;
    return _database = initDatabase();
  }
  
  Database? initDatabase() {
    
  }

}