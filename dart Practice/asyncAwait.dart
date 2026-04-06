import 'dart:async';

// Simulating async operations
Future<String> fetchUserName(int id) async {

  // Simulate network delay
  await Future.delayed(Duration(seconds: 2));
  
  if (id == 1) {
    return "Alice";
  } else if (id == 2) {
    return "Bob";
  } else {
    throw Exception("User not found");
  }
}

// Async function with error handling
Future<void> loadUserData(int userId) async {
  try {
    print("Loading user data for ID: $userId");
    
    String name = await fetchUserName(userId);
    print("User name: $name");
    
    print("User data loaded successfully!");
  } catch (e) {
    print("Error loading user data: $e");
  }
}

void main() async {
  print("=== Async/Await Demo ===");
  await loadUserData(2);
}