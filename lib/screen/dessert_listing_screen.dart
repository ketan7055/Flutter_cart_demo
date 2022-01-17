import 'package:cart/data/meal_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/meal_custom_item_view.dart';

class DessertListingScreen extends StatefulWidget {
  const DessertListingScreen({Key? key}) : super(key: key);

  @override
  _DessertListingScreenState createState() => _DessertListingScreenState();
}


class _DessertListingScreenState extends State<DessertListingScreen> {

  @override
  Widget build(BuildContext context) {
    var mList = Provider.of<ListData>(context).getDessertList();
    return Container(
      margin: const EdgeInsets.all(10),
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 15  );
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: mList.length,
            itemBuilder: (BuildContext context, int index) {
              return CutomItemView(
                name: mList[index]
                    .name,
                image: mList[index]
                    .image,
                count: mList[index]
                    .count,
                price: mList[index]
                    .price,
                onAdd: () {
                  setState(() {
                      Provider.of<ListData>(context, listen: false)
                          .addItem(mList[index]);
                    },
                  );
                },
                onRemove: () {
                  setState(() {
                    Provider.of<ListData>(context, listen: false)
                        .remove(mList[index]);
                  });
                },
              );
            })
    );
  }
}
