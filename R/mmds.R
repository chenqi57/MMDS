eigen_centered <- function(X){
  centered_XT = center_scale(t(X))
  S = t(centered_XT) %*% centered_XT
  S
}

MMDS <- function(X, MM=2, sigma, centered=TRUE){
  N = dim(X)[1]
  d = dim(X)[2]
  K = min(N,d)
  c = d/N

  if (centered){
    Eigen = eigen(X%*%t(X))
  }
  else{
    Eigen = eigen_centered(X)
  }

  eigenvalue = Eigen$value
  eigenvector = Eigen$vector
  eigen = eigenvalue[1:K]

  if(missing(sigma)){
    r = 2
    lambda.plus = (1+sqrt(c))^2
    sigma = (lambda.plus*N)^(-0.5)*eigen[r+1]
  }

  phi <- function(x){
    return(sqrt((x^(-2)+1)*(x^2+c)))
  }

  phi_inv <- function(x){
    f <- function(y){
      return(phi(y)-x)
    }
    if(x > 1+sqrt(c)){return(uniroot(f, c(c^(1/4), 10000))$root)}
    else{return(0)}
  }

  nonlinear_tran <- function(x){
    return(sigma*sqrt(N)*phi_inv(x/(sigma*sqrt(N))))
  }

  singular_MM <- rep(0, MM)
  for(i in 1:MM){
    singular_MM[i] <- nonlinear_tran(eigen[i])
  }

  eigenvector[,1:MM]%*%diag(singular_MM)
}

MMDS.cpp <- function(X, MM=2, sigma, centered=TRUE){
  N = dim(X)[1]
  d = dim(X)[2]
  K = min(N,d)
  c = d/N

  if (centered){
    S = X%*%t(X)
  }
  else{
    S = eigen_centered(X)
  }

  eigenvalue = rev(getEigenValue(S))
  eigenvector = as.matrix(rev(as.data.frame(getEigenVector(S))))
  eigen = eigenvalue[1:K]

  if(missing(sigma)){
    r = 2
    lambda.plus = (1+sqrt(c))^2
    sigma = (lambda.plus*N)^(-0.5)*eigen[r+1]
  }

  phi <- function(x){
    return(sqrt((x^(-2)+1)*(x^2+c)))
  }

  phi_inv <- function(x){
    f <- function(y){
      return(phi(y)-x)
    }
    if(x > 1+sqrt(c)){return(uniroot(f, c(c^(1/4), 10000))$root)}
    else{return(0)}
  }

  nonlinear_tran <- function(x){
    return(sigma*sqrt(N)*phi_inv(x/(sigma*sqrt(N))))
  }

  singular_MM <- rep(0, MM)
  for(i in 1:MM){
    singular_MM[i] <- nonlinear_tran(eigen[i])
  }

  eigenvector[,1:MM]%*%diag(singular_MM)
}


