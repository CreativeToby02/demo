import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ReviewScreen extends StatelessWidget {
  static const String name = 'review';
  static const String route = '/review';
  const ReviewScreen({super.key, this.productRating});

  final String? productRating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(title: 'Reviews'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                height: 2,
                color: Colors.black26,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 30),
                  Text(
                    '$productRating',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                        ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/4-star.svg'),
                      const SizedBox(height: 3),
                      const Text(' 1034 Ratings'),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              const SizedBox(height: 30),
              const RatingSelection(
                starLength: '5-star',
                barLength: '5-progress-bar',
              ),
              const RatingSelection(
                starLength: '4-star',
                barLength: '4-progress-bar',
              ),
              const RatingSelection(
                starLength: '3-star',
                barLength: '3-progress-bar',
              ),
              const RatingSelection(
                starLength: '2-star',
                barLength: '2-progress-bar',
              ),
              const RatingSelection(
                starLength: '1-star',
                barLength: '1-progress-bar',
              ),
              const SizedBox(height: 20),
              const Divider(
                height: 2,
                color: Colors.black26,
              ),
              const SizedBox(height: 30),
              Text(
                '45 Reviews',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
              ),
              const SizedBox(height: 20),
              SvgPicture.asset('assets/icons/4-star.svg'),
              const SizedBox(height: 20),
              const Text(
                  'The item is very good, my son likes it very much and plays every day.'),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Fizzie Bot .',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                        ),
                  ),
                  const Text('  6 days ago'),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                height: 2,
                color: Colors.black26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingSelection extends StatelessWidget {
  const RatingSelection({
    super.key,
    this.starLength,
    this.barLength,
  });
  final String? starLength, barLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const SizedBox(width: 10),
          SvgPicture.asset('assets/icons/$starLength.svg'),
          const SizedBox(width: 20),
          Expanded(child: SvgPicture.asset('assets/icons/$barLength.svg')),
        ],
      ),
    );
  }
}
