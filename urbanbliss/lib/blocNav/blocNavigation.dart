import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbanbliss/Pages/Chat.dart';
import 'package:urbanbliss/Pages/HomePage.dart';
import 'package:urbanbliss/Pages/Shop.dart';


enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
}
abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{
  NavigationBloc(NavigationStates initialState) : super(initialState);


  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch(event){
      case NavigationEvents.HomePageClickedEvent: yield HomePage();
      break;
      case NavigationEvents.MyAccountClickedEvent: yield Chat();
      break;
      case NavigationEvents.MyOrdersClickedEvent: yield Shop();
      break;
    }
  }

}