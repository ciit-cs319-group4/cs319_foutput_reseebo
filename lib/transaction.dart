class Transaction {
  String _uid;
  double _amount;
  String _title;
  String _description;

  // Constructor
  Transaction({
    required String uid,
    required double amount,
    required String title,
    required String description,
  })  : _uid = uid,
        _amount = amount,
        _title = title,
        _description = description;

  // Getter for uid
  String get uid => _uid;

  // Setter for uid
  set uid(String uid) {
    _uid = uid;
  }

  // Getter for amount
  double get amount => _amount;

  // Setter for amount
  set amount(double amount) {
    if (amount >= 0) {
      _amount = amount;
    } else {
      throw ArgumentError("Amount cannot be negative");
    }
  }

  // Getter for title
  String get title => _title;

  // Setter for title
  set title(String title) {
    _title = title;
  }

  // Getter for description
  String get description => _description;

  // Setter for description
  set description(String description) {
    _description = description;
  }
}
