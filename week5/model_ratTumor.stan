data {
  int<lower = 0> n;
  int<lower = 0, upper = 50> y[n];
  int<lower = 0, upper = 100> N[n];
}
parameters {
  real<lower = 0> s;
  real<lower = 0, upper = 1> mu;
  real<lower = 0, upper = 1> theta[n];
}
model {
  s ~ lognormal(4, 2);
  mu ~ uniform(0, 1);
  theta ~ beta(mu*s, s - mu*s);

  y ~ binomial(N, theta);
}

