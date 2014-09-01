using Diversity
using Base.Test

# Simple power means
numbers = [1, 2, 4, 8, 16];
@test_approx_eq powermean(numbers, 0) 4
@test_approx_eq powermean(numbers, 1) 6.2
@test_approx_eq powermean(numbers, -Inf) 1
@test_approx_eq powermean(numbers, Inf, [1, 1, 1, 1, 0]) 8

# Power mean with some random numbers
len = 100;
fragments = rand(len);
weights = rand(len);
weights = weights / sum(weights);
@test_throws ErrorException powermean(numbers, 0, weights)
@test_approx_eq powermean(fragments, 0) prod(fragments .^ (1/len))
@test_approx_eq powermean(fragments, 1) mean(fragments)
@test_approx_eq powermean(fragments, Inf) maximum(fragments)
@test_approx_eq powermean(fragments, 0, weights) prod(fragments .^ weights)
@test_approx_eq powermean(fragments, 1, weights) sum(fragments .* weights)

# Basic qD diversity calculation
@test_approx_eq qD(weights, 0) mapreduce((x) -> isapprox(x, 0.) ? 0. : 1.,
                                         +, weights)
@test_approx_eq qD(weights, 1) prod(weights .^ -weights)
@test_approx_eq qD(weights, 2) 1. / sum(weights .^ 2)
@test_approx_eq qD(weights, Inf) 1. / maximum(weights)

@test_approx_eq qD(weights, [1, 2]) [qD(weights, 1), qD(weights, 2)]

# General Leinster-Cobbold diversity calculation
Z1 = ones(typeof(weights[1]), (length(weights), length(weights)))
@test_approx_eq qDZ(weights, [1, 2]) qD(weights, [1, 2])
@test_approx_eq qDZ(weights, [0, 1, 2, 3, Inf], Z1) [1, 1, 1, 1, 1]

cols = 10;
manyweights = rand(len, cols);
manyweights *= diagm(reshape(mapslices(v -> 1. / sum(v), manyweights, 1),
                             (cols)));

@test_approx_eq qD(manyweights, 0) len * ones((1, size(manyweights)[2]))
@test_approx_eq qD(manyweights, [0]) len * ones((1, size(manyweights)[2]))
@test_approx_eq qDZ(manyweights, [0, 1, 2, Inf],
                    ones((size(manyweights)[1],
                          size(manyweights)[1]))) ones((4, size(manyweights)[2]))

# Sub-community alpha diversities
communities = rand(len, cols);
communities /= sum(communities);
@test_approx_eq ᾱ(communities, 0) len * ones((1, size(communities)[2]))
@test_approx_eq communityalphabar(communities,
                                  [0]) len * ones((1, size(communities)[2]))
@test_approx_eq ᾱ(communities, [0, 1, 2, Inf],
                    ones((size(communities)[1],
                          size(communities)[1]))) ones((4, size(communities)[2]))

@test_approx_eq α(communities, 0) len * mapslices(v -> 1. / sum(v),
                                                  communities, 1)

even = ones((len, cols)) / (len * cols);
qs = [0, 1, 2, 3, 4, 5, 6, Inf];
@test_approx_eq Ā(even, qs) len * ones((1, length(qs)))
@test_approx_eq A(even, qs) len * cols * ones((1, length(qs)))
