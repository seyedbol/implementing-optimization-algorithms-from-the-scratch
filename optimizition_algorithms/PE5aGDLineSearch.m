% Implement in this file your routine for optimizing the Eq 1 on the pdf
% with instructions using gradient descent with line search. The 
% inputs/outputs are up to you.
function[X_star] = PE5aGDLineSearch(a,b,W_initial,tolerance,n_iterations)

%--weights in each step will be saved in a row
w=zeros(n_iterations,2) ;
w(1,1)=W_initial(1,1) ;
w(1,2)=W_initial(1,2) ;
%---direction in each step will be saved in a row
d=zeros(n_iterations,2) ; 
d(1,1)= 2*a*(w(1,1)-1) ;%initial gradient x direction
d(1,2)= 2*b*w(1,2) ;%initial gradient y direction
%------------
i=1 ;
%---g initialization
while( 1 ) 
g(i,:)= [2*a*(w(i,1)-1), 2*b*w(i,2)] ;%gradient    g(i,1) g(i,2) w(i,1) w(i,2)
if(( (2*a*(g(i,1)^2))+(2*b*( g(i,2)^2 )) )==0)
    Alpha=0 ;
else
Alpha=( 2*b*g(i,2)*w(i,2)+2*a* g(i,1)*w(i,1)-2*a*g(i,1) )/( (2*a*(g(i,1)^2))+(2*b*( g(i,2)^2 )) );%%argmin f in each step 
end
w(i+1,:)=w(i,:)-Alpha*d(i,:) ;
d(i+1,1)= 2*a*(w(i+1,1)-1)  ;
d(i+1,2)= 2*b*w(i+1,2)      ;

%--convergence condition, it would break the loop if this condition is satisfied
if(norm( w(i+1,:)-w(i,:) )<tolerance||i==n_iterations)
    break ;
end
%--------------
i=i+1 ;
end
X_star=w(1:i,:) ;

end