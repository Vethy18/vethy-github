import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cado/shared/cubit/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/products_screen/products_screen.dart';
import '../components/constant.dart';


class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() : super(LoginInitialState());
  bool ispassword = true;
 Database? database;
  List <Map> services = [];


  static LoginCubit get(context) => BlocProvider.of(context);

  void passowrd() {
    ispassword = !ispassword;
    emit(PasswordState());
  }

  void createDatabase() {
    print('*********************');
    openDatabase(
      'qwert.db',
      version: 2,
      onCreate: (database, version) {
        if (kDebugMode) {
          print('database created');
        }

        database.execute(
            'CREATE TABLE users (id INTEGER PRIMARY  KEY,name TEXT, tel INTEGER , email TEXT, pass TEXT, confpas TEXT)')

            .then((value) {
          print('table users created');
        }).catchError((error) {
          print('error when ${error.toString()}');
        });
        database.execute(
            'CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT, quantity TEXT , value TEXT , image TEXT,'
                ' description TEXT, buy Double, sell Double)'
        ).then((value) {
          if (kDebugMode) {
            print('table products created');
          }
        }).catchError((error) {
          if (kDebugMode) {
            print('error ${error.toString()}');
          }
        });
      },
      onOpen: (database) {
        if (kDebugMode) {
          print('database opened');
        }
        getDataFromDatabase(database).then((value) {
          services = value;
          if (kDebugMode) {
            print(services);
          }
          emit(GetDataBaseState());
        });
        getProductFromDatabase(database);
        // getProductsInfo(database,)
      },

    ).then((value) {
      database = value;

      emit(CreateDataBaseState());
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT *FROM users');
  }


  insertToDatabase({
    @required name,
    @required tel,
    @required email,
    @required pass,
    @required confpass
  }) async
  {
    if (pass == confpass) {
      await database!.transaction((txn) async {
        txn.rawInsert('INSERT INTO users(name, tel , email ,pass)VALUES'
            '("$name","$tel","$email","$pass") '
        ).then((value) {
          print('$value inserted successfully');
          emit(InsertToDataBaseState());
          getDataFromDatabase(database).then((value) {
            services = value;
            print(services);
            emit(GetDataBaseState());
          });
        }).catchError((error) {
          print('error when inserting ${error.toString()}');
        });
      });
      print(database);
    } else {
      print('les deux mots de passes ne sont pas conformes');
    }
  }

  Future<List<Map>> Login({
    @required username,
    @required passowrd,
    @required context
  }) async {
    print('login');

    print(username);
    print(passowrd);

    await database!.rawQuery(
        "SELECT name,pass FROM users WHERE name='$username' and pass='$passowrd'"
    ).then((value) {
      if (kDebugMode) {
        print(value);
      }

      if (kDebugMode) {
        print(value.runtimeType);
      }

      if (value.isNotEmpty) {
        if (kDebugMode) {
          print('blllllllllllllllllll');
        }
        emit(AuthentificationState());
        Navigator.push(context,
          MaterialPageRoute(builder:
              (context) =>   ProductsScreen()
          ),
        );
      }
      else {
        if (kDebugMode) {
          print('error');
        }
        emit(AuthentificationErrorState());

      }
    });

    // print(services);
    return services;
  }

  void insertProductToDatabase({
    @required name,
    @required quantity,
    @required image,
    @required description,
    @required buy,
    @required sell,
     checked='false' ,
    @required context,


  }) async {
    await database!.transaction((txn) async {

      txn.rawInsert('INSERT INTO products (name,quantity,image,description,buy,sell,value)'
          'VALUES("$name",$quantity,"$image","$description","$buy","$sell",$checked)'
      ).then((value) {
        if (kDebugMode) {
          print('$value inserted successfully');
        }
        emit(InsertProductToDataBaseState());
        getProductFromDatabase(database);

      });
    });
  }
   updateProduct ( String name, String quantity, String? image,
       String description, String id,
       String buy,String sell,

  )async
  {

    await database!.rawUpdate('UPDATE products SET name=?, quantity=? , image=? , description=?,buy=?,'
        'sell=?  WHERE id=?',
        [name,quantity,image,description,buy,sell,id]
    ).
    then((value) {
      emit(UpdateProductState());
      getProductFromDatabase(database);

    }).catchError((onError){

      if (kDebugMode) {
        print('error when updating ${onError.toString()}');
      }
    });

  }

  void deleteProduct ({

    @required id,

  })async
  {

    await database!.rawDelete('DELETE FROM products WHERE id=?',
        [id]
    ).
    then((value) {
      emit(DeleteProductState());
      getProductFromDatabase(database);


    }).catchError((onError){

      if (kDebugMode) {
        print('error when deleting ${onError.toString()}');
      }
    });

  }


  void getProductFromDatabase(database) async {
     await database.rawQuery('SELECT *FROM products').then((value) {
      ListProducts = value;
      emit(GetProductState());
      print(ListProducts);

    });
  }
   searchProduct(
      String value,

  )
 async {
    await database?.query('products', where: 'name LIKE?',whereArgs: ['%$value%']).
    then((value)
    {
    ListProducts=value;
      emit(SearchProductState());


    }
    ).catchError((onError){
      if (kDebugMode) {
        print('error when ${onError.toString()}');
      }
    });

  }


  File? file;

  var bytes;

  Future imagePicker() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);

      file = File(myfile!.path);
     bytes = File(file!.path).readAsBytesSync() ;
     img64= base64.encode(bytes);
     // ListProducts.add(img64);
    emit(ImagePickerState());
   return img64;

  }
    bool isSelected=false;

  void changeSelectedItem()
  {
    isSelected =!isSelected;
    emit(ChangeSelectedItemState());

  }


}


