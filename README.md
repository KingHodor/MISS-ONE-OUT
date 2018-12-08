
# MISS ONE OUT: A CROSS-VALIDATION METHOD UTILIZING INDUCED TEACHER NOISE

Leave-one-out (LOO) and its generalization, K-Fold, are among most well-known cross-validation methods, which divide the sample into many folds, each one of which is, in turn, left out for testing, while the other parts are used for training. In this study, as an extension of this idea, we propose a new cross-validation approach that we called miss-one-out (MOO) that mislabels the example(s) in each fold and keeps this fold in the training set as well, rather than leaving it out as LOO does. Then, MOO tests whether the trained classifier can correct the erroneous label of the training sample. In principle, having only one fold deliberately labeled incorrectly should have only a small effect on the classifier that uses this bad-fold along with K - 1 good folds and can be utilized as a generalization measure of the classifier. Experimental results on a number of benchmark datasets and three real bioinformatics dataset show that MOO can better estimate the test set accuracy of the classifier.

Read more in the [article](https://www.worldscientific.com/doi/abs/10.1142/S0218001413510038?journalCode=ijprai).

## Getting help

Please contact sfa.alptekin@gmail.com
