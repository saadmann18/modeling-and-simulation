%3(c) Write a Matlab program that calculates the approximate derivative of
%              e^ix ? e^?ix
%     f(x) =   -------------
%                   2i
% 
%     at the position x = 1.0 for h = 2^?n with n = 1, 2, . . . , 60 using the forward and central
%     finite difference schemes (i is the imaginary unit). Plot (on a logarithmic y-scale using the
%     \semilogy" command) the relative errors of both methods compared to the exact result
%     as a function of n. Add plots of h and h2 as the function of n to the same figure (so four
%     curves in one figure in total). Add axis labels, title, and legends on the figure. (4P)
for i=1:60
    StepSize(i) = 2^(-i);           %h
    StepSize2(i) = 2^(-2*i);       %h^2

    forwdDiff(i) = (sin(1.0+StepSize(i))-sin(1.0))/2^(-i); 

    centDiff(i) = (sin(1.0+(StepSize(i)/2))-sin(1.0-(StepSize(i)/2)))/StepSize(i); 

    exactderiv(i) = cos(1.0);   

    rel_err_Forw(i) = abs((forwdDiff(i)-exactderiv(i))/exactderiv(i));

    rel_err_Cent(i) = abs((centDiff(i)-exactderiv(i))/exactderiv(i));			

end
n=1:60;
semilogy(n, rel_err_Forw, 'g' ,n, rel_err_Cent,'k--', n, StepSize, 'r:', n, StepSize2, 'c-.');
title('Comparison btwn Fd Diff & Central Diff');
xlabel('n-->')
ylabel('Relative err & h-->');
legend('Forward Relative err', 'Central Relative Err', 'h', 'h^2', 'location', 'southeast');
