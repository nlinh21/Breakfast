import 'package:flutter/material.dart';
class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxColor,
    required this.viewIsSelected,
});
  static List<DietModel> getDiets() {
    List <DietModel> diets = [];

    diets.add(
      DietModel(
          name: 'Honey Pancake',
          iconPath: 'assets/icons/cake.png',
          level: 'Easy',
          duration: '30mins',
          calories: '180kCal',
          viewIsSelected: true,
          boxColor: Color(0xE50F9609)
       )
    );
    diets.add(
        DietModel(
            name: 'Canai Bread',
            iconPath: 'assets/icons/roti-canai.png',
            level: 'Easy',
            duration: '20mins',
            calories: '230kCal',
            viewIsSelected: false,
            boxColor: Colors.lightGreen
        )
    );
    return diets;
  }
}