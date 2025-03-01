import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class NotificationDataSource {
  Future<void> sendNotification(
      String fcmToken, String title, String body) async {
    final String serverAccessTokenKey = await getAccessToken();

    var message = {
      'message': {
        'token': fcmToken,
        'notification': {
          'title': title,
          'body': body,
        },
      },
    };

    var response = await http.post(
      Uri.parse(
          'https://fcm.googleapis.com/v1/projects/talent-space-bfca5/messages:send'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverAccessTokenKey',
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification: ${response.body}');
    }
  }

  Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "talent-space-bfca5",
      "private_key_id": "2c780c72295a3f3b39b1fac475845886f13eb166",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCwYUxkp+NvWEHy\nZ0QtgBp2bNHp/yrzfuI4VGiGZU0U/oZUWG00oUWqWKbgGsOs3xySILyUjOmESzff\n/0NXSYhWctbB9q6bks9kLakCPN1yqCEkN6BXPsVNpKIsjtnxpWvnTWeihJFeUn/E\nGt5w3OSiWAbDYZEYPR+leRzSLUruyyVhhO9WNZc0fr1wdapb/yo6wfeHrWOWXcAg\nAZZMACTbBdji81vLwmKedoyDCvBOLb5NCUcvNE97N5JsOTfA0z9lsEMUW1ZzaKOC\n4Et2nSEGpZUohWurPBPKo8gV/KmBtRmcp8gyfDzTwXv2hBrR1TTQAjjqzMCQkAD3\nMeyyKERvAgMBAAECggEAH9eY+o0Cts3IrhHtkYdQf7O6m9N4thfgkEnQyv6L0W/3\n4U9Le9ZnpM63Zbr/O3zWBB2L3geoer03m6VSS3ZXej/mPIMj16tD7LJ/kgtZ8UKg\nJREzzbxj01YW/xNVDlaOaeYkAQeM1Onw7f7pzJdcYWCh6/D3yFf0mCOKy/joT76o\n5ymG79BKbdMiFhG96C7Ru5qyeC9VwiKoBXCg9Wzmcu5vAkaqK970uWcLkGzv0Nv6\nEt+IV8DURwarS4HY+JQj9jyLg66juRqhqmFrkTIyEXh1/9E9iDI+HNasW4xzQWg/\n6Vt5DvbjiK63J45486+5TPgjPkZlgBNcFfDcnWWLUQKBgQDq5yxwBduA3ruKHStt\nTM0KGk0PS/j+X6pmViPctcli8L5HuSqDO/WO9fEOML5HhZhHoAjP9yj7e4GUGuKM\ndjGj8Ar+LTRvqGi9+f8Ir5BTE02GnS3XyDebM2agcsOOf/qEW0tdPgdGo/qzuWYj\nbmlxfO+Ir+2VSf/FlUU4UhFMUQKBgQDAOJTBMQ9FgyfpnS9B6yS2WCm88111YJTG\nJ/lCqvTHFw9oussCw6PVSL0fj+wLUA79d7qVdiOgQFedtDpjywueHN5BiI/SeGyu\nse9AGlNj1p65cz5zCv86aibU9QxSIWfQYykmfw4IpD5wbeUwtmrScdellhzUOBoc\nemiAGCoUvwKBgQCdqz9bjcLw9A+jO8MLYTJ7Jn4010Sw0NuaRxVZLreW7op5r+LG\nJXfEVnZPlQ4TCavV36gqlvZuHk8ybv1DVI4rQJLQWt1IWRy871FsrhLMgDdYNKYx\noRUZ2l13MrDqNCKdtn2Wf2z40FYVTkstWw3xe+93qsZonzvLjk7g58zukQKBgQCh\n3INWkws7C5BGZffvWCSX73FmDMA8INHmcq6wduib5U0ycWiVsUx6Q0AOHdE0TXvx\n8CoLxWmGfefJgoRQmB/2SnTVVjtVjdZm3KqMnh5uScFqhCKoGTCGbfC5DogLeNnE\nXlu+cOrOWA/D+KYv+MvG3dorM1afVYaXSHRKuQ5mXQKBgQDE4s0j1wBZmQHV5J/A\nmLj086nOvauTkOvwM8NVm0bm9WA6u4RDAWDyTBKV5h4OpEH4rNK2E/Y9sq8s8r88\n25dAXmnwMV9GE+eoVeTdD0BrC6UbpZAkKR96JZh4CUClKQxHa94iJjrClx68HLpw\nRAtVIvAkoJFZYuFzF8t9Eja6fQ==\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-fbsvc@talent-space-bfca5.iam.gserviceaccount.com",
      "client_id": "109780481443910481580",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40talent-space-bfca5.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };
    List<String> scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);
    client.close();

    return credentials.accessToken.data;
  }
}
