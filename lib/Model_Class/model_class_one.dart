class Post{
  int? id;
  String? title;
  String? body;

  Post({this.title,this.id,this.body});

  factory Post.formjson(Map<String,dynamic>json){
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}