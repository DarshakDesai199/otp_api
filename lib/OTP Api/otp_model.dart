class OtpModel {
  String? clientKey;
  String? deviceType;
  String? mobile;
  String? user_id;

  OtpModel({this.clientKey, this.deviceType, this.mobile, this.user_id});

  OtpModel.fromJson(Map<String, dynamic> json) {
    clientKey = json['client_key'];
    deviceType = json['device_type'];
    mobile = json['mobile'];
    user_id = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_key'] = this.clientKey;
    data['device_type'] = this.deviceType;
    data['mobile'] = this.mobile;
    data['user_id'] = this.user_id;
    return data;
  }
}
