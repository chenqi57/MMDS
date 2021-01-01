\name{eigen_centered}
\alias{eigen_centered}
\title{Sample Matrix Centralization for Eigen-decomposition}
\usage{
eigen_centered(X)
}
\arguments{
\item{X}{A \eqn{d} by \eqn{n} sample matrix with each column being a sample and each row being a variable.}
}
\value{
A \eqn{d} by \eqn{d} symmetric matrix which is \eqn{X}'s distance matrix after centralization.
}
\description{
The function centers the sample matrix \eqn{X} to \eqn{Y} and returns \eqn{Y}'s distance matrix for futher eigen-decomposition.
}
\details{
The sample matrix \eqn{X} is a \eqn{d} by \eqn{n} matrix, where \eqn{d} is the dimension of each observed data point and \eqn{n} is the number of such data points. The output \eqn{S} will be a \eqn{d} by \eqn{d} symmetric matrix.
}
\examples{
set.seed(496)
n = 10
d = 20
X = matrix(rnorm(d * n), n, d)
S = eigen_centered(X)
S
}