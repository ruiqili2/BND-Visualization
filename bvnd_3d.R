mu1 = 0
mu2 = 0
s11 = 10
s12 = 15
s22 = 10
rho = 0.5

x1  = seq(-10, 10, length = 41)
x2 = x1

bvnd = function(x1, x2) {
  term1<-1 / (2 * pi * sqrt(s11 * s22 * (1 - rho ^ 2)))
  term2<--1 / (2*(1 - rho ^ 2))
  term3<-(x1 - mu1) ^ 2 / s11
  term4<-(x2 - mu2) ^ 2 / s22
  term5<--2 * rho * ((x1 - mu1) * (x2 - mu2)) / (sqrt(s11) * sqrt(s22))
  term1 * exp(term2 * (term3 + term4 - term5))
}

z = outer(x1, x2, bvnd)
z
persp.im(x1,
      x2, 
      z,
      main="Two dimensional Normal Distribution",
      col="darkorange",
      theta=30,
      phi=20,
      r=100,
      d=0.1,
      expand=0.5,
      ltheta=90,
      lphi=180,
      shade=0.75,
      ticktype="detailed",
      nticks=5
)
