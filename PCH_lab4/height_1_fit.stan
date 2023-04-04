data {
  int<lower=0> N; // Number of samples
  real heights[N]; // Observed heights
}

parameters {
  real mu; // Mean height
  real<lower=0> sigma; // Standard deviation of height
}

model {
  mu ~ normal(175, 10); // Prior for mean height
  sigma ~ normal(10, 5); // Prior for standard deviation of height
  
  // Likelihood
  heights ~ normal(mu, sigma); // Normal likelihood with mean height and standard deviation
  
}

generated quantities {
  real height_sample; // Posterior sample of height
  
  height_sample = normal_rng(mu, sigma); // Sample a posterior sample of height
}