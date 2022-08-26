import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_calling/provider/dataModel_provider.dart';

class BeerApiView extends StatefulWidget {
  const BeerApiView({Key? key}) : super(key: key);

  @override
  State<BeerApiView> createState() => _BeerApiViewState();
}

class _BeerApiViewState extends State<BeerApiView> {
  @override
  void initState() {
    super.initState();
    final postMdl =
        Provider.of<DeerProvider>(context, listen: false); //provider object
    postMdl.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DeerProvider>(
      builder: (context, deerProvider, child) {
        return Scaffold(
//----------------------------------view title----------------------------------//
          appBar: AppBar(
            title: const Text("Beer book"),
            centerTitle: true,
          ),

          //---------------------------------view part------------------------------------//

          body: SizedBox(
            child: deerProvider.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: deerProvider.post.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 6),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      deerProvider.post.data![index].imageUrl,
                                      height: 90,
                                      width: 60,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${deerProvider.post.data![index].id} . ",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  deerProvider
                                                      .post.data![index].name,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  maxLines: 1,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Tagline : ",
                                              ),
                                              Expanded(
                                                child: Text(
                                                  deerProvider.post.data![index]
                                                      .tagline,
                                                  style: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "First Brewed : ",
                                              ),
                                              Expanded(
                                                child: Text(
                                                  deerProvider.post.data![index]
                                                      .firstBrewed,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: Center(
                                            child: Text(
                                              "Ingredients",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2,
                                          color: Colors.black38,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 15,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Malt :",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Name :  ${deerProvider.post.data![index].ingredients!.malt![0].name}",
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Amount :  ${deerProvider.post.data![index].ingredients!.malt![0].amount!.value} (${deerProvider.post.data![index].ingredients!.malt![0].amount!.unit})",
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Text(
                                                "Hops :",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Name :  ${deerProvider.post.data![index].ingredients!.hops![0].name}",
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Amount :  ${deerProvider.post.data![index].ingredients!.hops![0].amount.value} (${deerProvider.post.data![index].ingredients!.malt![0].amount!.unit})",
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Add :  ${deerProvider.post.data![index].ingredients!.hops![0].add}",
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Attribute :  ${deerProvider.post.data![index].ingredients!.hops![0].attribute}",
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Description : ",
                                    ),
                                    Expanded(
                                      child: Text(
                                        deerProvider
                                            .post.data![index].description,
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 4,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
