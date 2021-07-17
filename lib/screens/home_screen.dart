import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/shared_widgets/widgets.dart';
import 'package:flutter_facebook_ui/data/data.dart';
// import 'package:flutter_facebook_ui/models/models.dart';
// import 'package:flutter_facebook_ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withAlpha(10),
      child: SafeArea(        
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                title: Text(
                  'facebook',
                  style: TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
                centerTitle: false,
                floating: true,
                actions: [
                  CircleIconButton(
                    icon: Icons.search,
                    size: 30,
                    onPressed: () {
                      print('search');
                    },
                  ),
                  CircleIconButton(
                    icon: Icons.message,
                    size: 30,
                    onPressed: () {
                      print('search');
                    },
                  ),
                ],
              ),

              // ------
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              // ------
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              // ---
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              // ---
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return PostContainer(post: posts[index]);
                },
                childCount: posts.length,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
