import 'package:bloc/bloc.dart';
import 'package:lazashopping/model/SearchModel/searchmodel.dart';
import 'package:lazashopping/services/searchServuces/searchservcies.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  
  SearchCubit(this.searchServces) : super(SearchInitial());
  final SearchServces searchServces;

void getSearchResult(String query)async{
  if(query .isEmpty){
    emit(SearchInitial());

  }
  emit(SearchLoading());
  try{

    
 
  final result=await searchServces.getProductTerm(query);
 
emit(SearchSuccess(result));

  }catch(e){
emit(SearchFailure(message: e.toString()));
  }
}



}
