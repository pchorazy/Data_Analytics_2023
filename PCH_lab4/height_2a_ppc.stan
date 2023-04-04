data {
  int<lower=0> N; // Number of samples
  real weight[N]; // Weight samples
}

generated quantities {
  real alpha;
  real beta_var;
  real height_sample[N];
  
  alpha = normal_rng(175,15);
  beta_var = normal_rng(0,1);

  for (n in 1:N) {
    height_sample[n] = normal_rng(alpha + beta_var * weight[n], 15);
  }
}