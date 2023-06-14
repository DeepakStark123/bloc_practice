import 'package:test_app/posts/post_model.dart';
import 'package:test_app/posts/post_repo.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

class PostViewModel {
  final PostRepo postRepo;
  PostViewModel(this.postRepo);

  VelocityBloc<PostModel?> postViewModelBloc = VelocityBloc<PostModel?>(null);

  getPosts() async {
    try {
      var data = await postRepo.getPostData();
      postViewModelBloc.onUpdateData(data);
    } catch (e) {
      postViewModelBloc.onFailedResponse(error: e.toString());
    }
  }
}
