function obj = Obj(params, data, time_pat, constant_vector, i)
% =========================================================================
%  Cost function. This function receives as input:
%         params: estimated parameters
%         ctnt: experimental cTnT data;
%         ckmb: experimental CK-MB data;   
%         time_pat: acquisition time;
% =========================================================================

    t_vec = linspace(0,time_pat(end)*1.6,201);
    
    x0 = x0_found(params, constant_vector, i);

    if size(data, 1) == 1
        
        [T, X] = ode23(@(t,x) odefun(t,x,params, constant_vector), t_vec, x0);
    
        if isempty(find(i.index_est == 9))~=0
            
            cTnT_sim = interp1(T + params(end), X(:,3),time_pat); 
            
        elseif isempty(find(i.index == 9))~=0
            
            cTnT_sim = interp1(T + constant_vector(end), X(:,3),time_pat); 
        else
            cTnT_sim = interp1(T, X(:,3),time_pat); 
        
        end
            obj = sum(((data - cTnT_sim).^2).*data);

        
    else
        
        [T, X] = ode23(@(t,x) odefun(t,x,params, constant_vector), t_vec, x0);

        cTnT_sim = interp1(T, X(:,3),time_pat);       
        CKMB_sim = interp1(T, X(:,5),time_pat); 

        maxObj1 = max([data(1,:) cTnT_sim]);
        maxObj2 = max([data(2,:) CKMB_sim]);

        obj1 = sum((((data(1,:)./maxObj1 - cTnT_sim./maxObj1)).^2));
        obj2 = sum((((data(2,:)./maxObj2 - CKMB_sim./maxObj2)).^2));

        obj = (obj1 + obj2);
        
    end
    
end