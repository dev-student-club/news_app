class NewsModel {
  final String title;
  final String author;
  final String publishedAt;
  final String url;
  final String urlToImage;

  NewsModel({
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.url,
    required this.urlToImage,
  });
}

var newsList = [
  NewsModel(
      title:
          'Sancho not important and cannot contribute for Manchester United says Ten Hag - The Independent',
      author: 'The Independent',
      publishedAt: '2023-09-16:08',
      url:
          'https://news.google.com/rss/articles/CBMiZmh0dHBzOi8vd3d3LmluZGVwZW5kZW50LmNvLnVrL3Nwb3J0L2Zvb3RiYWxsL2phZG9uLXNhbmNoby1lcmlrLXRlbi1oYWctbWFuY2hlc3Rlci11bml0ZWQtYjI0MTI3MjcuaHRtbNIBAA?oc=5',
      urlToImage:
          'https://img.a.transfermarkt.technology/portrait/big/401173-1688564217.jpg?lm=1'),
  NewsModel(
      title:
          'Inside Training | Everton preparations complete | Video | News - Arsenal.com',
      author: 'Arsenal.com',
      publishedAt: '2023-09-16 08:57',
      url:
          'https://news.google.com/rss/articles/CBMiSmh0dHBzOi8vd3d3LmFyc2VuYWwuY29tL25ld3MvaW5zaWRlLXRyYWluaW5nLWV2ZXJ0b24tcHJlcGFyYXRpb25zLWNvbXBsZXRl0gEA?oc=5',
      urlToImage:
          'https://i2-prod.dailystar.co.uk/incoming/article22200302.ece/ALTERNATES/s615b/0_GettyImages-1248776154.jpg'),
  NewsModel(
      title:
          'Brentford XI vs Newcastle: Predicted lineup and confirmed team news - Evening Standard',
      author: 'Evening Standard',
      publishedAt: '2023-09-16 08:23',
      url:
          'https://news.google.com/rss/articles/CBMimQFodHRwczovL3d3dy5zdGFuZGFyZC5jby51ay9zcG9ydC9mb290YmFsbC9icmVudGZvcmQteGktdnMtbmV3Y2FzdGxlLXByZWRpY3RlZC1saW5ldXAtY29uZmlybWVkLXRlYW0tbmV3cy1pbmp1cnktbGF0ZXN0LXByZW1pZXItbGVhZ3VlLXRvZGF5LWIxMTA3MTQzLmh0bWzSAQA?oc=5',
      urlToImage:
          'https://theanalyst.com/wp-content/uploads/2023/09/newcastle-vs-brentford-prediction-opta.png'),
  NewsModel(
      title:
          'Jamie Carragher doubles down on his criticism of over the top Andre Onana for berating Harry Maguire, insist - Daily Mail',
      author: 'Daily Mail',
      publishedAt: '2023-09-16 08:57',
      url:
          'https://news.google.com/rss/articles/CBMiamh0dHBzOi8vd3d3LmRhaWx5bWFpbC5jby51ay9zcG9ydC9mb290YmFsbC9hcnRpY2xlLTEyNTI1NDk5L0phbWllLUNhcnJhZ2hlci1hbmRyZS1vbmFuYS1oYXJyeS1tYWd1aXJlLmh0bWzSAW5odHRwczovL3d3dy5kYWlseW1haWwuY28udWsvc3BvcnQvZm9vdGJhbGwvYXJ0aWNsZS0xMjUyNTQ5OS9hbXAvSmFtaWUtQ2FycmFnaGVyLWFuZHJlLW9uYW5hLWhhcnJ5LW1hZ3VpcmUuaHRtbA?oc=5',
      urlToImage:
          'https://i2-prod.nottinghampost.com/incoming/article7538520.ece/ALTERNATES/s1200c/3_Sky-Sports-pundit-Jamie-Carragher.jpg'),
  NewsModel(
      title:
          'Hamilton critical of F1 teams for blocking last-minute DRS change in Singapore - Autosport',
      author: 'Autosport',
      publishedAt: '2023-09-16 08:57',
      url:
          'https://news.google.com/rss/articles/CBMiemh0dHBzOi8vd3d3LmF1dG9zcG9ydC5jb20vZjEvbmV3cy9oYW1pbHRvbi1jcml0aWNhbC1vZi1mMS10ZWFtcy1mb3ItYmxvY2tpbmctbGFzdC1taW51dGUtZHJzLWNoYW5nZS1pbi1zaW5nYXBvcmUvMTA1MjA5MjEv0gEA?oc=5',
      urlToImage:
          'https://cdn-5.motorsport.com/images/amp/0mbr3152/s1000/lewis-hamilton-mercedes-f1-w14.webp')
];
