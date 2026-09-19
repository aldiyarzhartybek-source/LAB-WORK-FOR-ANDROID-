// TASK 1
void multiplicationTable() {
  for (int i = 1; i <= 10; i++) {
    for (int j = 1; j <= 10; j++) {
      print('$i * $j = ${i * j}');
    }
    print('');
  }
}

// TASK 2
bool isLeapYear(int year) {
  return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
}

int daysInMonth(int month, int year) {
  if (month == 4 || month == 6 || month == 9 || month == 11) {
    return 30;
  } else if (month == 2) {
    return isLeapYear(year) ? 29 : 28;
  } else {
    return 31;
  }
}

String nextDay({
  required int day,
  required int month,
  required int year,
}) {
  if (month < 1 || month > 12) return 'please write correct date';
  if (day < 1 || day > daysInMonth(month, year)) return 'please write correct date';

  day++;

  if (day > daysInMonth(month, year)) {
    day = 1;
    month++;
  }
  if (month > 12) {
    month = 1;
    year++;
  }

  String d = day.toString().padLeft(2, '0');
  String m = month.toString().padLeft(2, '0');
  return '$d.$m.$year';
}

// TASK 3
int countVowels(String text) {
  const String vowels = 'aeiou';
  int count = 0;
  String lower = text.toLowerCase();

  for (int i = 0; i < lower.length; i++) {
    if (vowels.contains(lower[i])) {
      count++;
    }
  }
  return count;
}

// TASK 4
void findMinMax(List<int> numbers) {
  int max = numbers[0];
  int min = numbers[0];

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > max) max = numbers[i];
    if (numbers[i] < min) min = numbers[i];
  }

  print('$numbers -> max: $max, min: $min');
}

// TASK 5
bool isPrime(int n) {
  if (n < 2) return false;

  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  // TASK 1
  multiplicationTable();

  // TASK 2
  print(nextDay(day: 5, month: 9, year: 2026));
  print(nextDay(day: 28, month: 2, year: 2024));
  print(nextDay(day: 28, month: 2, year: 2026));
  print(nextDay(day: 29, month: 2, year: 2026));
  print(nextDay(day: 28, month: 2, year: 2100));
  print(nextDay(day: 28, month: 2, year: 2000));
  print(nextDay(day: 30, month: 4, year: 2026));
  print(nextDay(day: 31, month: 12, year: 2025));
  print('');

  // TASK 3
  String text = 'flutter mobile development';
  print('$text -> ${countVowels(text)}');
  print('');

  // TASK 4
  findMinMax([14, 88, 3, 42, 99, 12, 67]);
  findMinMax([234, 34, 123, 44, 949, 112, 67]);
  print('');

  // TASK 5
  for (int n in [3, 6, 17, 25, 97]) {
    print('$n -> ${isPrime(n) ? "prime number" : "not prime number"}');
  }
}
