import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculate_total_state.dart';

class CalculateTotalCubit extends Cubit<CalculateTotalState> {
  CalculateTotalCubit() : super(CalculateTotalInitial());

 


  void updateTotal(List<dynamic> updatedItems) {
        List<dynamic> items;

    items = updatedItems;  // تحديث قائمة العناصر عند كل استدعاء
    double subTotal = items.fold(0, (sum, item) => sum + ((item["Price"] ?? 0) * (item["Quantity"] ?? 1)));

    double shippingCost = 10.0;
    double total = subTotal + shippingCost;

    emit(CalculateTotalSuccess(subTotal, total));
  }
}



