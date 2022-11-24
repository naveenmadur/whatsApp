// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:whats_app/domain/entities/message_entity.dart';
import 'package:whats_app/domain/use_case/message/get_message_usercase.dart';
import 'package:whats_app/domain/use_case/message/post_message_usecase.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetMessageUseCase getMessageUseCase;
  final PostMessageUseCase postMessageUseCase;

  MessageBloc({
    required this.getMessageUseCase,
    required this.postMessageUseCase,
  }) : super(MessageInitial()) {
    on<PostMessageEvent>((event, emit) {
      postMessageUseCase.postMessage(event.message, event.key);
    });

    on<GetMessageEvent>((event, emit) async {
      var messages = await getMessageUseCase.getMessages(event.key);
      print(event.key);
      messages.fold(
        (l) => emit(ErrorState('Unable fetch messages')),
        (r) => emit(AllMessages(messages: r)),
      );
    });
  }
}
