import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/posts/post_model.dart';
import 'package:test_app/posts/post_repo.dart';
import 'package:test_app/posts/post_view_model.dart';
import 'package:test_app/widgets/circular_loader.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

class PostScreens extends StatefulWidget {
  const PostScreens({super.key});

  @override
  State<PostScreens> createState() => _PostScreensState();
}

class _PostScreensState extends State<PostScreens> {
  late PostViewModel postViewModel;
  @override
  void initState() {
    postViewModel = PostViewModel(context.read<PostRepo>())..getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Post Screen"),
        ),
        body: BlocConsumer<VelocityBloc<PostModel?>, VelocityState<PostModel?>>(
          listener: (context, index) {},
          bloc: postViewModel.postViewModelBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const CircularLoader();
            } else if (state is VelocityUpdateState) {
              return ListView.builder(
                itemCount: state.data!.posts!.length,
                itemBuilder: (context, index) {
                  var postData = state.data!.posts![index];
                  return ListTile(
                    title: Text(postData.title.toString()),
                    subtitle: Text(postData.userId.toString()),
                  );
                },
              );
            } else if (state is VelocityFailedState) {
              return Text(state.error.toString());
            }
            return const SizedBox();
          },
        ));
  }
}
