class ItemData {
  String name;
  String ID;
  String image;
  int count;
  int price;
  CATEGORY_TYPE type;

  ItemData(
      {required this.name,
      required this.ID,
      required this.image,
      required this.count,
      required this.price,
        required this.type
      });
}

/**
 * enum class for type.
 */
enum CATEGORY_TYPE {
  MAIN_COURSE,
  DESSERT
}