
import 'package:bloc/bloc.dart';

import 'package:cado/modules/login/login_srceen.dart';
import 'package:cado/shared/components/bloc_observer.dart';
import 'package:cado/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




void main() {

  BlocOverrides.runZoned(
        () {

      // Use cubits...
          runApp( const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit()..createDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}


