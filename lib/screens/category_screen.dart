import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/dummy_data.dart';
import 'package:restaurant_app/screens/category_meal_screan.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: Provider.of<Dummy>(context)
          .DUMMY_CATEGORIES
          .map(
            (category) => Stack(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CategoryMealScreen.routeName, arguments: {
                      'id': category.id,
                      'title': category.title
                    });
                    print(category.id);
                  },
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              colors: [
                                category.color.withOpacity(.7),
                                category.color
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight))),
                ),
                Positioned(
                  child: Text(
                    category.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  right: 20,
                  bottom: 20,
                )
              ],
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10),
    );
  }
}
