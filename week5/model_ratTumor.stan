data {
  int<lower = 0> n;
  int y[n];
  int N[n];
}
parameters {
  real<lower = 0> s;
  real<upper = 0> mu;
  vector[n] theta;
}
model {
  mu ~ uniform(0, 1);
  s ~ lognormal(4, 4);
  theta ~ beta(mu*s, s - mu*s);

  y ~ binomial(N, theta);
}
