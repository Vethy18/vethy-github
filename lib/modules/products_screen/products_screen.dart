import 'dart:io';
import 'package:cado/shared/cubit/cubit.dart';
import 'package:cado/modules/products_edit/produts_edit.dart';
import 'package:cado/shared/cubit/cubit.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cado/shared/cubit/states.dart';
import '../../shared/components/constans.dart';
import '../products_add/addproduct.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> LoginCubit()..createDatabase(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){

        },
          builder:  (context,state){
         // var list= LoginCubit.get(context).ListProducts;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                ),
                color: Colors.blue,
                iconSize: 25.0,
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  FloatingActionButton(
                      mini: true,

                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder:
                                    (context)=>AddProduct()
                            )
                        );
                      },

                      child: Icon(
                          Icons.add
                      )


                  ),
                ],
              ),
              titleSpacing: 70.0,


            ),
            body:SafeArea(

              child: ConditionalBuilder(
                condition:ListProducts.length>0,
                builder: (context)=>ListView.builder(itemCount: ListProducts.length,
                    itemBuilder:
                     (context, index) {
                      return Card(
                          child:
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(ListProducts[index]['name']

                                      ),
                                      Text(ListProducts[index]['quantity'].toString()
                                      ),
                                      TextButton(
                                    onPressed: (){
                                      print(ListProducts);
                                      Navigator.push(
                                        context,MaterialPageRoute(builder:(context)=>
                                          ProductsEdit(

                                          idproduct:ListProducts[index]['id'].toString(),
                                          nameProduct:ListProducts[index]['name'],
                                          quantity:ListProducts[index]['quantity'],
                                          description:ListProducts[index]['description'],
                                          image:ListProducts[index]['image']
                                      )
                                          ),

                                          );
                                        },
                                        child: Text('Edit'),
                                      ),
                                      SizedBox(height: 15.0),

                                    ],
                                  ),
                                ],

                              ),

                            ),
                          )

                      );

                    }
                  ),
                fallback: (context)=>Center(
                  child: CircularProgressIndicator(),
                ),

              ),
            ),
          );
          },

      ),
    );
  }

}
