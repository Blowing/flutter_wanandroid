
class SplashModel {
  String title;
  String content;
  String url;
  String imgUrl;

  SplashModel({this.title, this.content, this.url, this.imgUrl});

  SplashModel.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.content = json['content'];
    this.url = json['url'];
    this.imgUrl = json[imgUrl];
  }

  Map<String, dynamic> toJson() => {
    'title' : title,
    'content' : content,
    'url' : url,
    'imageUrl' : imgUrl,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"content\":\"$content\"");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"imgUrl\":\"$imgUrl\"");
    sb.write('}');
    return sb.toString();
  }

}