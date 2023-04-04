// data {
//     int<lower=0> N; // Number of samples
//     real weight[N];
// }

// parameters {
//     real alpha;
//     real beta_val;
// }

// transformed parameters {
//     for (n in 1:N) {
//         real mu[N];
//         mu[n] = alpha + beta_val * weight[n];
//     }


// }

// model {
//   alpha ~ normal(175,15);
//   beta_var ~ normal(0,1);
  
//   // Likelihood
//   heights ~ normal(mu, sigma); // Normal likelihood with mean height and standard deviation
  
// }

// generated quantities {
//   real height[N]; // Posterior sample of height
  
//   height = normal_rng(mu, sigma); // Sample a posterior sample of height
// }





data {
  int<lower=0> N; // Number of samples
  real weight[N]; // Weight samples
}

parameters { 
    real mu; // Mean height
    real<lower=0> sigma; // Standard deviation of height
    real alpha;
    real beta_val;
}

transformed parameters {
    real mu_vect[N];
    for (n in 1:N) {
        
        mu_vect[n] = alpha + beta_val * weight[n];
    }
}

model {
    mu ~ normal(175, 10); // Prior for mean height
    sigma ~ normal(10, 5); // Prior for standard deviation of height

    alpha ~ normal(175,15);
    beta_val ~ normal(0,1);
  
}



generated quantities {
    real height_sample; // Posterior sample of height
    for (n in 1:N) {
        height_sample = normal_rng(mu_vect[n], sigma); // Sample a posterior sample of height
    }
}



