function [d_shortest,path]=shortest_path(W, j_start, j_target)
    n=size(W,1);     % number of nodes
    d=Inf*ones(1,n); % shortest distances to elements so far
    d(j_start)=0.0;  % initial element has distance 0
    v=zeros(1,n);    % visited flags (0 or 1)
    p=zeros(1,n);    % shortest path precedessor for each element
    j=j_start;       % start with initial element
    while (j~=j_target)
        v(j)=1; % mark as visited
        for i=1:n% loop over all unvisited neighbors
            if((v(i)==0)&&(W(j,i)>0))
                a=d(j)+W(j,i); %distance to j via i
                if a<d(i) %if shorter
                    d(i) = a; %store
                    p(i) = j; %and mark as predecessor
                end
            end
        end

        % as next element pick the unvisited with shortest path so far
        a=Inf;
        for i=1:n
            if ( (v(i)==0) && (d(i)<a) )
                a=d(i);
                j=i;
            end
        end        
    end
   d_shortest=d(j_target);
   
   % construct sequence of elements for shortest path
   path=[j_target];
   while path(1)~=j_start
       path=[p(path(1)), path];
   end
end
