// Import necessary Flutter packages.
import 'package:flutter/material.dart';
import 'package:news_app/detail/detail_screen.dart';
import 'package:news_app/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

// Define a function to launch a URL asynchronously.
Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

// Define the MainScreen widget as a StatelessWidget.
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return a Scaffold widget with a custom AppBar and NewsList body.
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: CustomAppBar(),
      ),
      body: NewsList(),
    );
  }
}

// Define a CustomAppBar widget as a StatelessWidget.
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure Flutter is initialized.
    WidgetsFlutterBinding.ensureInitialized();

    // Return a decorated container with a transparent AppBar.
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 125, 5, 45),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'News App',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}

// Define the NewsList widget as a StatelessWidget.
class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return a ListView.builder with a list of news articles.
    return ListView.builder(
      itemBuilder: (context, index) {
        final NewsModel newsModel = newsList[index];
        // Wrap each news item with InkWell to make it tappable.
        return InkWell(
          onTap: () {
            // Navigate to the DetailMobilePage when tapped.
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailMobilePage(model: newsModel);
            }));
          },
          child: _buildContentItem(newsModel, context),
        );
      },
      itemCount: newsList.length,
    );
  }

  // Define a method to build the content of each news item.
  Padding _buildContentItem(NewsModel newsModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildHeader(newsModel, context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                newsModel.title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Text(
                newsModel.publishedAt,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                ),
              ),
            ),
            // Display the image associated with the news article.
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                newsModel.urlToImage,
                height: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Define a method to build the header of each news item.
  Padding _buildHeader(NewsModel newsModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Display the author's name.
          Text(
            newsModel.author,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          // Add a share button to share the news article URL.
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              // Launch the URL in a WhatsApp message.
              String link = 'whatsapp://send?text=${newsModel.url}';
              try {
                await _launchUrl(Uri.parse(link));
              } catch (e) {
                // Show a Snackbar if WhatsApp is not available.
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Anda tidak memiliki aplikasi Whatsapp'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
