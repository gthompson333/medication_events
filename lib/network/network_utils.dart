class Nothing {
  Nothing._();
}

enum RequestAction { get, post, delete, put }

class RequestNotFoundException implements Exception {
  String reason;

  RequestNotFoundException(this.reason);
}
