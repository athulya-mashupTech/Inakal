class User {
  String name;
  String location;
  String description;
  String occupation;
  int age;
  String email;
  String phoneNumber;
  List<User> friends;

  User({
    required this.name,
    required this.location,
    required this.description,
    required this.occupation,
    required this.age,
    required this.email,
    required this.phoneNumber,
    this.friends = const [],
  });

  @override
  String toString() {
    return 'User{name: $name, description: $description, occupation: $occupation, age: $age, email: $email, phoneNumber: $phoneNumber, friends: ${friends.map((friend) => friend.name).join(', ')}}';
  }

  // Function to return a list of 5 sample users
  static List<User> getSampleUsers() {
    return [
      User(
        name: "John Doe",
        location: "New York, USA",
        description: "Software developer with a passion for building mobile apps.",
        occupation: "Software Developer",
        age: 29,
        email: "johndoe@example.com",
        phoneNumber: "123-456-7890",
      ),
      User(
        name: "Jane Smith",
        location: "London, UK",
        description: "Graphic designer with a love for illustrations.",
        occupation: "Graphic Designer",
        age: 32,
        email: "janesmith@example.com",
        phoneNumber: "098-765-4321",
      ),
      User(
        name: "Alice Johnson",
        location: "Sydney, Australia",
        description: "Marketing expert with a focus on digital strategies.",
        occupation: "Marketing Specialist",
        age: 25,
        email: "alicejohnson@example.com",
        phoneNumber: "112-233-4455",
      ),
    ];
  }
}
