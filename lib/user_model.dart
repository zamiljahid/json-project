class UserList{
  final List<UserCl>? users;

  UserList({
    this.users
});

  factory UserList.fromJson(List<dynamic>parsedJson){

    List<UserCl> users = <UserCl>[];
    users = parsedJson.map((i)=>UserCl.fromJson(i)).toList();
    return UserList(
      users: users,
    );
  }
}
class UserCl{
  final int? userId;
  final int? it;
  final String? title;
  final String? body;

  UserCl({
    this.title,
    this.body,
    this.it,
    this.userId
});

  factory UserCl.fromJson(Map<String, dynamic> json){
    return UserCl(
      userId:json['userId'],
      it: json['it'],
      title: json['title'],
      body: json['body']
    );
  }

}