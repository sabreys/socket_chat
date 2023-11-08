import 'dart:convert';

/// title : "title"
/// description : "channel description"
/// path : "channel id"

Channel channelFromJson(String str) => Channel.fromJson(json.decode(str));
String channelToJson(Channel data) => json.encode(data.toJson());

class Channel {
  Channel({
    String? title,
    String? description,
    String? path,
  }) {
    _title = title;
    _description = description;
    _path = path;
  }

  Channel.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _path = json['path'];
  }
  String? _title;
  String? _description;
  String? _path;
  Channel copyWith({
    String? title,
    String? description,
    String? path,
  }) =>
      Channel(
        title: title ?? _title,
        description: description ?? _description,
        path: path ?? _path,
      );
  String? get title => _title;
  String? get description => _description;
  String? get path => _path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['path'] = _path;
    return map;
  }
}
