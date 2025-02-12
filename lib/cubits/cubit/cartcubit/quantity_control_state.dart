
part of 'quantity_control_cubit.dart';

@immutable
sealed class QuantityControlState {
  final int quantity;
  const QuantityControlState(this.quantity);
}

final class QuantityControlInitial extends QuantityControlState {
  const QuantityControlInitial() : super(1);
}

final class QuantityUpdated extends QuantityControlState {
  const QuantityUpdated(int quantity) : super(quantity);
}
