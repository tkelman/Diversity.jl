# Diversity
  [![Build Status](https://travis-ci.org/richardreeve/Diversity.jl.svg?branch=master)](https://travis-ci.org/richardreeve/Diversity.jl)
  [![Coverage Status](https://img.shields.io/coveralls/richardreeve/Diversity.jl.svg)](https://coveralls.io/r/richardreeve/Diversity.jl?branch=master) [![Documentation Status](https://readthedocs.org/projects/diversityjl/badge/?version=stable)](http://diversityjl.readthedocs.org/en/latest/?badge=stable) [![Documentation Status](https://readthedocs.org/projects/diversityjl/badge/?version=latest)](http://diversityjl.readthedocs.org/en/latest/?badge=latest)

- **Current Release**: 
  [![Diversity](http://pkg.julialang.org/badges/Diversity_0.3.svg)](http://pkg.julialang.org/?pkg=Diversity&ver=0.3)
  [![Diversity](http://pkg.julialang.org/badges/Diversity_0.4.svg)](http://pkg.julialang.org/?pkg=Diversity&ver=0.4)
  [![Diversity](http://pkg.julialang.org/badges/Diversity_0.5.svg)](http://pkg.julialang.org/?pkg=Diversity&ver=0.5)

**Diversity** is a [Julia](http://www.julialang.org) package that
provides functionality for measuring alpha, beta and gamma diversity
of supercommunities (e.g. ecosystems) and their constituent
subcommunities. It uses the diversity measures described in the arXiv
paper [arXiv:1404.6520 (q-bio.QM)](http://arxiv.org/abs/1404.6520),
*How to partition diversity*. It also provides a series of other
related and older diversity measures through sub-modules. Currently
these are all ecological diversity measures, but this will be expanded
through interfacing to BioJulia.

This package is still in alpha, and so we do not guarantee its
correctness, although we are aware of no issues with it. Please
[raise an issue](https://github.com/richardreeve/Diversity.jl/issues)
if you find any problems.

## Install

*Diversity* is in `METADATA` and can be installed via `Pkg.add("Diversity")`.

## Usage

#### Diversity

Accessing the main functionality in the package is simple:

```julia
using Diversity
...
diversities = supercommunityAbar(proportions, [0, 1, 2, Inf], Z)
diversity = supercommunityR(proportions, 2, Z)
```

The main package provides basic diversity measures (from
[Hill, 1973](http://www.jstor.org/stable/1934352)), and generalised alpha,
beta and gamma diversity measures at the level of the supercommunity and its
component subcommunities (these are extended from
[Reeve et al, 2014](http://arxiv.org/abs/1404.6520)).
There are also matching normalised and raw, alpha, beta and gamma
diversities at both the subcommunity and supercommunity level. The
functions exist both with unicode names preceded by D (e.g.
Dᾱ()), and with matching ascii names (e.g.
subcommunityalphabar()). We also provide a general function for extract any
diversity measure for a series of subcommunity relative abundances.
And we can calculate the proportions that subcommunities each
contribute to supercommunity diversity per subcommunity or per individual.
The full documentation can be found
[here](http://richardreeve.github.io/Diversity.jl/stable/diversity.html).

The package also provides sub-modules with other diversity measures:

#### Diversity.Ecology

We also replicate old ecological diversity measures and generalised
versions of them that relate to our general measures of alpha, beta
and gamma diversity at subcommunity and supercommunity measures. The
generalisations of the richness, Shannon and Simpson are the only
standard measures we are aware of whose subcommunity components sum
directly to the corresponding supercommunity measure (although note that
Simpson's index decreases for increased diversity, so small components
are more diverse).
Documentation for these diversity measures can be found
[here](http://richardreeve.github.io/Diversity.jl/stable/ecology.html).

#### Diversity.Hill

[Hill numbers](http://www.jstor.org/stable/1934352) are found in the
.Hill sub-module.
Documentation for these diversity measures can be found
[here](http://richardreeve.github.io/Diversity.jl/stable/hill.html).

#### Diversity.Jost

Lou Jost's
[diversity](http://dx.doi.org/10.1111/j.2006.0030-1299.14714.x)
[measures](http://www.esajournals.org/doi/abs/10.1890/06-1736.1) are
found in the .Jost sub-module.
Documentation for these diversity measures is
[here](http://richardreeve.github.io/Diversity.jl/stable/jost.html).

## Documentation

Documentation is generated by the Base documentation or the
[Docile](https://github.com/MichaelHatherly/Docile.jl) package
depending on Julia version, and available in Julia and on the web
through the [Lexicon](https://github.com/MichaelHatherly/Lexicon.jl)
package.

### Usage

Accessing the documentation in Julia is easy in v0.4 onwards:

```julia
using Diversity

# Returns any documentation for the qDZ function and all qDZ methods
?qDZ

# Returns the specific documentation for that qD method call
?qD([0.1, 0.2, 0.7], 2)
```

The documentation is also available online.

### Stable branch

The online documentation for the current stable branch is
[here](http://diversityjl.readthedocs.org/en/stable/diversity/), and
API docs start
[here](http://diversityjl.readthedocs.org/en/stable/api/Diversity/).

### Master branch

The online documentation for the latest master (unreleased) branch is
[here](http://diversityjl.readthedocs.org/en/latest/diversity/), and
API docs start
[here](http://diversityjl.readthedocs.org/en/latest/api/Diversity/).
