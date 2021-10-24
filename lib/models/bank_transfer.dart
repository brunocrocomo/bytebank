class BankTransfer {
  final int accountNumber;
  final double value;

  BankTransfer(this.accountNumber, this.value);

  @override
  String toString() {
    return 'BankTransfer{accountNumber: $accountNumber, value: $value}';
  }
}
