% Implement in this file your routine for optimizing the Eq 1 on the pdf
% with instructions using conjugate gradient. The inputs/outputs are up to
% you.
function[X_star]= PE5aConjugateGradient(a,b,W_initial,tolerance,n_iterations)

%--weights in each step will be saved in a row
w=zeros(n_iterations,2) ;
w(1,1)=W_initial(1,1) ;
w(1,2)=W_initial(1,2) ;
%---direction in each step will be saved in a row
d=zeros(n_iterations,2) ; 
d(1,1)= -2*a*(w(1,1)-1) ;%initial gradient x direction
d(1,2)= -2*b*w(1,2) ;%initial gradient y direction
%---hessian
i=1 ;
H=[2*a 0;0 2*b] ;%hessian matrix
%---gradient initialization
g(1,:)= [2*a*(w(1,1)-1), 2*b*w(1,2)] ;
%---
while( 1 )  
   
if(d(i,:)==0) %to avoid zero in denominator
    Alpha=0 ;
else
Alpha=-dot(d(i,:),g(i,:))/( d(i,:)*H*d(i,:)' ) ;%%formula to calculate alpha based on hessian
end
w(i+1,:)=w(i,:)+Alpha*d(i,:);
g(i+1,:)= [2*a*(w(i+1,1)-1), 2*b*w(i+1,2)] ;
%---------------------
if(g(i+1,:)==0) %to avoid zero in denominator
Beta=0 ;
else
Beta=dot( g(i+1,:),(g(i+1,:)-g(i,:)) )/dot(g(i+1,:),g(i+1,:)) ;%%%Polak-Ribiere version
end
d(i+1,:)=-g(i+1,:)+Beta*d(i,:) ;
%--convergence condition, it would break the loop if this condition is satisfied
if(norm( w(i+1,:)-w(i,:) )<tolerance||i==n_iterations)
    break ;
end
%--------------
i=i+1 ;
end
X_star=w(1:i,:) ;
disp(1)

 
end