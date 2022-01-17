import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_item_view.dart';
import '../data/list_data.dart';

class MainCourseListingScreen extends StatefulWidget {
  const MainCourseListingScreen({Key? key}) : super(key: key);

  @override
  _MainCourseListingScreenState createState() => _MainCourseListingScreenState();
}

class _MainCourseListingScreenState extends State<MainCourseListingScreen> {
  @override
  Widget build(BuildContext context) {
    var mList = Provider.of<ListData>(context)
        .getMainCourseList();
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
                name:mList[index]
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
