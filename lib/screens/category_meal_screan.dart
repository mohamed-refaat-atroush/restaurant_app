import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/dummy_data.dart';
import 'package:restaurant_app/widget/mealItem.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/categorymeal';
  @override
  Widget build(BuildContext context) {
    final categoryArguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    var categoryId = categoryArguments['id'];
    final categoryTitle = categoryArguments['title'];
    final mealsList = Provider.of<Dummy>(context).DUMMY_MEALS;
    final selectedMeals =
        mealsList.where((meal) => meal.categories.contains(categoryId));

    print(selectedMeals);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView(
        children: selectedMeals
            .map((e) => MealItem(
                  item: e,
                ))
            .toList(),
      ),
    );
  }
}
