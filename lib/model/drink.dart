final String tableDrink = "drinks";


class DrinkFields {
  static final List<String> values = [
    id, name , description , recipe

  ];

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

  static Drink fromJson(Map<String, Object?> json) => Drink(
    id : json[DrinkFields.id] as int?,
    name: json[DrinkFields.name] as String,
    description: json[DrinkFields.description] as String,
    recipe: json[DrinkFields.recipe] as List<String>,
  );

  Map<String, Object?> toJson()=> {
    DrinkFields.id: id,
    DrinkFields.name: name,
    DrinkFields.description: description,
    DrinkFields.recipe: recipe
  };
  Drink copy({
    int? id,
    String? name,
    String? description,
    List <String>? recipe,
  }) => 
      Drink(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        recipe: recipe ?? this.recipe,
      );
}
