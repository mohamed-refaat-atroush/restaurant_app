import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/dummy_data.dart';
import 'package:restaurant_app/models/meal.dart';
import 'package:restaurant_app/widget/mealItem.dart';

// ignore: must_be_immutable
class Favourite extends StatelessWidget with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    final mealsList = Provider.of<Dummy>(context).DUMMY_MEALS;

    final favoritMeal = mealsList.where((element) => element.id.contains('m'));
    print(favoritMeal);
    return ListView(
      children: mealsList
          .map((e) => MealItem(
                item: e,
              ))
          .toList(),
    );
  }
}
