class UserApply {
  int userId;
  String applyFor;
  String fullLegalName;
  String indigenonus;
  String address;
  String city;
  String postalCode;
  String phoneNumber;
  String email;
  String dependents;
  String housingNeed;
  
  UserApply(
      {this.userId,
      this.applyFor,
      this.fullLegalName,
      this.indigenonus,
      this.address,
      this.city,
      this.postalCode,
      this.phoneNumber,
      this.email,
      this.dependents,
      this.housingNeed,
      
      });
  factory UserApply.fromJson(Map<String, dynamic> json) => UserApply(
        userId: json["UserId"],
        applyFor: json["ApplyFor"],
        fullLegalName: json["FullLegalName"],
        indigenonus: json["Indigenonus"],
        address: json["Address"],
        city: json["City"],
        postalCode: json["PostalCode"],
        phoneNumber: json["PhoneNumber"],
        email: json["Email"],
        dependents: json["NumberOfDependents"],
        housingNeed: json["HousingNeed"],
       
      );
}

class Maintenance {
  int userId;
  String address;
  String description;
  String problemofphoto;
  String contact;

  String social;

  Maintenance({
    this.userId,
    this.address,
    this.description,
    this.problemofphoto,
    this.contact,
    this.social,
  });
  factory Maintenance.fromJson(Map<String, dynamic> json) => Maintenance(
        userId: json["UserId"],
        address: json["Address"],
        description: json["ProblemOfDescription"],
        problemofphoto: json["ProblemPhoto"],
        contact: json["ContactInfo"],
        // social: json["City"],
       
       
      );
}
