import 'package:flutter/material.dart';
import 'package:json_project/page_services.dart';
import 'package:json_project/page_model.dart';

class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<PageCl>(
          future: Future.delayed(const Duration(seconds: 10), () => loadPage()),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text(snapshot.data!.perPage.toString())),
                  Center(child: Text(snapshot.data!.page.toString())),
                  Center(child: Text(snapshot.data!.total.toString())),
                  Center(
                      child: Text(snapshot.data!.author!.firstName.toString())),
                  Center(
                      child: Text(snapshot.data!.author!.lastName.toString())),
                  Center(child: Text(snapshot.data!.totalPages.toString())),
                  // Center(child: Text(snapshot.data!.data.toString())),
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                Text(snapshot.data!.data![i].id.toString()),
                                Text(snapshot.data!.data![i].firstName.toString()),
                                Text(snapshot.data!.data![i].lastName.toString()),
                              ],
                            );
                      })),
                ],
              );
            }
          },
        ),
      );
}
