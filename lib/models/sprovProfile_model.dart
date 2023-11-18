class GeneralInformation {
  String name;
  String location;
  String email;
  String password;
  String phone;

  GeneralInformation({
    required this.name,
    this.location = '',
    required this.email,
    required this.password,
    this.phone = '',
  });

  factory GeneralInformation.fromJson(Map<String, dynamic> json) {
    return GeneralInformation(
      name: json['name'],
      location: json['location'] ?? '',
      email: json['email'],
      password: json['password'],
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}

class ContactInformation {
  String website;
  String linkedin;

  ContactInformation({
    this.website = '',
    this.linkedin = '',
  });

  factory ContactInformation.fromJson(Map<String, dynamic> json) {
    return ContactInformation(
      website: json['website'] ?? '',
      linkedin: json['linkedin'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'website': website,
      'linkedin': linkedin,
    };
  }
}

class User {
  String headerImage;
  GeneralInformation generalInformation;
  List<String> skills;
  List<String> notableCases;
  List<String> education;
  List<String> awardsAndRecognitions;
  ContactInformation contactInformation;
  DateTime created;

  User({
    required this.headerImage,
    required this.generalInformation,
    required this.skills,
    required this.notableCases,
    required this.education,
    this.awardsAndRecognitions = const [],
    required this.contactInformation,
    required this.created,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      headerImage: json['headerImage'],
      generalInformation: GeneralInformation.fromJson(json['generalInformation']),
      skills: List<String>.from(json['skills']),
      notableCases: List<String>.from(json['notableCases']),
      education: List<String>.from(json['education']),
      awardsAndRecognitions: List<String>.from(json['awardsAndRecognitions'] ?? []),
      contactInformation: ContactInformation.fromJson(json['contactInformation']),
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'headerImage': headerImage,
      'generalInformation': generalInformation.toJson(),
      'skills': skills,
      'notableCases': notableCases,
      'education': education,
      'awardsAndRecognitions': awardsAndRecognitions,
      'contactInformation': contactInformation.toJson(),
      'created': created.toIso8601String(),
    };
  }
}
