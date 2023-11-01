class Ingredient{

  String? name;
  String? ingredient_id;
  int? cost;
  double? qty_available;


  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'ingredient_id':ingredient_id,
      'cost': cost,
      'inventory_qty': qty_available
    };
  }

  Ingredient({
    required this.name,
    required this.ingredient_id,
    required this.cost,
    required this.qty_available,
  });


  factory Ingredient.fromMap(Map<String, dynamic> map){
    return Ingredient(
        name: map['name'],
        ingredient_id: map['ingredient_id'],
        cost: map['cost'],
        qty_available: map['qty_available']
    );
  }

}