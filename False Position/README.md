# False Position
MATLAB function to convert a square matrix into an upper triangular matrix and a lower triangular matrix, such that A = L*U.

`function [root, fx, ea, iter] = falsePosition (func, xl, xu, es, maxit, varargin)`

<dl>
  <dt>INPUTS</dt>
  <dd>func = function being evaluated</dd>
  <dd>xl = lower guess</dd>
  <dd>xu = upper guess</dd>
  <dd>es = desired relative error (default of 0.0001%)</dd>
  <dd>maxit = maximum number of iterations (default of 200)</dd>
  <dd>varargin = additional parameters used by the function</dd>
  
  <dt>OUTPUTS</dt>
  <dd>root = estimated root location</dd>
  <dd>fx = function evaluated at root location</dd>
  <dd>ea = approximate relative error (%)</dd>
  <dd>iter = number of iterations were performed</dd>
</dl>
