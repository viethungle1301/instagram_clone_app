// To parse this JSON data, do
//
//     final poster = posterFromJson(jsonString);

import 'dart:convert';

Poster posterFromJson(String str) => Poster.fromJson(json.decode(str));

String posterToJson(Poster data) => json.encode(data.toJson());

class Poster {
  final List<PosterDatum>? data;
  final Paging? paging;

  Poster({
    this.data,
    this.paging,
  });

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
        data: json["data"] == null
            ? []
            : List<PosterDatum>.from(
                json["data"]!.map((x) => PosterDatum.fromJson(x))),
        paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "paging": paging?.toJson(),
      };
}

class PosterDatum {
  final String? id;
  final MediaType? mediaType;
  final String? permalink;
  final String? mediaUrl;
  final Username? username;
  final String? caption;
  final String? timestamp;
  final Children? children;

  PosterDatum({
    this.id,
    this.mediaType,
    this.permalink,
    this.mediaUrl,
    this.username,
    this.caption,
    this.timestamp,
    this.children,
  });

  factory PosterDatum.fromJson(Map<String, dynamic> json) => PosterDatum(
        id: json["id"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        permalink: json["permalink"],
        mediaUrl: json["media_url"],
        username: usernameValues.map[json["username"]]!,
        caption: json["caption"],
        timestamp: json["timestamp"],
        children: json["children"] == null
            ? null
            : Children.fromJson(json["children"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "media_type": mediaTypeValues.reverse[mediaType],
        "permalink": permalink,
        "media_url": mediaUrl,
        "username": usernameValues.reverse[username],
        "caption": caption,
        "timestamp": timestamp,
        "children": children?.toJson(),
      };
}

class Children {
  final List<ChildrenDatum>? data;

  Children({
    this.data,
  });

  factory Children.fromJson(Map<String, dynamic> json) => Children(
        data: json["data"] == null
            ? []
            : List<ChildrenDatum>.from(
                json["data"]!.map((x) => ChildrenDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ChildrenDatum {
  final String? mediaUrl;
  final String? id;

  ChildrenDatum({
    this.mediaUrl,
    this.id,
  });

  factory ChildrenDatum.fromJson(Map<String, dynamic> json) => ChildrenDatum(
        mediaUrl: json["media_url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "media_url": mediaUrl,
        "id": id,
      };
}

// ignore: constant_identifier_names
enum MediaType { IMAGE, CAROUSEL_ALBUM }

final mediaTypeValues = EnumValues(
    {"CAROUSEL_ALBUM": MediaType.CAROUSEL_ALBUM, "IMAGE": MediaType.IMAGE});

// ignore: constant_identifier_names
enum Username { HUNGKTHN_K57 }

final usernameValues = EnumValues({"hungkthn.k57": Username.HUNGKTHN_K57});

class Paging {
  final Cursors? cursors;

  Paging({
    this.cursors,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        cursors:
            json["cursors"] == null ? null : Cursors.fromJson(json["cursors"]),
      );

  Map<String, dynamic> toJson() => {
        "cursors": cursors?.toJson(),
      };
}

class Cursors {
  final String? before;
  final String? after;

  Cursors({
    this.before,
    this.after,
  });

  factory Cursors.fromJson(Map<String, dynamic> json) => Cursors(
        before: json["before"],
        after: json["after"],
      );

  Map<String, dynamic> toJson() => {
        "before": before,
        "after": after,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
