class Item {

  late final int? _ingredient_id;
  late final String? _name;

  late final int? _cost ;
  late int? totalAvail ;
  late final bool? _onSale;

  Item (this._cost, this._onSale) ;

  int? get cost => _cost;

  bool? get onSale => _onSale;
}