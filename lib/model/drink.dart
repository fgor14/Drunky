final String tableDrink = "drinks";


class DrinkFields {
  static final String id= '_id';
  static final String name= "name";
  static final String description= "description";
  static final String recipe= "recipe";
}

class Drink {
  final int? id;
  final String name;
  final String description;
  final List <String> recipe;
  //Valutare se inserire un bool per community drink

  const Drink({
    this.id,
    required this.name,
    required this.description,
    required this.recipe,
  });
}
