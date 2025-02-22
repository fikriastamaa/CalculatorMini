class TotalSum {
  String calculate(List<int> numbers) {
    final totalSum = numbers.reduce((a, b) => a + b);
    return 'Jumlah Total: $totalSum';
  }
}
