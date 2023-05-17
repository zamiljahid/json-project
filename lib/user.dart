import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_project/user_model.dart';
import 'package:json_project/user_services.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: FutureBuilder<UserList>(
            future:
                Future.delayed(const Duration(seconds: 2), () => loadUser()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data!.users!.length);
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.users!.length,
                    itemBuilder: (context, i) {
                      if (snapshot.data!.users![i].body!.isNotEmpty) {
                        return Card(
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(snapshot.data!.users![i].title.toString()),
                                Text(snapshot.data!.users![i].body.toString()),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container();
                        // return Text(i.toString());
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 20,
                    ),
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
            },
          ),
        ),
      );
}
