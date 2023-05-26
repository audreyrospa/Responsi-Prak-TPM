import 'package:flutter/material.dart';
import 'package:responsi/models/matches_model.dart';
import 'package:responsi/models/base_network.dart';
import 'package:responsi/screens/halaman_detail.dart';

class ApiService {Future<List<MatchesModel>> getMatches() async {
  final response = await BaseNetwork.getList('matches');
  List<MatchesModel> matches = [];

  if (response.isNotEmpty) {
    for (var json in response) {matches.add(MatchesModel.fromJson(json));
    }
  }
  return matches;
}

Future<MatchesModel?> getMatchDetail(String matchId) async {final response = await BaseNetwork.get('matches/$matchId');
    if (response.isNotEmpty) {
      return MatchesModel.fromJson(response);
    }
    return null;
  }
}

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  _MatchListScreenState createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  List<MatchesModel> matches = [];

  @override
  void initState() {
    super.initState();
    _fetchMatches();
  }


  void _fetchMatches() async {
    ApiService apiService = ApiService();
    List<MatchesModel> fetchedMatches = await apiService.getMatches();

    setState(() {
      matches = fetchedMatches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Pertandingan'),
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${matches[index].homeTeam?.name} vs ${matches[index].awayTeam?.name}'),
            subtitle: Text(matches[index].venue ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MatchDetailScreen(match: matches[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
