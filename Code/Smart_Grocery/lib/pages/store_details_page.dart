

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:smart_grocery/store/store.dart';


class StoreDetailsPage extends StatelessWidget {
  final Store store;
  final Function() onPressed;

  const StoreDetailsPage({super.key, required this.onPressed, required this.store});

  @override
  Widget build(BuildContext context) {

    final List<List<String>> ingredientLists = [
      ['Whole Wheat Bread', 'Peanut Butter', 'Grape Jelly', 'Bananas', 'Almond Milk', 'Green Tea', 'Honey', 'Oats', 'Yogurt', 'Almonds', 'Dark Chocolate', 'Granola', 'Apples', 'Oranges', 'Blueberries'],
      ['Spaghetti', 'Tomato Sauce', 'Parmesan Cheese', 'Olive Oil', 'Garlic', 'Basil', 'Oregano', 'Ground Beef', 'Red Wine', 'Mushrooms', 'Onions', 'Bell Peppers', 'Zucchini', 'Spinach', 'Cherry Tomatoes'],
      ['Basmati Rice', 'Cumin Seeds', 'Green Peas', 'Chicken Thighs', 'Turmeric', 'Ginger', 'Coconut Milk', 'Lime', 'Cilantro', 'Chili Powder', 'Yogurt', 'Naan Bread', 'Eggplant', 'Cauliflower', 'Green Beans'],
      ['Cheddar Cheese', 'Sliced Ham', 'Sandwich Bread', 'Tomatoes', 'Lettuce', 'Mayonnaise', 'Mustard', 'Pickles', 'Avocado', 'Turkey Breast', 'Bacon', 'Swiss Cheese', 'Rye Bread', 'Apple Cider Vinegar', 'Olives'],
      ['Chicken Breast', 'BBQ Sauce', 'Corn on the Cob', 'Baked Beans', 'Coleslaw Mix', 'Ranch Dressing', 'Potato Chips', 'Lemonade', 'Watermelon', 'Ice Cream', 'Brown Sugar', 'Paprika', 'Garlic Powder', 'Black Pepper', 'Sea Salt'],
      ['Salmon Fillets', 'Lemon', 'Fresh Dill', 'Asparagus', 'Sweet Potatoes', 'Butter', 'Garlic', 'White Wine', 'Parsley', 'Capers', 'Quinoa', 'Arugula', 'Cherry Tomatoes', 'Cucumber', 'Feta Cheese'],
      ['Mixed Greens', 'Cherry Tomatoes', 'Balsamic Vinaigrette', 'Cucumbers', 'Red Onions', 'Feta Cheese', 'Kalamata Olives', 'Croutons', 'Chicken Strips', 'Hard Boiled Eggs', 'Avocado', 'Blue Cheese', 'Walnuts', 'Strawberries', 'Mandarin Oranges'],
      ['Ground Beef', 'Taco Shells', 'Salsa', 'Cheddar Cheese', 'Sour Cream', 'Lettuce', 'Tomatoes', 'Avocado', 'Black Beans', 'Corn', 'Cilantro', 'Lime', 'Jalapenos', 'Red Onion', 'Tortilla Chips'],
      ['Greek Yogurt', 'Granola', 'Fresh Berries', 'Honey', 'Almond Butter', 'Chia Seeds', 'Flaxseed', 'Bananas', 'Apples', 'Oranges', 'Kiwis', 'Mango', 'Pineapple', 'Coconut Flakes', 'Almond Milk'],
      ['Eggs', 'Bacon', 'Hash Browns', 'Sausage Links', 'Orange Juice', 'Coffee Beans', 'Bagels', 'Cream Cheese', 'Avocado', 'Tomatoes', 'Spinach', 'Mushrooms', 'Cheddar Cheese', 'Salsa', 'Greek Yogurt'],
      // Add more lists as needed
    ];
    final random = Random();
    final List<String> ingredients = ingredientLists[random.nextInt(ingredientLists.length)];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(store.name),
      ),
      body: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.food_bank_outlined, color: Colors.orangeAccent,), // Placeholder for ingredient icon
            title: Text(ingredients[index]),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart, color: Colors.teal),
              onPressed: () {
                // Show SnackBar when added to cart
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${ingredients[index]} added to cart'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,

        onPressed: onPressed,
        child: Icon(Icons.directions ),
      ),
    );
  }
}
