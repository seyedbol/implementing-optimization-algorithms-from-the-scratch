% File: GradienDescent.m
% -------------------------------------------------------------------
% This is your top-level function that calls the specific subroutine of
% gradient descent that you want to use.
%
% Inputs:
% - a:      Coefficient of the term (x - 1)^2 (See Eq 1 in pdf with 
%           instructions)
% - b:      Coefficient of the term y^2 (See Eq 1 in pdf with instructions)
% - w_init: Initial weights (ROW vector of size 1 x 2)
% - xi:     Parameter that controls which subroutine will be used for
%           solving the optimization problem. It can take the following
%           values:
%               xi == 0 -> Simple gradient descent
%               xi == 1 -> Use gradient descent with line search
%               xi == 2 -> Use conjugate gradient
% - diff:   Your code should stop if the difference of the euclidean norm
%           between two consecutive iterations is lower than this value.
% - num_iter: Your code should stop after reaching the maximum number of
%           iterations defined in this parameter.
%
% Outputs:
% - Weights: Matrix that contains the weights computed after every
%            iteration. The row Weights(i,:) contains the weights after the ith
%            iteration.
%       

function Weights = GradientDescent(a,b,w_init,xi,diff,num_iter)

Weights = [];
numIterations = -1;

% ====================== YOUR CODE HERE ======================

if(xi==0)%Simple gradient descent
    
Weights = PE5aSimpleGD(a,b,w_init,diff,num_iter) ;

end
%-----------
if(xi==1)%gradient descent with line search
    
Weights = PE5aGDLineSearch(a,b,w_init,diff,num_iter) ;

end
%-----------
if(xi==2)%conjugate gradient
    
Weights = PE5aConjugateGradient(a,b,w_init,diff,num_iter) ;

end

% ============================================================
numIterations= size(Weights,1) ;
fprintf(['Number of iterations: ', num2str(numIterations),'\n']);
end