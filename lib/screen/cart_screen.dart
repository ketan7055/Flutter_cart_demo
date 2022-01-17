
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_item_view.dart';
import '../data/list_data.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(247, 246, 242, 1),

      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Provider.of<ListData>(context).getCartList().isEmpty ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        const Icon(
          Icons.shopping_cart,
          size: 70,
        ),

            const Text("Your cart is empty."
            , style: TextStyle(fontSize: 20),),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed:(){
                  Navigator.pop(context);
            },child: const Text("Start Shopping")),

          ],
        ),
      ) : Column(children: [
        Expanded(

          child: Container(
            padding: const EdgeInsets.all(15),
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 15  );
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
                      setState(() {
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
          color: const Color.fromRGBO(246, 233, 218, 1),
          child: Column(
            children: [
              ListTile(
                trailing: Text(" \$${Provider.of<ListData>(context).subTotal.toStringAsFixed(2)}") ,
                leading: const Text(" Subtotal") ,
              ),
              ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("In Progress.")));
                }, child: const Text("Place Order"),
              )
            ]
          ),
        ),


      ]),
    );
  }
}
