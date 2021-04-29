# Incremental Search
MATLAB function to search for the root of a function within closed bounds.

`function [xb] = incsearch (func, xmin, xmax, ns)`

<dl>
  <dt>INPUTS</dt>
  <dd>func = function evaluated</dd>
  <dd>xmin = lower guess</dd>
  <dd>xmax = upper guess</dd>
  <dd>ns = increment length</dd>
  
  <dt>OUTPUTS</dt>
  <dd>xb = matrix of brackets where a root may occur</dd>
</dl>
