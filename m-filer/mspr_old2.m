% 
% Exercise 1: Let A = [0 2;0 2] and define T : R2 to R2 by T(x) = Ax. 
% Find the images under T of u=[1 -3]T and v=[ab]T.
A = eye(2)*2
u = [1 -3 ]'
x = A\u
x = ref([A u])

display('The same applies for vector v. x = [a/2 b/2]T')
pause;

% Let T (x) = Ax, and
% Find a vector x whose image under T is b, and determine whether x is unique.
A = [1 0 -2 ; -2 1 6 ; 3 -2 -5 ]
b = [-1 -7 -3 ]'
Ab_red = ref([A b])
x = A\b
display('x is unique which is seen from the reduced Ab matrix, since it has full rank.')
pause;

% Solve Ax = b using LU factorization and by ordinary row reduction, with
A = [4 3 -5 ; -4 -5 7 ; 8 6 -8 ]
b = [2 -4 6 ]'
Ab_red = ref([A b])
[L,U] = ref_lu(A)
Lb_red = ref([L b])
y = Lb_red(:,end)
Uy_red = ref([U y])
x = Uy_red(:,end)
pause;

% Compute determinants using cofactor expansion both across the first row and down the second column. 
A = [3 0 4 ; 2 3 2 ; 0 5 -1 ]
detA = det(A)
detA = (-1)^(1+1) * 3*(3*(-1)-5*2) + (-1)^(1+3) * 2*(5*4-0)
detA = (-1)^(2+2) * 3*((-1)*3-0*4) + (-1)^(3+2) * 5*(2*3-4*2)

B = [ 2 -4  3 ; ...
      3  1  2 ; ...
      1  4 -1 ]
detB =  det(B)
detB = (-1)^(1+1) * 2  * (1*(-1)-4*2)   + (-1)^(1+2) * (-4) * ((-1)*3-2*1)   + (-1)^(1+3) * 3 *(3*4-1*1)
detB = (-1)^(1+2) *(-4)* (3*(-1)-(1*2)) + (-1)^(2+2) *    1 *( 2*(-1)-3*1)   + (-1)^(3+2) * 4 *(2*2-3*3)

% Compute detA by row reduction to echelon form.
A = [1 5 -6 ; -1 -4 4 ; -2 -7 9 ]
detA = det(A)
[p,L,U] = ref_plu(A)
diagU = prod(diag(U))
pause;
%  Use determinants to check if A is invertible.
A = [2 3 0 ; 1 2 1 ; 1 2 1 ]
detA = det(A)
display('Since determinant != 0, A is invertible')
pause;

% Use Cramer's rule to compute the solutions of 
%   3x1 - 2x2 =  7  
%  -5x1 + 6x2 = -5
%% and
%  -5x1 + 3x2 = 9 
%   3x1 - x2 = -5.
A = [5 -3 ; ...
     3 -2 ]
b = [9 -5]'
A1b=A; A1b(:,1) = b 
A2b=A; A2b(:,2) = b
x1 = det(A1b)/det(A)
x2 = det(A2b)/det(A)

