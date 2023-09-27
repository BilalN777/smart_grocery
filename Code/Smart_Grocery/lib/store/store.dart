import 'dart:collection';

import '../food/item.dart';
import '../user/user.dart';

class Store extends User {
  late int numItems ;
  late HashMap<Item, int>? items ;
  late String? location ;
  late int? _paymentInfo ;

  Store (String name , this.location, int phone ){
    this.name = name ;
    this.phone  = phone ;
    numItems = 0 ;
  }

  void completeTransaction () {
    return ;
  }

  void removeItem(Item i){
    items?.remove(i) ;
  }

  void addItem(Item i){
    if (items!.containsKey(i)){
      items?[i] = items![i]! + 1 ;
    } else {
      items?[i] = 1 ;
    }
    numItems = items!.length ;
  }

  int? get paymentInfo => _paymentInfo;
}