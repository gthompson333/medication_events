class Nothing {
  Nothing._();
}

enum RequestAction { GET, POST, DELETE, PUT }

class RequestNotFoundException implements Exception {
  String reason;

  RequestNotFoundException(this.reason);
}
