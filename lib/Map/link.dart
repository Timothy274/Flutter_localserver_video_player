class Link {
  String link_http;
  String link_db;

  Link({
    this.link_http,
    this.link_db,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(link_http: json['link_http'], link_db: json['link_db']);
  }
}
