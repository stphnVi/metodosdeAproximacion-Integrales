## Copyright (C) 2023 abner
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{value} =} romberg (@var{a}, @var{b}, @var{n}, @var{f})
##Esta función aproxima el valor de una integral definida de entre @var{a} y
##@var{b} utilizando el método de romberg
##@var{a}, @var{b} deben ser valores de punto flotante
##@var{n} debe ser un entero mayor a 1. Entre mayor sea @var{n}, mejor será la aproximación
## de la integral.
##@var{f} debe ser una funcion simbólica symfun
## @var{value} es el resultado de la aproximación de la integral
## @seealso{symfun}
## @end deftypefn

## Author: abner arroyo
## Created: 2023-11-24

function value = romberg (a, b, n,f)
  mustBeInteger(n);
  mustBeGreaterThanOrEqual(n,2);
  mustBeNumeric(a)
  mustBeNumeric(b)

  warning('off','all')
  R = ones(2,n-1);
  h = b-a;
  R(1,1) = (h/2)*(double(f(a))+double(f(b)));

  for i = 2:n
    trapezoidalMethodResult = 0;
    for k = 1:2^(i-2)
      trapezoidalMethodResult=trapezoidalMethodResult + double(f(a + (k-0.5)*h));
    endfor
    R(2,1) = 0.5*(R(1,1)+h*trapezoidalMethodResult);

    for j = 2:i
      R(2,j) = R(2,j-1)+(R(2,j-1)-R(1,j-1))/(4^(j-1)-1);
    endfor

    h = h/2;

    for j = 1:i
      R(1,j) = R(2,j);
    endfor

  endfor
  value = R(2,n-1);
endfunction
