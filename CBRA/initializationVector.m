function [parameter_init, new_lb, new_ub, i] = initializationVector(params, constant_vector, lb, ub)

     index_n = find(constant_vector == 0);
     index_p = find(params == 0);
     index = find(constant_vector ~= 0);
     
     if ((isempty(index)==1) & (ismember([3 4 8 9],find(params == 0))) & length(find(params == 0))==4) % Stimo tutti i parametri del modello solo troponina
         
         new_lb = [lb(1:2) lb(5:7)];
         new_ub = [ub(1:2) ub(5:7)];
         parameter_init = [params(1:2) params(5:7)];
         
     elseif ((isempty(index)==1) & (ismember([3 4 8],find(params == 0))) & length(find(params == 0))==3) % Stimo tutti i parametri del modello solo troponina che prevede 
                                                                                                             % anche l'identificazione del tempo di infarto
         new_lb = [lb(1:2) lb(5:7) lb(9)];
         new_ub = [ub(1:2) ub(5:7) ub(9)];
         parameter_init = [params(1:2) params(5:7) params(9)];   
         
     elseif ((isempty(index)==1) & (ismember(9,find(params == 0))) & length(find(params == 0))==1) % Stimo tutti i parametri del modello esteso che prevede la ricostruzione delle curve di
                                                                                                     % rilascio della troponina e della ck-mb
         new_lb = lb(1:8);
         new_ub = ub(1:8);
         parameter_init = params(1:8);          
     
     elseif (isempty(index)~=1) % Gestiamo i casi in cui ci sono dei parametri che non vengono fatti variare
         
         
         [e, v] = ismember(index_n, index_p);
         new_lb = lb(index_n(find(v == 0)));
         new_ub = ub(index_n(find(v == 0)));
         parameter_init = params(index_n(find(v == 0)));
     end
        [e, v] = ismember(index_n, index_p);
        i.index = index;
        i.index_n = index_n;
        i.index_p = index_p;
        i.index_est = index_n(find(v == 0));
        i.npar = length(find(params~=0));
     
end