import 'package:car_club/features/Ahp/presentation/views/widgets/ahp_view_body.dart';
import 'package:flutter/material.dart';

class AhpView extends StatelessWidget {
  static const String rn = '/ahpView';
  const AhpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AhpViewBody(),
      ),
    );
  }
}
/*
// will calculate priority vector = criteria weight = [0.674, 0.101, 0.226]
List<double> calculatePriorities(List<List<double>> comparisonMatrix) {
  int n = comparisonMatrix.length;
  List<double> priorities = List.filled(n, 0);

  // Calculate geometric mean for each row
  for (int i = 0; i < n; i++) {
    double product = 1;
    for (int j = 0; j < n; j++) {
      product *= comparisonMatrix[i][j];
    }
    priorities[i] = pow(product, 1 / n);
  }

  // Normalize priorities
  double sum = priorities.reduce((a, b) => a + b);
  for (int i = 0; i < n; i++) {
    priorities[i] /= sum;
  }

  return priorities;
}

// will calculate CI
double calculateConsistencyIndex(List<List<double>> comparisonMatrix, List<double> priorities) {
  int n = comparisonMatrix.length;

  // Calculate weighted sum for each column
  List<double> weightedSums = List.filled(n, 0);
  for (int j = 0; j < n; j++) {
    for (int i = 0; i < n; i++) {
      weightedSums[j] += comparisonMatrix[i][j] * priorities[i];
    }
  }

  // Calculate lambda max
  double lambdaMax = weightedSums.reduce((a, b) => a + b) / n;

  // Calculate consistency index
  double consistencyIndex = (lambdaMax - n) / (n - 1);

  return consistencyIndex;
}

// will calculate CR = CI / RI
double calculateConsistencyRatio(double consistencyIndex, double randomIndex) {
    return consistencyIndex / randomIndex;
}

// in main
void main() {
  // Input comparison matrix
  List<List<double>> comparisonMatrix = [
    [1, 2, 3],
    [1 / 2, 1, 4],
    [1 / 3, 1 / 4, 1]
  ];

  // Calculate priorities
  List<double> priorities = calculatePriorities(comparisonMatrix);

  // Calculate consistency index
  double consistencyIndex = calculateConsistencyIndex(comparisonMatrix, priorities);

  // Input random index
  double randomIndex = 0.58;

  // Calculate consistency ratio
  double consistencyRatio = calculateConsistencyRatio(consistencyIndex, randomIndex);

  // Print consistency ratio
  print(consistencyRatio);
}

*/