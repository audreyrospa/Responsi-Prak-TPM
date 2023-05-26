import 'package:flutter/material.dart';
import '../models/matches_model.dart';


class MatchDetailScreen extends StatelessWidget {
  final MatchesModel match;

  const MatchDetailScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pertandingan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Match ID: ${match.id}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Venue: ${match.venue}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Location: ${match.location}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${match.status}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Stage Name: ${match.stageName}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Time: ${match.time}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Home Team: ${match.homeTeam?.name}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Away Team: ${match.awayTeam?.name}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Statistics:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (match.homeTeam != null && match.awayTeam != null)
              Column(
                children: [
                  const Text(
                    'Goals:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${match.homeTeam!.name}: ${match.homeTeam!.goals ?? 0}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        '${match.awayTeam!.name}: ${match.awayTeam!.goals ?? 0}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Penalties:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${match.homeTeam!.name}: ${match.homeTeam!.penalties ?? 0}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        '${match.awayTeam!.name}: ${match.awayTeam!.penalties ?? 0}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Referees:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (match.officials != null)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: match.officials!.length,
                      itemBuilder: (context, index) {
                        Officials official = match.officials![index];
                        return ListTile(
                          title: Text(official.name ?? ''),
                          subtitle: Text(official.role ?? ''),
                          trailing: Text(official.country ?? ''),
                        );
                      },
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}



