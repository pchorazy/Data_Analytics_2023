data {
    int M;          // years analyzed
    vector[M] ni;   // miles flown each year
}

generated quantities {
   real theta=fabs(normal_rng(0,0.021));
   int y_sim[M];
   for (m in 1:M) {
    y_sim[m] = poisson_rng(theta * ni[m]);
   }
}