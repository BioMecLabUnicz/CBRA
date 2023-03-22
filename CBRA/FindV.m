function v = FindV(vector, table, f)
% =========================================================================
%  Name        : FindV 
%  Since       : 2019
%  Author      : Anna Procopio <anna.procopio@unicz.it>
%  Description : FindV module to generate Italian fiscal codes
%  ========================================================================    
    v = 0;
    
    for i = 1 : length(vector)
        
        index = find(ismember(table.carattere,vector(i)) == 1);
        
        if index~=0
            if f == 0 % pari
                 v = v + table.pari(index);
            else
                 v = v + table.dispari(index);
            end
        end
    end


end