import 'package:flutter/material.dart';
import 'package:handle_internet_conectivity/ui/shared/conditional_child.dart';
import 'package:handle_internet_conectivity/ui/views/home_view/home_viewModel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (viewModel) => viewModel.setUp(),
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: viewModel.status ? Colors.green : Colors.red,
                centerTitle: true,
                title: const Text('Characters List',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black)),
                actions: [
                  Text(
                    viewModel.status ? "Online" : "Offline",
                    style: const TextStyle(color: Colors.black),
                  )
                ],
              ),
              body: ConditionalChild(
                condition: viewModel.status == false,
                child: const Center(
                  child: Text('No Internet Connection',
                      style: TextStyle(fontSize: 24)),
                ),
                replacement: Column(),
              ));
        });
  }
}
