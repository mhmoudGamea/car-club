import 'package:flutter/material.dart';
import 'dart:math';

class AhpViewBody extends StatelessWidget {
  const AhpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          // List<List<double>> matrix = [
          //   [1, 2, 3],
          //   [1 / 2, 1, 4],
          //   [1 / 3, 1 / 4, 1]
          // ];

          // List<double> getEigenvalues(List<List<double>> matrix) {
          //   List<double> eigenvalues = [];
          //   for (int i = 0; i < matrix.length; i++) {
          //     List<double> row = matrix[i];
          //     double sum = row.reduce((a, b) => a + b);
          //     eigenvalues.add(sum);
          //   }
          //   return eigenvalues;
          // }

          // double getLambda(List<List<double>> matrix) {
          //   int n = matrix.length;
          //   List<double> eigenvalues = getEigenvalues(matrix);
          //   double lambda = eigenvalues.reduce((a, b) => a + b) / n;
          //   return lambda;
          // }

          // double getRI(int n) {
          //   List<double> riValues = [
          //     0.0,
          //     0.0,
          //     0.58,
          //     0.9,
          //     1.12,
          //     1.24,
          //     1.32,
          //     1.41,
          //   ];
          //   if (n > riValues.length - 1) {
          //     throw Exception('RI value not defined for $n criteria');
          //   }
          //   return riValues[n];
          // }

          // int n = matrix.length;
          // double lambda = getLambda(matrix);
          // double ci = (lambda - n) / (n - 1);
          // double ri = getRI(n);
          // double cr = ci / ri;
          // print('CR: $cr');
          // List eigen(List<List<double>> m) {
          //   var n = m.length;
          //   var vals = List<double>.filled(n, 0);
          //   var vecs = List.generate(n, (_) => List<double>.filled(n, 0));
          //   for (var i = 0; i < n; i++) {
          //     vecs[i][i] = 1;
          //     vals[i] = m[i][i];
          //   }
          //   for (var i = n - 1; i > 0; i--) {
          //     var p = i - 1;
          //     for (var j = i; j < n; j++) {
          //       if (m[j][p].abs() > m[i][p].abs()) {
          //         i = j;
          //       }
          //     }
          //     if (i != p) {
          //       m[i] = [...m[p]];
          //       m[p] = [...m[i]];
          //       dynamic t = vals[i];
          //       vals[i] = vals[p];
          //       vals[p] = t;
          //       t = vecs[i];
          //       vecs[i] = vecs[p];
          //       vecs[p] = t;
          //     }
          //     if (vals[p] == 0) continue;
          //     for (i++; i < n; i++) {
          //       var g = m[i][p] / vals[p];
          //       m[i][p] = g;
          //       for (var j = p + 1; j < n; j++) {
          //         m[i][j] -= g * m[p][j];
          //       }
          //       for (var j = 0; j < n; j++) {
          //         vecs[j][i] -= g * vecs[j][p];
          //       }
          //     }
          //     for (var j = p + 1; j < n; j++) {
          //       m[p][j] /= vals[p];
          //     }
          //     for (var j = 0; j < n; j++) {
          //       vecs[j][p] /= vals[p];
          //     }
          //     vals[p] = 1 / vals[p];
          //     for (i--; i >= p; i--) {
          //       for (var j = i + 1; j < n; j++) {
          //         var g = m[i][j];
          //         if (g == 0) continue;
          //         m[i][j] = 0;
          //         for (var k = p; k < n; k++) {
          //           m[i][k] -= g * m[j][k];
          //         }
          //         for (var k = 0; k < n; k++) {
          //           vecs[k][i] -= g * vecs[k][j];
          //         }
          //       }
          //     }
          //     i++;
          //   }
          //   return [vals, vecs];
          // }

          // void ahp(double c1, double c2, double c3) {
          //   List<List<double>> matrix = [
          //     [1, c1 / c2, c1 / c3],
          //     [c2 / c1, 1, c2 / c3],
          //     [c3 / c1, c3 / c2, 1]
          //   ];
          //   var eig = eigen(matrix);
          //   print(eig);
          //   // var maxEigVal = eig[0].reduce(math.max);
          //   // var priorityVector = eig[1][eig[0].indexOf(maxEigVal)];
          //   // var sum = priorityVector.reduce((a, b) => a + b);
          //   // priorityVector = priorityVector.map((e) => e / sum).toList();
          //   // return priorityVector;
          // }

          // ahp(10, 2, 0.025);
          // print(priorityVector);
          List<double> calculatePriorities(
              List<List<double>> comparisonMatrix) {
            int n = comparisonMatrix.length;
            List<double> priorities = List.filled(n, 0);

            // Calculate geometric mean for each row
            for (int i = 0; i < n; i++) {
              double product = 1;
              for (int j = 0; j < n; j++) {
                product *= comparisonMatrix[i][j];
              }
              priorities[i] = pow(product, 1 / n) as double;
            }

            // Normalize priorities
            double sum = priorities.reduce((a, b) => a + b);
            for (int i = 0; i < n; i++) {
              priorities[i] /= sum;
            }

            return priorities;
          }

          List<List<double>> comparisonMatrix = [
            [1, 5, 4],
            [0.2, 1, 0.333],
            [0.25, 3, 1]
          ];

          // Calculate priorities
          List<double> priorities = calculatePriorities(comparisonMatrix);

          // Print priorities
          print(priorities);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
