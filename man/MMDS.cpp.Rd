\name{MMDS.cpp}
\alias{MMDS.cpp}
\title{Modified Multi-dimensional Scaling Algorithm using C++ for Eigen-decomposition}
\usage{
MMDS.cpp(X, MM = 2, sigma, centered = TRUE)
}
\arguments{
\item{X}{A d by n sample matrix with each column being a sample and each row being a variable.}
\item{MM}{The embedding dimension, a positive integer from 1 to d. The default value is 2.}
\item{sigma}{The noise standard deviation \eqn{\sigma}. If \eqn{\sigma} is unknown, the function will estimate it by eigen-values.}
\item{centered}{Whether the sample matrix X is centered. The default value is TRUE.}
}
\value{
A n by MM low-dimensional embedded sample matrix.
}
\description{
The function returns the MMDS embedding samples of X with embedding dimension MM.
}
\details{
The sample matrix X is a d by n matrix, where d is the dimension of each observed data point and n is the number of such data points. The embedding dimension MM is a positive integer from 1 to d. The output will be a n by MM matrix which is the MMDS embedding samples of X with embedding dimension MM. The function itself will estimate sigma if the noise standard deviation \eqn{\sigma} is unknown, and will centeralize X if the user specifies X is not centered.
}
\examples{
set.seed(496)
n = 10
d = 20
X = matrix(rnorm(d * n), n, d)
MMDS.cpp(X, MM = 2, centered = FALSE)
}