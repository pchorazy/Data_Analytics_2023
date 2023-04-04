generated quantities {
  real mu = normal_rng(175,15);
  real sigma = normal_rng(15,5);
  real height_sim = normal_rng(mu, sigma);
}