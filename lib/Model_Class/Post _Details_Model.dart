class Comment{
  int? id;
  String? name;
  String? email;
  String? body;

  Comment({this.id,this.name,this.body,this.email});

  factory Comment.formjson(Map<String,dynamic>json){
    return Comment(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body']
    );
  }
}