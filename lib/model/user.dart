final String tableUser = "users";

//5 minuti e 30 


class UserFields {
  static final List<String> values = [
    id, password , username , created , liked
  ];


  static final String id= '_id';
  static final String password= "password";
  static final String username= "username";
  //valutare se farli booleani
  static final String created= "created";
  static final String liked= "liked";
}

class User {
  final int id;
  final String password;
  final String username;
  final List<int>? created;
  final List<int>? liked;

  const User({
    required this.id,
    required this.password,
    required this.username,
    this.created,
    this.liked
  });

  static User fromJson(Map<String, Object?> json) => User(
    id : json[UserFields.id] as int,
    password: json[UserFields.password] as String,
    username: json[UserFields.username] as String,
    created: json[UserFields.created] as List<int>,
    liked: json[UserFields.liked] as List<int>,
  );

   Map<String, Object?> toJson()=> {
    UserFields.id: id,
    UserFields.password: password,
    UserFields.username: username,
    UserFields.created: created,
    UserFields.liked: liked,
  };
  User copy({
    int? id,
    String? password,
    String? username,
    List <int>? created,
    List <int>? liked,
  }) => 
      User (
        id: id ?? this.id,
        password: password ?? this.password,
        username: username ?? this.username,
        created: created ?? this.created,
        liked: liked ?? this.liked,
      );
}