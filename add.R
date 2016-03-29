library(Rcpp)
#> 
#> Attaching package: 'Rcpp'
#> 
#> The following object is masked from 'package:inline':
#> 
#>     registerPlugin
cppFunction(
'int add(int x, int y, int z) {
  int sum = x + y + z;
  return sum;
}'
)
# add works like a regular R function
add

#> function (x, y, z) 
#> .Primitive(".Call")(<pointer: 0x7f2f4aa933d0>, x, y, z)
add(1, 2, 3)
#> [1] 6

cppFunction('int one() {
  return 1;
}')


cppFunction('int signC(int x) {
  if (x > 0) {
    return 1;
  } else if (x == 0) {
    return 0;
  } else {
    return -1;
  }
}')


cppFunction('
double sumC(NumericVector x) {
    int n = x.size();
    double total = 0;
    for(int i = 0; i < n; ++i) {
        total += x[i];
    }
    return total;
}'
)

cppFunction('
NumericVector eclud(double x, NumericVector ys){
    int n = ys.size();
    NumericVector out(n);

    for(int i = 0; i < n; ++i){
        out[i] = sqrt(pow(x-ys[i], 2.0));
    }
    return out;
}')
