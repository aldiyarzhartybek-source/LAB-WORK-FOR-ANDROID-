void checkBalance({
  required String name, required double balance
  }) => print('$name, your available balance: ${balance.toStringAsFixed(2)} KZT');

double deposit({
  required double currentBalance, double? amount}
  )
   {
  double value = amount ?? 0.0;

  if (value <= 0) {
    print('Deposit declined: amount must be greater than zero');
    return currentBalance;
  }

  double newBalance = currentBalance + value;
  print('Deposit accepted: +${value.toStringAsFixed(2)} KZT');
  print('New balance: ${newBalance.toStringAsFixed(2)} KZT');
  return newBalance;
}

double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  const int correctPin = 1234;

  if ((pinCode ?? 0) != correctPin) {
    print('$name, transaction declined: wrong or missing PIN code');
    return currentBalance;
  }

  double value = amount ?? 0.0;

  if (value <= 0) {
    print('$name, transaction declined: amount must be greater than zero');
    return currentBalance;
  }

  if (value > currentBalance) {
    print('$name, transaction declined: insufficient funds');
    print('Requested ${value.toStringAsFixed(2)} KZT, '
        'available ${currentBalance.toStringAsFixed(2)} KZT');
    return currentBalance;
  }

  double newBalance = currentBalance - value;
  print('$name, withdrawal successful: -${value.toStringAsFixed(2)} KZT');
  print('New balance: ${newBalance.toStringAsFixed(2)} KZT');
  return newBalance;
}

void main() {
  String name = 'Aldiyar';
  double balance = 50000.0;

  checkBalance(name: name, balance: balance);

  print('');
  balance = deposit(currentBalance: balance, amount: 15000.0);

  print('');
  balance = deposit(currentBalance: balance);

  print('');
  balance = withdraw(
    name: name,
    currentBalance: balance,
    amount: 10000.0,
    pinCode: 1234,
  );

  print('');
  balance = withdraw(
    name: name,
    currentBalance: balance,
    amount: 10000.0,
    pinCode: 9999,
  );

  print('');
  balance = withdraw(
    name: name,
    currentBalance: balance,
    amount: 999999.0,
    pinCode: 1234,
  );

  print('');
  checkBalance(name: name, balance: balance);
}
