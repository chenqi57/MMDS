#include <RcppCommon.h>
#include <RcppArmadillo.h>

// [[Rcpp::depends("RcppArmadillo")]]
// [[Rcpp::export]]

arma::vec getEigenValue(const arma::mat &M) {
  arma::vec eigval;
  arma::mat eigvec;
  
  eig_sym(eigval, eigvec, M);
  return eigval;
};

// [[Rcpp::export]]

arma::mat getEigenVector(const arma::mat &M) {
  arma::vec eigval;
  arma::mat eigvec;
  
  eig_sym(eigval, eigvec, M);
  return eigvec;
};

// [[Rcpp::export]]
SEXP getEigen(const arma::mat &M) {
  arma::vec eigval;
  arma::mat eigvec;
  
  eig_sym(eigval, eigvec, M);
  return Rcpp::wrap(Rcpp::List::create(Rcpp::Named("val") = eigval,
                                       Rcpp::Named("vec") = eigvec));
};
