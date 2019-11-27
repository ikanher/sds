data {
  int<lower = 0> N;
  int<lower = 0> M;
  real y[M, N];
}
parameters {
  real alpha;
  real theta[M, N];
  real mu[M];
}
model {
  alpha ~ p();

  for (m in 1:M) {
    mu[m] ~ p(alpha);

    for (n in 1:N) {
      theta[m, n] ~ p(mu[m]);
      y[m, n] ~ p(theta(m, n));
    }
  }
}
