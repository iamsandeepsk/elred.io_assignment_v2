class UploadProfileModel {
  bool success;
  bool isAuth;
  String message;
  List<Result> result;

  UploadProfileModel({
    required this.success,
    required this.isAuth,
    required this.message,
    required this.result,
  });

  factory UploadProfileModel.fromJson(Map<String, dynamic> json) =>
      UploadProfileModel(
        success: json["success"],
        isAuth: json["isAuth"],
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "isAuth": isAuth,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  String uid;
  String profileBannerImageUrl;

  Result({
    required this.uid,
    required this.profileBannerImageUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uid: json["uid"],
        profileBannerImageUrl: json["profileBannerImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "profileBannerImageURL": profileBannerImageUrl,
      };
}
