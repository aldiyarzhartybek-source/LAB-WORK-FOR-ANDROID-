double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  double discount = promoCode == 'SAVE10' ? itemPrice * 0.10 : 0.0;
  double fee = deliveryFee ?? 500.0;
  double total = itemPrice - discount + fee;

  print('--- ORDER $orderId ---');
  print('Item price:    ${itemPrice.toStringAsFixed(2)} KZT');
  print('Promo code:    ${promoCode ?? "not used"}');
  print('Discount:      -${discount.toStringAsFixed(2)} KZT');
  print('Delivery fee:  ${fee.toStringAsFixed(2)} KZT');
  print('TOTAL:         ${total.toStringAsFixed(2)} KZT');

  return total;
}

void main() {
  processOrder(orderId: 'A-1001', itemPrice: 12000.0, promoCode: 'SAVE10');

  print('');
  processOrder(orderId: 'A-1002', itemPrice: 12000.0);

  print('');
  processOrder(
    orderId: 'A-1003',
    itemPrice: 12000.0,
    promoCode: 'SAVE10',
    deliveryFee: 0.0,
  );
}
