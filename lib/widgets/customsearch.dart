
import 'package:flutter/material.dart';

import 'package:lazashopping/model/SearchModel/Searchdelegte.dart';
import 'package:lazashopping/services/searchServuces/searchservcies.dart';
import 'package:lazashopping/widgets/customrecord.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    // final searchCubit=BlocProvider.of<SearchCubit>(context);

    SearchServces searchServces=SearchServces();
    
    return
        Row(
          children: [
            Expanded(
              child: TextField(
                onTap: () {
                                  showSearch(context: context,delegate:SearchScrean(searchServces:searchServces ));
 
                                },                controller: controller,
                autofocus: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Search..",
                  fillColor: Colors.grey.shade100,
                  filled: true,
        
        
                ),
        
        
              ),
            ),
            CustomRecord()
          ],
        );
  }
}
    
    
