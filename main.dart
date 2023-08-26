abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  // Abstract method
  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    balance -= amount;
    balance += balance * interestRate;
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
    } else {
      print("Insufficient funds for withdrawal.");
    }
  }
}

void main() {
  // Create an instance of SavingsAccount
  SavingsAccount savings = SavingsAccount(101, 1000, 0.05);
  print("Savings Account Balance: ${savings.balance}");

  savings.deposit(500);
  print("After deposit: ${savings.balance}");

  savings.withdraw(300);
  print("After withdrawal: ${savings.balance}");

  // Create an instance of CurrentAccount
  CurrentAccount current = CurrentAccount(201, 2000, 1000);
  print("Current Account Balance: ${current.balance}");

  current.deposit(800);
  print("After deposit: ${current.balance}");

  current.withdraw(2500);
  print("After withdrawal: ${current.balance}");
}
