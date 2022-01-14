
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_item_view.dart';
import '../data/ListData.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(247, 246, 242, 1),

      appBar: AppBar(
        title: Text("Cart Item"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Provider.of<ListData>(context).getCartList().isEmpty ? Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Icon(

            Icons.shopping_cart,
            size: 70,
          ),

              Text("Your cart is empty."
              , style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed:(){
                    Navigator.pop(context);
              },child: Text("Start Shoping")),

            ],
          ),
        ),
      ) : Column(children: [
        Expanded(

          child: Container(
            padding: EdgeInsets.all(15),
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 15  );
                },
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: Provider.of<ListData>(context).getCartList().length,
                itemBuilder: (BuildContext context, int index) {
                  return CutomItemView(
                    name: Provider.of<ListData>(context)
                        .getCartList()[index]
                        .name,
                    image: Provider.of<ListData>(context)
                        .getCartList()[index]
                        .image,
                    count: Provider.of<ListData>(context)
                        .getCartList()[index]
                        .count,
                    price: Provider.of<ListData>(context)
                        .getCartList()[index]
                        .price,
                    onAdd: () {
                      print("provider clicked");

                      setState(
                            () {
                          print(
                              "${Provider.of<ListData>(context, listen: false).getCartList()[index].count}");
                          Provider.of<ListData>(context, listen: false)
                              .addItem(Provider.of<ListData>(context,
                              listen: false)
                              .getCartList()[index]);



                        },
                      );
                    },
                    onRemove: () {
                      setState(() {
                        Provider.of<ListData>(context, listen: false)
                            .remove(Provider.of<ListData>(context,
                            listen: false)
                            .getCartList()[index]);
                      });
                    },
                  );
                }),
          ),
        ),
        Container(
          color: Color.fromRGBO(246, 233, 218, 1),
          child: Column(
            children: [
              ListTile(

                trailing: Text(" \$${Provider.of<ListData>(context).subTotal}") ,
                leading: Text(" Sub Total") ,
              ),
              ElevatedButton(
                onPressed: (){

                }, child: const Text("Place Order"),
              )
            ]
          ),
        ),


      ]),
    );
  }
}
