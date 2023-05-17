import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_project/photo_model.dart';
import 'package:json_project/photo_services.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Photo extends StatelessWidget {
  const Photo({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
        body: FutureBuilder<PhotoList>(
            future:
                Future.delayed(const Duration(seconds: 2), () => loadPhoto()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data!.photos!.length,
                  itemBuilder: (context, i) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            imageUrl: snapshot.data!.photos![i].url.toString(),
                            placeholder: (context, url) => Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                child: CupertinoActivityIndicator()),
                            errorWidget: (context, url, error) =>
                                Text(error.toString()),
                          ),
                          // Text(snapshot.data!.photos![i].title.toString())
                        ],
                      ),
                    );
                    ;
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
