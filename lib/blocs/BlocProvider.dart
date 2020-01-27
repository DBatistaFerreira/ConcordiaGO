import 'package:flutter/cupertino.dart';
import 'package:flutter_app/blocs/Bloc.dart';

/*
This is a simple implementation of a BLoC provider for this prototype.
We might benefit from using the 'bloc' and 'flutter_bloc' packages which provide tools for implementing the BLoC design pattern.
We might also want to consider the 'RxDart' package for working with streams.
 */
class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.bloc, @required this.child}) : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T> provider = context.findAncestorWidgetOfExactType();
    return provider.bloc;
  }

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
