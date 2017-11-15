# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


plot2D = function(mu1, mu2, s11, s22, rho) {

  x1  = seq(-20, 20, length = 41)
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
  plot_ly(z = z, type = "contour")
}

plot3D = function(mu1, mu2, s11, s22, rho) {
  if (!requireNamespace("plotly", quietly = TRUE)) {
    stop("'plotly' package needed for this function to work. Please install it.",
         call. = FALSE)
  }
  x1  = seq(-20, 20, length = 41)
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
  plot_ly(x = x1, y = x2, z = z) %>% add_surface()
}
