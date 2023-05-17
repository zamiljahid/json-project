import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_project/photo_model.dart';
import 'package:json_project/photo_services.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'album_model.dart';
import 'album_service.dart';

class Album extends StatelessWidget {
  const Album({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
        body: FutureBuilder<AlbumList>(
            future:  fetchAlbum(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: snapshot.data!.albums!.length,
                  itemBuilder: (context, i) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          border: Border.all(color: Colors.black)),
                      child:Column(
                        children: [
                          Text(snapshot.data!.albums![i].title.toString()),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 20,
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: Theme.of(context).textTheme.headlineLarge!,
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ));
}
