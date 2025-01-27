class User {
  final String image;
  final String status;
  final String name;
  final String location;
  final String description;
  final String age;
  final String height;
  final String religion;
  final String role;
  final String req_status;
  final String email;
  final String phoneNumber;
  final List<User> friends;

  User({
    required this.image,
    required this.status,
    required this.name,
    required this.location,
    required this.description,
    required this.age,
    required this.height,
    required this.religion,
    required this.role,
    required this.req_status,
    required this.email,
    required this.phoneNumber,
    this.friends = const [],
  });

  @override
  String toString() {
    return 'User{name: $name, description: $description, role: $role, status: $status, age: $age, height: $height, religion: $religion, req_status: $req_status, email: $email, phoneNumber: $phoneNumber, friends: $friends}';
  }

  // Function to return a list of 5 sample users
  static List<User> getSampleUsers() {
    return [
      User(
        name: "Suriya Sivakumar",
        image: "assets/vectors/suriya.png",
        location: "New York, USA",
        description:
            "Software engineer with a passion for mobile applications.",
        role: "Software Engineer",
        status: "Single",
        age: "28",
        height: "6'6\"",
        religion: "Latin Catholic",
        req_status: "Accepted",
        email: "",
        phoneNumber: "",
      ),
      User(
        name: "Tovino Thomas",
        image: "assets/vectors/tovi.png",
        location: "Kochi, Kerala",
        description:
            "Software engineer with a passion for mobile applications.",
        role: "Senior iOS Developer",
        status: "Single",
        age: "28",
        height: "6'8\"",
        religion: "Roman Catholic",
        req_status: "Rejected",
        email: "",
        phoneNumber: "",
      ),
      User(
        name: "Shahid Kapoor",
        image: "assets/vectors/shahid.png",
        location: "Bathinda, Punjab",
        description:
            "Software engineer with a passion for mobile applications.",
        role: "Leading film actor",
        status: "Single",
        age: "32",
        height: "6'6\"",
        religion: "Hindu",
        req_status: "Pending",
        email: "",
        phoneNumber: "",
      ),
      User(
        name: "Shahid Kapoor",
        image: "assets/vectors/shahid.png",
        location: "Bathinda, Punjab",
        description:
            "Software engineer with a passion for mobile applications.",
        role: "Leading film actor",
        status: "Single",
        age: "32",
        height: "6'6\"",
        religion: "Hindu",
        req_status: "Pending",
        email: "",
        phoneNumber: "",
      ),
      User(
        name: "Tovino Thomas",
        image: "assets/vectors/tovi.png",
        location: "Kochi, Kerala",
        description:
            "Software engineer with a passion for mobile applications.",
        role: "Senior iOS Developer",
        status: "Single",
        age: "28",
        height: "6'8\"",
        religion: "Roman Catholic",
        req_status: "Rejected",
        email: "",
        phoneNumber: "",
      ),
      User(
        name: "Tovino Thomas",
        image: "assets/vectors/tovi.png",
        location: "Kochi, Kerala",
        description:
            "Software engineer with a passion for mobile applications.",
        role: "Senior iOS Developer",
        status: "Single",
        age: "28",
        height: "6'8\"",
        religion: "Roman Catholic",
        req_status: "Rejected",
        email: "",
        phoneNumber: "",
      ),
    ];
  }

  static List<User> getReceivedReqUsers() {
    return [
      User(
        name: "Suriya Sivakumar",
        image: "assets/vectors/suriya.png",
        location: "New York, USA",
        description:
            "Software engineer with a passion for mobile applications.",
        role: "Software Engineer",
        status: "Single",
        age: "28",
        height: "6'6\"",
        religion: "Latin Catholic",
        req_status: "Accepted",
        email: "",
        phoneNumber: "",
      ),
      User(
        name: "Shahid Kapoor",
        image: "assets/vectors/shahid.png",
        location: "Bathinda, Punjab",
        description:
            "Software engineer with a passion for mobile applications.",
        role: "Leading film actor",
        status: "Single",
        age: "32",
        height: "6'6\"",
        religion: "Hindu",
        req_status: "Pending",
        email: "",
        phoneNumber: "",
      ),
    ];
  }
}
