import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quantity_control_state.dart';

class QuantityControlCubit extends Cubit<QuantityControlState> {
  QuantityControlCubit() : super(QuantityControlInitial());

  void increaseQuantity(){
emit(QuantityUpdated(state.quantity+1));


  }
    void decreaceQuantity(){
      if(state.quantity>1){
emit(QuantityUpdated(state.quantity-1));

      }


  }
}