import 'package:bloc/bloc.dart';
import 'package:lazashopping/services/payment/payment_auth.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  Future<void> startPayment(
      {required String fName,
      required String lName,
      required String phone,
      required String email,
      required double totalOrder}) async {
    try {
      emit(PaymentLoading());
      String? authToken = await PaymentAuthServices().getPaymentAuthToken();
      if (authToken == null) return;

      int? orderId = await PaymentAuthServices().getPaymentOrderId(totalOrder);
      if (orderId == null) return;

      String? requestToken =
          await PaymentAuthServices().getPaymentRequestTokenCard(
        fName,
        lName,
        email,
        phone,
        totalOrder,
      );
      if (requestToken == null) return;

      String paymentUrl =
          "https://accept.paymob.com/api/acceptance/iframes/901865?payment_token=$requestToken";
      emit(PaymentSuccess(paymentUrl));
    } catch (e) {
      emit(PaymentFailure(message: e.toString()));
    }
  }
}
