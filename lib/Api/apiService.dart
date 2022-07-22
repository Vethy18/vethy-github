import 'package:sqflite/sqflite.dart';

class ApiService{
  late Database database;
  List<Map> users = [];

















  Future<Null> createDatabase ()async
  {
    database= await openDatabase(
      'test1.db',
      version: 2,
      onCreate: (database,version) {

        print('database created');

        database.execute('CREATE TABLE users (id INTEGER PRIMARY  KEY,name TEXT, tel INTEGER , email TEXT, pass TEXT)').then((value) {
          print('table created');
        }).catchError((error){
          print('error when ${error.toString()}');
        });

      },
      onOpen: (database)async{
        getDataFromDatabase(database).then((value) {
          users = value;
          print (users);


        });
      },

    );
   return await null;
  }
  login(username,password) async{
    bool success=false;
  var utlisateur= await database.rawQuery('SELECT name ,pass FROM users WHERE users.name="$username" '
      'AND users.pass="$password"');
    if(utlisateur.isNotEmpty){
      success=true;
    }
    return success;
  }
  Future insertToDatabase(
     name,
     tel,
    email,
      pass,
      confpass
  ) async
  {

    return await  database.transaction((txn)async{

      txn.rawInsert('INSERT INTO users(name, tel , email ,pass,confpass)VALUES'
          '("$name","$tel","$email","$pass","$confpass") '
      ).then((value) {

        print('$value inserted successfully');
      }).catchError((error){

        print('error when inserting ${error.toString()}');
      });

      return null;
    });
  }
  // void getLogged(){
  //
  // }
  Future<List<Map>> getDataFromDatabase(database) async{
    return  await database.rawQuery('SELECT *FROM users');


  }
}