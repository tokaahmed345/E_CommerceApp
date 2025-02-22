import 'package:flutter/material.dart';
import 'package:lazashopping/view/screens/Category/customwidgets/custombodycard.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.products,  
  });

  final List<dynamic> products;
  @override
  Widget build(BuildContext context) {

    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate cross-axis count based on screen width
    int crossAxisCount = screenWidth > 600 ? 3 : 2; // 3 columns for tablets, 2 for phones

    // Adjust spacing and child aspect ratio dynamically
    double crossAxisSpacing = screenWidth * 0.02; // Reduced to 2% of screen width
    double mainAxisSpacing = screenWidth * 0.02; // Reduced to 2% of screen width
    double childAspectRatio = screenWidth > 600 ? 0.8 : 0.5; // Adjusted ratio for better fit

    return GridView.builder(
      
      itemCount: products.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(8.0), // Add padding around the grid
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return CustomCardContent(
          
          pro: products[index],);
      },
    );
  }
}
