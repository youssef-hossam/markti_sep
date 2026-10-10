class SignInResponseModel {

    final String accessToken;
    final String expiresAtUtc;
    final String refreshToken;
  
    SignInResponseModel({
      required this.accessToken,
      required this.expiresAtUtc,
      required this.refreshToken,
    });
  
    factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
      return SignInResponseModel(
        accessToken: json['accessToken'],
        expiresAtUtc: json['expiresAtUtc'],
        refreshToken: json['refreshToken'],
      );
    }
}
// {
//     "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzYTQzMGU1Yy1jNmU3LTQ3ZDUtNmZlZi0wOGRmMGU2N2U4ZWMiLCJqdGkiOiI1NDEwZDFlZi1lM2NmLTQ0MTQtODMyZS03MTFiYjY4NGI3ZTMiLCJlbWFpbCI6ImFiZGVscmFobWFuYWxpZWxnb2hhcnlAZ21haWwuY29tIiwibmFtZSI6IkFiZG8gQWxpIiwicm9sZXMiOiIiLCJwaWN0dXJlIjoiIiwiZXhwIjoxNzkxODU3MjA0LCJpc3MiOiJlc2hvcC5uZXQiLCJhdWQiOiJlc2hvcC5uZXQifQ.G4YSH5OW8T8DPbGp8PpHUHptRsVAU2HrAsqF9FsG0dg",
//     "expiresAtUtc": "2026-10-13T02:06:44.8686023Z",
//     "refreshToken": "HeTuh7P65tJIu29BpibAsSIgqy210j7eQZnQ5hfnZaS+JUf5EqpQLEjlUENjfp3Qe5R0w+M7cDS/uN1gCqKQKQ=="
// }