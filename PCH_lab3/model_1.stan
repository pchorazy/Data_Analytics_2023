generated quantities {
  int<lower=0> N = 50;
  int<lower=0, upper=N> y;
  real<lower=0, upper=1> p = beta_rng(2, 8); // beta distribution as a prior
  y = binomial_rng(N, p);
}