class FirebaseNotification {
  Notification? notification;
  Data? data;

  FirebaseNotification(
    this.notification,
    this.data,
  );

  factory FirebaseNotification.fromJson(Map<String, dynamic> json) =>
      FirebaseNotification(
        json['notification'] == null
            ? null
            : Notification.fromJson((json['notification'] as Map).map(
                (k, e) => MapEntry(k as String, e),
              )),
        json['data'] == null
            ? null
            : Data.fromJson((json['data'] as Map).map(
                (k, e) => MapEntry(k as String, e),
              )),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'notification': this.notification,
        'data': this.data,
      };

  @override
  String toString() {
    return 'FirebaseNotification{notification: $notification, data: $data}';
  }
}

class Data {
  String type;
  String data;

  Data(this.type, this.data);

  factory Data.fromJson(Map<String, dynamic>? json) => Data(
        json?['type'] as String,
        json?['data'] as String,
      );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'type': this.type, 'data': this.data};

  @override
  String toString() {
    return '''{"type": "${this.type}","data": "${this.data}"}''';
  }
}

class Notification {
  String title;
  String body;

  Notification(
    this.title,
    this.body,
  );

  factory Notification.fromJson(Map<String, dynamic>? json) => Notification(
        json?['title'] as String,
        json?['body'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': this.title,
        'body': this.body,
      };

  @override
  String toString() {
    return 'Notification{title: $title, body: $body}';
  }
}
