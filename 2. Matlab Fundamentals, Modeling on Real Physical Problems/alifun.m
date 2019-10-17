function [max] = alifun(A)
  y = A(:);
  max = y(1);
%  min = y(1);
  for  i = 2:numel(y)
%      if min < y(i)
%          min = y(i)
     if  max > y(i)
         max = y(i)
     end
  end
end

% y =
% 
%     36   -24   -12    54
%     42    36   -24   -12
%      6    42    36   -24
%     18     6  -120    36