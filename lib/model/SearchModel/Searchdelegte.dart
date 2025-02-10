
import 'package:flutter/material.dart';
import 'package:lazashopping/model/ProductModel/product.dart';
import 'package:lazashopping/model/SearchModel/searchmodel.dart';
import 'package:lazashopping/screens/detailsproduct.dart/info_screen.dart';
import 'package:lazashopping/services/searchServuces/searchservcies.dart';

class SearchScrean extends SearchDelegate {
  SearchScrean({required this.searchServces});
  final SearchServces searchServces;
  List<SearchModel> searchResults = [];

  Future<List<SearchModel>> getSearchResults(String query) async {
    return await searchServces.getProductTerm(query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
          searchResults.clear();
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    if (query.isEmpty) {
      return Center(child: Text("Write the name of a product"));
    }

    return FutureBuilder<List<SearchModel>>(
      future: getSearchResults(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error.toString()}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No results found"));
        }
// return BlocConsumer<SearchCubit,SearchState>(
// listener: (context,state){
// if(state is SearchFailure){
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));

// }
// },

// builder: (context,state){

//  if(state is SearchLoading){
//  return Center(child: CircularProgressIndicator());
// }else if(state is SearchSuccess){
// List<SearchModel> filteredResults = state.searchList
//             .where((product) => product.name!.toLowerCase().contains(query.toLowerCase()))
//             .toList();

// if (filteredResults.isEmpty) {
//           return Center(child: Text("No results found"));
//         }

//         return ListView.builder(
//           itemCount: filteredResults.length,
//           itemBuilder: (context, index) {
//             final product = filteredResults[index];
//             final Product productToPass = Product(
//               id: product.id, 
//  );

//             return ListTile(
//               title: Text(product.name ?? "Unknown"),
//               subtitle: Text("${product.price ?? 0} EGP"),
//               onTap: () {
                

//  Navigator.pushNamed(
//     context,
//     InfoCard.id, 
//     arguments: productToPass, 
//   );
//               },
//             );
//           },
//         );
//       }else{
//         return Text("search sometging");
//       }
// }


// );
List<SearchModel> filteredResults = snapshot.data!
            .where((product) => product.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
        
        return ListView.builder(
          itemCount: filteredResults.length,
          itemBuilder: (context, index) {
            final product = filteredResults[index];
            final Product productToPass = Product(
              id: product.id, 
 );

            return ListTile(
              title: Text(product.name ?? "Unknown"),
              subtitle: Text("${product.price ?? 0} EGP"),
              onTap: () {
                

 Navigator.pushNamed(
    context,
    InfoCard.id, 
    arguments: productToPass, 
  );
              },
            );
          },
        );
      }
    ); 
  }
  
}
