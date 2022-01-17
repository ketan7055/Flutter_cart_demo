import 'package:cart/data/list_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_item_view.dart';

class DessertListingScreen extends StatefulWidget {
  const DessertListingScreen({Key? key}) : super(key: key);

  @override
  _DessertListingScreenState createState() => _DessertListingScreenState();
}

class _DessertListingScreenState extends State<DessertListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 15  );
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: Provider.of<ListData>(context).getDessertList().length,
            itemBuilder: (BuildContext context, int index) {
              return CutomItemView(
                name: Provider.of<ListData>(context)
                    .getDessertList()[index]
                    .name,
                image: Provider.of<ListData>(context)
                    .getDessertList()[index]
                    .image,
                count: Provider.of<ListData>(context)
                    .getDessertList()[index]
                    .count,
                price: Provider.of<ListData>(context)
                    .getDessertList()[index]
                    .price,
                onAdd: () {
                  setState(
                        () {
                      Provider.of<ListData>(context, listen: false)
                          .addItem(Provider.of<ListData>(context,
                          listen: false)
                          .getDessertList()[index]);

                    },
                  );
                },
                onRemove: () {
                  setState(() {
                    Provider.of<ListData>(context, listen: false)
                        .remove(Provider.of<ListData>(context,
                        listen: false)
                        .getDessertList()[index]);
                  });
                },
              );
            })
    );
  }
}
