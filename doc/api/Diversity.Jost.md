# Diversity.Jost


## Methods [Exported]

---

<a id="method__jostalpha.1" class="lexicon_definition"></a>
#### jostalpha{S<:AbstractFloat, T<:Number}(proportions::Array{S<:AbstractFloat, 2},  qs::Union{Array{T<:Number, 1}, T<:Number}) [¶](#method__jostalpha.1)
### Calculates Jost's alpha diversity

Calculates Jost's alpha diversity of a series of columns representing
independent community counts, for a series of orders, repesented as a
vector of qs. This is just the naive-community ecosystem diversity
divided by the naive-community beta diversity.

### Arguments:
- `proportions` relative proportions of different individuals / species
                in population (vector, or matrix where columns are
                for individual sub-communities)

- `qs` single number or vector of orders of diversity measurement

### Returns:
- array of diversities, first dimension representing sub-communities, and
  last representing values of q


*source:*
[Diversity/src/Jost.jl:22](file:///Users/richardr/.julia/v0.4/Diversity/src/Jost.jl)

---

<a id="method__jostbeta.1" class="lexicon_definition"></a>
#### jostbeta{S<:AbstractFloat, T<:Number}(proportions::Array{S<:AbstractFloat, 2},  qs::Union{Array{T<:Number, 1}, T<:Number}) [¶](#method__jostbeta.1)
### Calculates Jost's beta diversity

Calculates Jost's beta diversity of a series of columns representing
independent community counts, for a series of orders, repesented as a
vector of qs. This is just the naive gamma diversity divided by
Jost's alpha diversity

### Arguments:
- `proportions` relative proportions of different individuals / species
                in population (vector, or matrix where columns are
                for individual sub-communities)

- `qs` single number or vector of orders of diversity measurement

### Returns:
- array of diversities, first dimension representing sub-communities, and
  last representing values of q


*source:*
[Diversity/src/Jost.jl:49](file:///Users/richardr/.julia/v0.4/Diversity/src/Jost.jl)

