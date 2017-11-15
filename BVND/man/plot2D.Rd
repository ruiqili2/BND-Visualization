\name{plot2D}
\alias{plot2D}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
create a 2D plot
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot2D(mu1, mu2, s11, s22, rho)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mu1}{
%%     ~~Describe \code{mu1} here~~
}
  \item{mu2}{
%%     ~~Describe \code{mu2} here~~
}
  \item{s11}{
%%     ~~Describe \code{s11} here~~
}
  \item{s22}{
%%     ~~Describe \code{s22} here~~
}
  \item{rho}{
%%     ~~Describe \code{rho} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (mu1, mu2, s11, s22, rho)
{
    library(plotly)
    library(magrittr)
    x1 = seq(-20, 20, length = 41)
    x2 = x1
    bvnd = function(x1, x2) {
        term1 <- 1/(2 * pi * sqrt(s11 * s22 * (1 - rho^2)))
        term2 <- -1/(2 * (1 - rho^2))
        term3 <- (x1 - mu1)^2/s11
        term4 <- (x2 - mu2)^2/s22
        term5 <- -2 * rho * ((x1 - mu1) * (x2 - mu2))/(sqrt(s11) *
            sqrt(s22))
        term1 * exp(term2 * (term3 + term4 - term5))
    }
    z = outer(x1, x2, bvnd)
    plot_ly(z = z, type = "contour")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
