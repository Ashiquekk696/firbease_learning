import 'package:firbease_learning/repositories/add_employee_repository.dart';
import 'package:firbease_learning/screens/employee_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../events/home_events.dart';
import '../helpers/app_style.dart';
import '../repositories/designations_repository.dart';
import '../repositories/list_contacts_repository.dart';
import '../state/home_state.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/loader.dart';
import 'add_employee_screen.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    getScrolledData();
    super.initState();
  }

  getScrolledData() async {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        currentPage++;
        print(currentPage);
        setState(() {});
      }
    });
  }

  var currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RepositoryProvider(
                      create: (context) => AddEmployeeReposiotry(),
                      child: RepositoryProvider(
                          create: (context) => DesignationsRepository(),
                          child: AddEmployeeScreen()))));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(
          contactsRepository:
              RepositoryProvider.of<ContactsRepository>(context),
        )..add(HomeDataEvent(),),
        child: Column(
          children: [
            AppBarWidget(
              label: "Employee",
            ),
            Expanded(
                child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: BlocListener<HomeBloc, HomeMainState>(
                listener: (context, state) {
                  if (state is HomeLoadedState) {
                    BlocProvider(
                        create: (context) => HomeBloc(
                              contactsRepository:
                                  RepositoryProvider.of<ContactsRepository>(
                                      context),
                            ));
                  }
                },
                child: BlocBuilder<HomeBloc, HomeMainState>(
                    builder: (context, state) {
                  // if (state is HomeLoadingState) {
                  //   return Loader();
                  // }
                  if (state is HomeErrorState) {
                    print("loading");
                  }

                  if (state is HomeLoadedState) {
                    return ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController
                          ..addListener(() {
                            if (HomeBloc.currentPage < HomeBloc.lastPage) {
                              if (scrollController.position.pixels ==
                                  scrollController.position.maxScrollExtent) {
                                BlocProvider.of<HomeBloc>(context)
                                  ..add(HomeDataEvent());
                              }
                            }
                          }),
                        itemCount: state.employeeModel?.length ?? 1,
                        itemBuilder: (context, index) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                        
                              itemCount: state.employeeModel?[index]
                                      .employeeDetails?.length ??
                                  1,
                              itemBuilder: (context, i) {
                                var data = state.employeeModel?[index]
                                        .employeeDetails ??
                                    [];
                                //   setState(() {});
                                return Column(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EmployeeDetailsScreen(
                                                        employeeData: data[i],
                                                      )));
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.only(left: 20),
                                          height: 77,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                            children: [
                                              Text(""),
                                              Container(
                                                height: 70,
                                                width: 55,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: NetworkImage(data?[
                                                                    i]
                                                                .profileImage ??
                                                            ""),
                                                        fit: BoxFit.fill)),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        data[i].firstName ?? "",
                                                        style: AppStyles()
                                                            .mediumSmallText(),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        data[i].lastName ?? "",
                                                        style: AppStyles()
                                                            .mediumSmallText(),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    data?[i]
                                                            .mobile
                                                            .toString() ??
                                                        "",
                                                    style: AppStyles()
                                                        .smallText(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  ],
                                );
                              });
                        });
                  }
                  return Loader();
                }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
