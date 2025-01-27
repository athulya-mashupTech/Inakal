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
        name: " DR Anaswara V",
        location: "New York, USA",
        //description: "Clinical Psychologist",
        occupation: "Clinical Psychologist",
        imagePath: "assets/vectors/anaswara.jpeg",
      ),
      PsychologistModel(
        name: "DR Midhun Murali",
        location: "London, UK",
        //description: "Graphic designer with a love for illustrations.",
        occupation: "Clinical Psychologist",
        imagePath: "assets/vectors/midhun.jpeg",
        
      ),
      PsychologistModel(
        name: "DR Dony Baby",
        location: "Sydney, Australia",
        //description: "Marketing expert with a focus on digital strategies.",
        occupation: "Clinical Psychologist",
        imagePath: "assets/vectors/dony.jpeg",
      ),
      PsychologistModel(
        name: "DR Athulya Ajayakumar",
        location: "stockholm, Sweden",
        //description: "Graphic designer with a love for illustrations.",
        occupation: "clinical Psychologist",
        imagePath: "assets/vectors/ath.jpeg"
        
      ),
      PsychologistModel(
        name: "DR Sreenandha ",
        location: "Sydney, Australia",
        //description: "Graphic designer with a love for illustrations.",
        occupation: "clinical Psychologist",
        imagePath: "assets/vectors/sree.jpeg"
        
      ),
      PsychologistModel(
        name: "DR Aswin Vijay",
        location: "Incheon, South Korea",
        //description: "Graphic designer with a love for illustrations.",
        occupation: "clinical Psychologist",
        imagePath: "assets/vectors/aswin.jpeg"
        
      ),
      PsychologistModel(
        name: "DR Chrisna Babu",
        location: "Delhi, India",
        //description: "Graphic designer with a love for illustrations.",
        occupation: "clinical Psychologist",
        imagePath: "assets/vectors/chrisna.jpeg"
        
      ),
    ];
  }
}
