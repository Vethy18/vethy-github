
import 'package:cado/shared/cubit/cubit.dart';
import 'package:cado/modules/products_edit/produts_edit.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cado/shared/cubit/states.dart';
import '../../shared/components/constant.dart';
import '../products_add/addproduct.dart';

class ProductsScreen extends StatefulWidget {
   ProductsScreen({Key? key,


  }) : super(key: key);


  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

var searchController=TextEditingController();

 // List<ProductsScreen> selected=[];

  ProductsScreen? selected ;
  bool values =false;

@override
  void initState()
{

    super.initState();

print(ListProducts);

    // selected=ListProducts.cast();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){

      },
        builder:  (context,state){

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(
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
                  heroTag: 'b1',
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder:
                                  (context)=>const AddProduct()
                          )
                      );
                    },

                    child: const Icon(
                        Icons.add
                    )


                ),
              ],
            ),
            titleSpacing: 70.0,
            actions:  [

               Container(
                width: 160.0,
                child: TextFormField(
                  onChanged: (value){

                    LoginCubit.get(context).searchProduct(value);


                  },

                  controller: searchController,

                  keyboardType: TextInputType.text,
                  decoration:  const InputDecoration(
                    // ghh,
                      label: Text('Search'),
                      prefixIcon:Icon(
                        Icons.search,
                      )
                  ),
                ),

              ),
            ],


          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'b2',
            onPressed: () {

            },
            child: const Icon(
               Icons.shopping_cart
            ),
          ),
          body:SafeArea(

            child: ConditionalBuilder(
              condition:ListProducts.isNotEmpty,
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
                                    Text(
                                        ListProducts[index]['name']

                                    ),
                                    const SizedBox(
                                        width: 15.0),
                                    Text(
                                        ListProducts[index]['quantity'].toString()
                                    ),
                                    const SizedBox(
                                        width: 15.0),
                                    Text(
                                        '${ListProducts[index]['buy'].toString()} UM'
                                    ),
                                    const SizedBox(
                                        width: 15.0),
                                    Text('${ListProducts[index]['sell'].toString()} UM'
                                    ),
                                    const SizedBox(
                                        width: 15.0),


                                    // CheckboxListTile(
                                    //   title: Text(ListProducts[index]['name']),
                                    //
                                    //     value: ListProducts[index]['value']=='false'?false:true,
                                    //     onChanged: (value){
                                    //       ListProducts[index]['value']=value;
                                    //     }
                                    // ),

                                    Checkbox(

                                      value:ListProducts[index]['value']=='0'?false:true,

                                        onChanged: (value){
                                          if (kDebugMode) {
                                            print(value);
                                            print(ListProducts[index]['value']);
                                            setState(()  {
                                              ListProducts[index]['value']=value;

                                            });
                                          }
                                          if (kDebugMode) {
                                            print(ListProducts);
                                          }


                                        },

                                      activeColor: Colors.green,


                                    ),

                                    // IconButton(
                                    //     onPressed: (){
                                    //
                                    //           if(ListProducts[index]=ListProducts[index]) {
                                    //             LoginCubit.get(context).
                                    //          changeSelectedItem();
                                    //           }
                                    //
                                    //          if (kDebugMode) {
                                    //            print(ListProducts[index]['value'] =='false');
                                    //
                                    //          }
                                    //         // print(values);
                                    //
                                    //     },
                                    //
                                    //
                                    //     icon: LoginCubit.get(context).isSelected?
                                    //         const Icon(
                                    //           Icons.check_box,
                                    //           color: Colors.green,
                                    //         ):
                                    //         const Icon(
                                    //           Icons.check_box,
                                    //           color: Colors.grey,
                                    //         )
                                    // ),
                                    Expanded(
                                      child: TextButton(
                                   onPressed: (){
                                      if (kDebugMode) {
                                        print(ListProducts);
                                      }
                                      Navigator.push(
                                        context,MaterialPageRoute(builder:(context)=>
                                          ProductsEdit(

                                          idproduct:ListProducts[index]['id'].toString(),
                                          nameProduct:ListProducts[index]['name'],
                                          quantity:ListProducts[index]['quantity'],
                                          description:ListProducts[index]['description'],
                                          image:ListProducts[index]['image'],
                                            buy: ListProducts[index]['buy'].toString(),
                                            sell: ListProducts[index]['sell'].toString(),
                                      )
                                          ),

                                          );
                                        },
                                        child: const Text(
                                            'Edit'),
                                      ),

                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),
                        )
                    );

                  }

                ),
              fallback: (context)=>const Center(
                child: CircularProgressIndicator(),
              ),

            ),
          ),
        );
        },

    );
  }

}
