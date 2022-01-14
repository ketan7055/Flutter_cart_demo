import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_item_view.dart';
import '../data/ListData.dart';

class MainCourseListingScreen extends StatefulWidget {
  const MainCourseListingScreen({Key? key}) : super(key: key);

  @override
  _MainCourseListingScreenState createState() => _MainCourseListingScreenState();
}

class _MainCourseListingScreenState extends State<MainCourseListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 15  );
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: Provider.of<ListData>(context).getMainCourseList().length,
            itemBuilder: (BuildContext context, int index) {
              return CutomItemView(
                name: Provider.of<ListData>(context)
                    .getMainCourseList()[index]
                    .name,
                image: Provider.of<ListData>(context)
                    .getMainCourseList()[index]
                    .image,
                count: Provider.of<ListData>(context)
                    .getMainCourseList()[index]
                    .count,
                price: Provider.of<ListData>(context)
                    .getMainCourseList()[index]
                    .price,
                onAdd: () {
                  print("provider clicked");

                  setState(
                        () {
                      print(
                          "${Provider.of<ListData>(context, listen: false).getMainCourseList()[index].count}");
                      Provider.of<ListData>(context, listen: false)
                          .addItem(Provider.of<ListData>(context,
                          listen: false)
                          .getMainCourseList()[index]);
                    },
                  );
                },
                onRemove: () {
                  setState(() {
                    Provider.of<ListData>(context, listen: false)
                        .remove(Provider.of<ListData>(context,
                        listen: false)
                        .itmes[index]);
                  });
                },
              );
            })
    );
  }
}
