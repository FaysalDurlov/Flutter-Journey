import 'dart:async';

// Simulating async operations
Future<String> fetchUserName(int id) {

  return Future.delayed(Duration(seconds: 2), () {
    if (id == 1) {
      return "Alice";
    } else if (id == 2) {
      return "Bob";
    } else {
      throw Exception("User not found");
    }
  });

}

// Using then() instead of async/await
Future<void> loadUserData(int userId) {
  print("Loading user data for ID: $userId");

  return fetchUserName(userId).then((name) {
    print("User name: $name");
    print("User data loaded successfully!");
  }).catchError((e) {
    print("Error loading user data: $e");
  });
}

void main() {
  print("=== Async/Await Demo ===");
  
  loadUserData(2).then((_) {
    print("Done");
  });
}