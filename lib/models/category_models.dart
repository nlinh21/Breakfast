import 'package:flutter/material.dart';
class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
});
  static List<CategoryModel> getCategories () {
    List<CategoryModel> categories = [];
    
    categories.add(
      CategoryModel(
          name: 'Salad',
          iconPath: 'assets/icons/salad.png',
          boxColor: Color(0x667AAB2A)
      )
    );
    categories.add(
        CategoryModel(
            name: 'Cake',
            iconPath: 'assets/icons/pancakes.png',
            boxColor: Color(0x7FBD22FF)
        )
    );
    categories.add(
        CategoryModel(
            name: 'Pie',
            iconPath: 'assets/icons/pie.png',
            boxColor: Color(0x74D717FF)
        )
    );
    categories.add(
        CategoryModel(
            name: 'Smoothies',
            iconPath: 'assets/icons/chips.png',
            boxColor: Color(0x7FFF07FF)
        )
    );
    return categories;
  }
}