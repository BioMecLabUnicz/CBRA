function x0 = x0_found(params, constant_vector, i)
  
% Basta gestire due semplici casi:
% 1. Caso1: modello classico delle troponine e della stima del tempo
% 2. Caso2: modello esteso alle ck-mb

   x0 = zeros(1,3);

   index_est = i.index_est;
   index_const = i.index;
   n_param = i.npar;
   params = 10.^(params);
   
   if n_param == 5  % 5 = modello originale in cui stimo solo la troponina 6 = stimiamo anche il tempo
       if (length(find(ismember(index_est, [6 7])==1))==2) % stiamo stimando tra i parametri, tutti quelli che formano il vettore della condizione iniziale
           
           x0 = [params(end-1) params(end) 0]';
           
       elseif isempty(find(index_est == 6))~=0 % abbiamo da stimare solo il valore
           
           x0 = [params(end-1) constant_vector(7) 0]';
       
       elseif isempty(find(index_est == 7))~=0 % abbiamo da stimare solo il valore
           
           x0 = [constant_vector(6) params(end) 0]';    
           
       elseif(length(find(ismember(index_const, [6 7])==1))==2) % entrambi sono posti a valori costanti
           
           x0 = [constant_vector(6) constant_vector(7) 0]';    
          
       end
       
   elseif n_param == 6
       

      
       if (length(find(ismember(index_est, [6 7])==1))==2) % stiamo stimando tra i parametri, tutti quelli che formano il vettore della condizione iniziale
           
           x0 = [params(end-2) params(end-1) 0]';
           
       elseif isempty(find(index_est == 6))~=0 % abbiamo da stimare solo il valore
           
           x0 = [params(end-2) constant_vector(7) 0]';
       
       elseif isempty(find(index_est == 7))~=0 % abbiamo da stimare solo il valore
           
           x0 = [constant_vector(6) params(end-1) 0]';    
           
       elseif(length(find(ismember(index_const, [6 7])==1))==2) % entrambi sono posti a valori costanti
           
           x0 = [constant_vector(6) constant_vector(7) 0]';    
          
       end
       
   elseif n_param == 8 % modello in cui stimiamo la CK-MB e la troponina
       
       if (length(find(ismember(index_est, [6 7 8])==1))==3) % stiamo stimando tra i parametri, tutti quelli che formano il vettore della condizione iniziale
           
           x0 = [params(end-2) params(end-1) 0 params(end) 0]';
           
       elseif isempty(find(index_est == 6))~=0 % abbiamo da stimare solo il valore
           
           x0 = [params(end-2) constant_vector(7) 0 constant_vector(8) 0]';
       
       elseif isempty(find(index_est == 7))~=0 % abbiamo da stimare solo il valore
           
           x0 = [constant_vector(6) params(end-1) 0 constant_vector(7) 0]';
       
       elseif isempty(find(index_est == 8))~=0 % abbiamo da stimare solo il valore
           
           x0 = [constant_vector(6) constant_vector(7) 0 params(end) 0]';       
       
       elseif(length(find(ismember(index_est, [6 7])==1))==2) % entrambi sono posti a valori costanti
           
           x0 = [params(end-2) params(end-1) 0 constant_vector(8) 0]';    
       
       elseif(length(find(ismember(index_est, [7 8])==1))==2) % entrambi sono posti a valori costanti
           
           x0 = [constant_vector(6) params(end-1) 0 params(end) 0]';              
       
       elseif(length(find(ismember(index_est, [6 8])==1))==2) % entrambi sono posti a valori costanti
           
           x0 = [params(end-2) constant_vector(7) 0 params(end) 0]';   
       
       elseif(length(find(ismember(index_constant, [6 7 8])==1))==3) % entrambi sono posti a valori costanti
           
           x0 = [constant_vector(6) constant_vector(7) 0 constant_vector(8) 0]';   
       end
       
   end
      
end

