class Account {
  Account({required this.userId, required this.emailId, required this.token});

  final String userId;
  final String emailId;
  final String token;

  Map<String, String> get headers => {'Authorization': 'Bearer $token'};

  @override
  String toString() {
    return 'id $userId, $emailId';
  }
}
