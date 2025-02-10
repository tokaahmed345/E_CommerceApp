import 'package:flutter/material.dart';
import 'package:lazashopping/model/Categorymodel/categoryModel.dart';
import 'package:lazashopping/model/ProductModel/product.dart';
import 'package:lazashopping/screens/Category/categoryhome.dart';
import 'package:lazashopping/widgets/customhomecategory.dart';

class ListViewHomeCategory extends StatelessWidget {
const ListViewHomeCategory({super.key});
  @override
  Widget build(BuildContext context) {
    Product product=Product();
    final List<CategoryModel> category=[
CategoryModel(title: "Adidas", image: "assets/images/Adidas.png", id: "1"),
CategoryModel(title: "Nike", image: "assets/images/nike.jpg", id: "2"),
CategoryModel(title: "FILA", image: "assets/images/fila-9 1.jpg", id: "3"),
    ];
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context, CategoryHome.id,arguments:category[index].id);
          },
          child: CustomHomeCategory(title: category[index].title, img:category[index].image , id:category[index].id));
      }),
    );
  }
}