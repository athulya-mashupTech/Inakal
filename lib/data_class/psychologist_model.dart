class PsychologistModel {
  String name;
  String location;
  String occupation;
  //String description;
  String imagePath;

  List<PsychologistModel> Psychologists;

  PsychologistModel({
    required this.name,
    required this.location,
    required this.occupation,
   // required this.description,
    required this.imagePath,
    this.Psychologists = const [],
  });

  @override
  String toString() {
    return 'PsychologistModel{name: $name, , occupation: $occupation, Psychologists: ${Psychologists.map((Psychologists) => Psychologists.name).join(', ')}}';
  }

  // Function to return a list of 5 sample users
  static List<PsychologistModel> getSamplePsychologists() {
    return [
      PsychologistModel(
        name: "DR Anaswar Krishna",
        location: "New York, USA",
        occupation: "Clinical Psychologist",
        imagePath: "assets/vectors/suriya2.webp",
      ),
      PsychologistModel(
        name: "DR Midhun Murali",
        location: "London, UK",
        occupation: "Clinical Psychologist",
        imagePath: "assets/vectors/suriya.jpeg",
        
      ),
      PsychologistModel(
        name: "DR Dora Biju",
        location: "Sydney, Australia",
        occupation: "Clinical Psychologist",
        imagePath: "assets/vectors/harsha1.jpg",
      ),
      PsychologistModel(
        name: "DR Athulya Ajayakumar",
        location: "stockholm, Sweden",
        occupation: "clinical Psychologist",
        imagePath: "assets/vectors/harsha2.jpg"
        
      ),
      PsychologistModel(
        name: "DR Sreenandha ",
        location: "Sydney, Australia",
        occupation: "clinical Psychologist",
        imagePath: "assets/vectors/harsha3.jpg"
        
      ),
      PsychologistModel(
        name: "DR Aswathy Achu",
        location: "Incheon, South Korea",
        occupation: "clinical Psychologist",
        imagePath: "assets/vectors/harsha4.jpg"
        
      ),
      PsychologistModel(
        name: "DR Chris Babu",
        location: "Delhi, India",
        occupation: "clinical Psychologist",
        imagePath: "assets/vectors/vicky.jpg"
        
      ),
    ];
  }
}
