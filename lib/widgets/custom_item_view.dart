import 'package:flutter/material.dart';

/**
 * List item widget.
 */
class CutomItemView extends StatelessWidget {
  CutomItemView({
    required this.name,
    required this.image,
    required this.count,
    required this.price,
    required this.onAdd,
    required this.onRemove,
  });
  final String name;
  final String image;
  final int count;
  final int price;
  Function onAdd;
  Function onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)), // Image border

            child: Image.asset(image,
                width: double.infinity, height: 200, fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: SizedBox(
              width: 300.0,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          ListTile(
            leading: Text("Price: \$${price.toDouble().toStringAsFixed(2)} "),
            title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              count == 0
                  ? ElevatedButton(
                      child: const Text("Add To Cart"),
                      onPressed: () {
                        onAdd();
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            onRemove();
                          },
                          child: const Icon(
                            Icons.remove,
                            size: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$count",
                        ),
                        GestureDetector(
                          onTap: () {
                            onAdd();
                          },
                          child: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
