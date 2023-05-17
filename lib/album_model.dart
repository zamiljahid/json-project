class AlbumList{
  final List<AlbumCl>? albums;

  AlbumList({
    this.albums
  });

  factory AlbumList.fromJson(List<dynamic>parsedJson){

    List<AlbumCl> albums = <AlbumCl>[];
    albums = parsedJson.map((i)=>AlbumCl.fromJson(i)).toList();
    return AlbumList(
      albums: albums,
    );
  }
}


class AlbumCl {
  final int userId;
  final int id;
  final String title;

  const AlbumCl({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumCl.fromJson(Map<String, dynamic> json) {
    return AlbumCl(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}