using Diversity

## jostD - calculate naive diversity of order q of a population with
## given relative proportions
##
## Arguments:
## - proportions - relative proportions of different individuals /
##                 species in population
## - qs - single number or vector of orders of diversity measurement
jostD = qD


## jostbeta - calculate Jost's beta diversity of multiple sub-communities
## Calculates Jost's beta diversity of a series of columns representing
## independent community counts, for a series of orders, repesented as
## a vector of qs. This is just the naive gamma diversity divided by
## the naive alpha diversity
##
## Arguments:
## - proportions - population proportions
## - qs - vector of values of parameter q
##
## Returns:
## - array of diversities, first dimension representing sub-communities, and
##   last representing values of q
function jostbeta{S <: FloatingPoint,
                  T <: Number}(proportions::Matrix{S}, qs::Union(T, Vector{T}))
    Ḡ(proportions, qs) ./ Ā(proportions, qs)
end

jostβ = jostbeta