class ListItem {
  String name;
  String ID;
  String image;
  int count;
  int price;
  CATEGORY_TYPE type;


  ListItem(
      {required this.name,
      required this.ID,
      required this.image,
      required this.count,
      required this.price,
        required this.type
      });



}
enum CATEGORY_TYPE {
  MAIN_COURSE,
  DISERT
}