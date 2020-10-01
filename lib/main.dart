import 'package:flutter/material.dart';
import 'package:restaurant_app/dummy_data.dart';
import 'package:restaurant_app/screens/tabs_screen.dart';
import 'screens/category_meal_screan.dart';
import 'package:provider/provider.dart';
import 'screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Dummy()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
        ),
        initialRoute: TabsScreen.routeName,
        routes: {
          TabsScreen.routeName: (context) => TabsScreen(),
          CategoryMealScreen.routeName: (context) => CategoryMealScreen(),
          MealDetailScreen.routeName: (context) => MealDetailScreen(),
        },
      ),
    );
  }
}
