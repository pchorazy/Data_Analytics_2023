data {
    int M;      // years analyzed 
    int y[M];   // fatal accidents
}

parameters {
    real<lower=0> lambda;
}

model {
    lambda ~ normal(0,121);
    for (m in 1:M) {
        y[m] ~ poisson(lambda);
    }
}

generated quantities {
   int y_sim[M];
   for(m in 1:M) {
    y_sim[m] = poisson_rng(lambda);
   }
}