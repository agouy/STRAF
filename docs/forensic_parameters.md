# Forensic parameters

__WORK IN PROGRESS__

In this chapter, we'll introduce a few equations. Do not be afraid! Each of them will
be translated to plain English.

## Random match probability (PM)

The __Random match probability__, or probability of matching (PM), is defined as
the probability of observing a random match between two individuals.

__Formula__

$$
PM = \sum_i (G_i)^2,
$$
where $G_i$ is the frequency of the genotype $i$ at a given locus in the population.

__Interpretation__

Computing $PM$ means calculating, for a given locus, the frequency of each 
genotypes. Then we take the sqaure of each frequency, i.e. we multiply it by itself.
Finally, we sum the values of each genotype.

The intuition behind it is that if we have a random match in a population by looking
at a singly locu, it means that our two samples have the same genotype at that locus.
In terms of probability, this will happen as many times as we .
The probability of sampling a specific genotype in the population is equal to its frequency.

Say the genotype "12-14" has a frequency of 5% in the population, the probability of
having a random match between two individuals having the same genotype is 0.05 x 0.05.
To get an overall probability of matching, we sum this over all possible genotypes
in our population.

## Power of Discrimination (PD)

The power of discrimination (PD) is defined as the probability of
discriminating between two unrelated individuals.

__Formula__

$$
PD = 1 - PM
$$

__Interpretation__

PD is simply 1 - PM. Instead of looking at the probability of matching, we are
interested in the probability of "not matching", i.e. the probability of discrimination.

## Gene diversity

Genetic diversity ($GD$), or expected heterozygosity ($H_{\mathrm{exp}}$), is 
computed using the following estimator:

__Formula__

$$
  H_{\mathrm{exp}} = GD = \frac{n}{n - 1} \left( 1 - \sum_{i=1}^{n}(p_i)^2 \right),
$$

where $n$ is the number of gene copies sampled and $p_i$ is the
frequency of the $i^{th}$ allele in the population.

__Interpretation__

Coming soon.

## Polymorphism Information Content (PIC)

Polymorphism Information Content (PIC) can be interpreted as:
* the probability that the maternal and paternal alleles of a child are
deducible
* or, the probability of being able to deduce which allele a
parent has transmitted to the child.

__Formula__

$$
PIC = 1 - \sum_{i=1}^{n} p_i^2 - \sum_{i=1}^{n-1} \sum_{j=i+1}^{n} 2p_i^2p_j^2,
$$
where $p_i$ and $p_j$ are allele frequencies.

__Interpretation__

Coming soon.

## Power of Exclusion (PE)

__Formula__

The power of exclusion ($PE$) is defined as:

$$
PE = h^2\left(1 - 2hH^2\right),
$$
where $h$ is the proportion of heterozygous individuals and $H$ the
proportion of homozygous individuals in the population sample.

__Interpretation__

Coming soon.

## Typical Paternity Index (TPI)

Finally, the typical paternity index ($TPI$) reflects the “mean PI for
random non-excluded men“ for a given locus. 

__Formula__

Let $H$ be the frequency of homozygotes, then

$$
PE = \frac{1}{2H}
$$

__Interpretation__

Coming soon.
