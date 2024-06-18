

import 'package:breakfast/models/category_models.dart';
import 'package:breakfast/models/diet_model.dart';
import 'package:breakfast/models/popular_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];
  void _getCategories() {
    categories = CategoryModel.getCategories();
  }
  void _getDiets() {
    diets = DietModel.getDiets();
  }
  void _getPopularDiets() {
    popularDiets = PopularDietsModel.getPopularDiets();
  }
  void _getInitialInfor() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  void initState() {
    _getCategories();
  }


  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getInitialInfor();
    _getDiets();
    _getPopularDiets();
    return Scaffold (
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchField(),
            SizedBox(height:25 ,),
            Text('Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left:20,
                  right: 20
                ),
                separatorBuilder: (context, index) => SizedBox(width: 25,),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color:  categories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          child: Padding (
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(categories[index].iconPath),
                          )
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  );
            },
            ),
            ),
            SizedBox(height: 15,),
            Column(
              children: [
                Padding(padding: EdgeInsets.only(left:20),
                  child:Text('Recommendation\nFor Diet',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Container(
              height: 300,
              child: ListView.separated(itemBuilder: (context, index) {
                return Container(
                  width: 210,
                    decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(25)
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 140,
                        child: Image.asset(
                            diets[index].iconPath
                        ),
                      ),
                      Column(
                        children: [
                      Text(diets[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      ),
                      Text(
                        diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calories,
                        style: TextStyle(
                          color: Color(0xB69317F0),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ]
                      ),
                      Container(
                        height: 45,
                          width: 130,
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xEC0CD3DA),
                                Color(0xE4136DD5),
                              ]
                            ),
                                borderRadius: BorderRadius.circular(50)
                          ),
                      )
                    ],
                  ),
                );
              },
                  separatorBuilder: (context, index) => SizedBox(width: 25,),
                  itemCount: diets.length,
              scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20, right: 20,),
              ),
            ),
            SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding( padding: EdgeInsets.all(8.0),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    color:Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
                SizedBox(height:15,),
                ListView.separated(
                  itemCount: popularDiets.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index)  =>SizedBox(height: 25,),
                  padding: EdgeInsets.only(
                    left:20,
                    right:20,
                  ),
                  itemBuilder: (context, index) {
                      return Container(
                        height: 115,
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              height: 60,
                              child: Image.asset(
                                  popularDiets[index].iconPath
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(popularDiets[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                ),
                                Text(popularDiets[index].level + ' | ' + popularDiets[index].duration + '  | ' + popularDiets[index].calorie,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration (
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow (
                                color: Colors.black26,
                                offset: Offset(0,10),
                                blurRadius:40,
                              spreadRadius: 0,
                            )
                          ]

                        ),
                      );
                    },
                )
              ],
            )
          ],
        ),

      ),
    );
  }
}

AppBar appBar(){
  return AppBar(
    title: Text('Breakfast',
      style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    leading: Container(
      margin: EdgeInsets.all(10),
      child: Icon(Icons.arrow_back_ios),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
    ),
    actions: [
      Container(
        margin: EdgeInsets.all(10),
        child: Icon(Icons.more_vert),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    ],
  );
}

Container _searchField(){
  return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
            )
          ]
      ),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'Search PanCake',
            hintStyle: TextStyle(
              color: Colors.black12,
              fontSize: 16,
            ),
            prefixIcon: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.search),
            ),
            /*suffixIcon: Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(Icons.sort),
                ),*/
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black12,
                      indent: 10,
                      endIndent: 10,
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.sort),)
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
            )
        ),
      )
  ) ;
}

