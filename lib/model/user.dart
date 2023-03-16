final String tableUser = "users";

//5 minuti e 30 


class UserFields {
  static final String id= '_id';
  static final String password= "password";
  static final String username= "username";
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
}