data {
   int M;
   array[M] real <lower = 0> ni;
   array[M] int <lower = 0> yi;
   real alpha;
}

parameters {
   real<lower=0> theta;
}

model {
   theta ~ normal(0, 0.021);
   for (i in 1:M) {
    yi[i] ~ poisson(alpha + theta * ni[i]);
   }
}

generated quantities {
   int y_sim[M];
   for (i in 1:M) {
      y_sim[i] = poisson_rng(alpha + theta * ni[i]);
   }
}