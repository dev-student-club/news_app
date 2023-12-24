import 'package:flutter/material.dart';
import 'package:news_app/detail/detail_screen.dart';
import 'package:news_app/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), child: CustomAppBar()),
      body: NewsList(),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(
            255, 125, 5, 45), // Change the background color as needed
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
              20.0), // Adjust the radius for the bottom left corner
          bottomRight: Radius.circular(
              20.0), // Adjust the radius for the bottom right corner
        ),
      ),
      child: AppBar(
        elevation: 0, // Remove the appbar's shadow
        backgroundColor: Colors.transparent, // Make the appbar transparent
        title: const Text(
          'News App',
          style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold), // Adjust the text style
        ),
        centerTitle: true,
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final NewsModel newsModel = newsList[index];
        return InkWell(
          onTap: () {
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

  Padding _buildHeader(NewsModel newsModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            newsModel.author,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              String link = 'whatsapp://send?text=${newsModel.url}';
              try {
                await _launchUrl(Uri.parse(link));
              } catch (e) {
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
