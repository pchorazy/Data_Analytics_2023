data {
    int<lower=0> N;
    int<lower=0, upper=N> y;
}

parameters {
    real<lower=0, upper=1> p;
}

model {
    p ~ beta(2,8);     // prior  
    y ~ binomial(N, p); // binomial likelihood and prior (selected using prior predictive distribution) are defined in the model block.
}

generated quantities {
    int<lower=0, upper=N> y_pred;
    y_pred = binomial_rng(N, p);
}