import 'package:smart_grocery/food/recipe.dart';
import 'package:smart_grocery/user/user.dart';

class RegularUser extends User{
  late String location ;
  int? _paymentInfo ;
  late List<String> _foodPreferences ;

  RegularUser(String name , String email, this.location ,  List<String> foodPreferences) {
    newUser() ;
    this.name = name ;
    this.email = email ;
    _foodPreferences= foodPreferences ;
    id = userCount ;
  }

  RegularUser.guest() {
    newUser();
    name = 'Guest_$id';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'location': location,
      'foodPreferences': _foodPreferences.join(','),
      'paymentInfo': _paymentInfo
    };
  }


  static RegularUser fromMap(Map<String, dynamic> map) {
    return RegularUser(
        map['name'],
        map['email'],
        map['location'],
        (map['foodPreferences'] as String).split(',')
    )..id = map['id']
      ..phone = map['phoneNumber']
      .._paymentInfo = map['paymentInfo'];
  }


  Recipe selectRecipe () {
    return Recipe.empty() ;
  }

  void postRecipe () {
    return;
  }

  List<String> completePurchase () {
    return <String>[] ;
  }

  int? get paymentInfo => _paymentInfo;
}