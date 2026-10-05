
class ApiErrorModel {
  final int statusCode;
  final String message;
  final String errors;

  ApiErrorModel(
      {required this.statusCode, required this.message, required this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    String message = '';

    json['errors'].forEach((key, value) {
      message += '$key:';
      value.forEach((hamada) {
        message += ' $hamada';
      });
    });

    return ApiErrorModel(
        statusCode: json['statusCode'],
        message: json['message'],
        errors: message);
  }
}