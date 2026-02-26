import 'package:flutter/material.dart';
import '../Models/posts.dart';
import '../Models/quotes.dart';
import '../Models/test.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  late Future<Test> usersFuture;
  late Future<Quotes> quotesFuture;
  late Future<Posts> postsFuture;
  @override
  void initState() {
    super.initState();
    usersFuture = apiService.getUsersApi();
    quotesFuture = apiService.getQuotesApi();
    postsFuture = apiService.getPostsApi();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'API Testing',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Users',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Tab(
                child: Text(
                  'Qoutes',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Tab(
                child: Text(
                  'Posts',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              FutureBuilder(
                future: usersFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.users.isEmpty) {
                    return const Center(child: Text('No Data Found'));
                  } else {
                    final users = snapshot.data!.users;
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return Card(
                          elevation: 3,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(user.image),
                              ),
                              title: Text(
                                '${user.firstName} ${user.lastName}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('${user.email} • ${user.university}'),
                              trailing: Text('Age: ${user.age}'),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              FutureBuilder(
                future: quotesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.quotes.isEmpty) {
                    return const Center(child: Text('No Data Found'));
                  } else {
                    final quotes = snapshot.data!.quotes;
                    return ListView.builder(
                      itemCount: quotes.length,
                      itemBuilder: (context, index) {
                        final quote = quotes[index];
                        return Card(
                          elevation: 3,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: ListTile(
                              leading: Text('${quote.id}'),
                              title: Text(
                                '${quote.author}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                '${quote.quote}',
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              FutureBuilder(
                future: postsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.posts.isEmpty) {
                    return const Center(child: Text('No Data Found'));
                  } else {
                    final posts = snapshot.data!.posts;
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return Card(
                          elevation: 5,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: ListTile(
                                leading: Text('${post.id}'),
                                title: Padding(
                                  padding: EdgeInsets.only(bottom: 5, top: 8),
                                  child: Text(
                                    '${post.title}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${post.body}',
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      '${post.tags}',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          'Likes:: ${post.reactions.likes}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          'Dislikes::${post.reactions.dislikes}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          'Views:: ${post.views}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
