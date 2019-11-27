data {
  int<lower = 0> n;
  real y[n];
}
parameters {
  real alpha;
  real theta[n];
}
model {
  alpha ~ p();

  for (i in 1:n) {
    theta[i] ~ p(alpha);
    y[i] ~ p(theta[i]);
  }
}
