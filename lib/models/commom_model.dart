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

  UserApply({
    this.userId,
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

  String socialtype;
  Maintenance({
    this.userId,
    this.address,
    this.description,
    this.problemofphoto,
    this.contact,
    this.socialtype,
  });
  

  factory Maintenance.fromJson(Map<String, dynamic> json) => Maintenance(
      userId: json["UserId"],
      address: json["Address"],
      description: json["ProblemOfDescription"],
      problemofphoto: json["ProblemPhoto"],
      contact: json["ContactInfo"],
      socialtype: json["SocialType"]
      // social: json["City"],
      );

}

class UserMesseageList {
  int userId;
  int messageId;
  int toId;
  int senderId;
  String message;
  bool isActive;

  UserMesseageList(
      {this.userId,
      this.toId,
      this.senderId,
      this.message,
      this.messageId,
      this.isActive});

  factory UserMesseageList.fromJson(Map<String, dynamic> json) =>
      UserMesseageList(
        userId: json["userId"],
        toId: json["toId"],
        senderId: json["senderId"],
        message: json["message"],
        messageId: json["messageId"],
        isActive: json["is_active"],
      );
}
