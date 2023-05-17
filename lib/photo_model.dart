class PhotoList{
  final List<Photo>? photos;

  PhotoList({
     this.photos,
});

  factory PhotoList.fromJson(List<dynamic> parsedJson) {

    List<Photo> photos = <Photo>[];
    photos = parsedJson.map((i)=>Photo.fromJson(i)).toList();
    return PhotoList(
      photos: photos,
    );
  }
}

class Photo {
  final String id;
  final String title;
  final String url;

  Photo({required this.id, required this.url, required this.title});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'].toString(),
      title: json['title'],
      url: json['url'],
    );
  }
}
