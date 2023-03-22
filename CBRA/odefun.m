 function d_concentration = odefun(t, x, params_log, constant_v)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% State Variable
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  cTnT

    Cs_ctnt = x(1);      % concentration of cTnT into sarcomere
    Cc_ctnt = x(2);      % concentration of cTnT into cytosol
    Cp_ctnt = x(3);      % concentration of cTnT into plasma
% cTnT
    
    assignin('base',"t", t)
    assignin('base',"x", x)
    assignin('base',"params_log", params_log)
    assignin('base',"constant_v", constant_v)
     ind = find(constant_v ~= 0);
     assignin('base',"ind", ind)
    if isempty(ind) == 1 && length(params_log)~=8

        a_log = params_log(1);
        b_log = params_log(2); 
        Tsc_log = params_log(3);
      
    elseif isempty(ind) ~= 1 && length(params_log)~=8
        
         
        constant = constant_v([1 2 5]);
        v = zeros(1, 3);
        [log_v, ind_v] = ismember([1 2 5], find(constant_v~=0));
        v(ind_v~=0) = log10(constant(ind_v~=0));
        v(ind_v==0) = params_log(ind_v==0);
        %v = log10(v);
        a_log = v(1);
        b_log = v(2);
        Tsc_log = v(3);
        
    elseif isempty(ind) == 1 && length(params_log)==8
        a_log = params_log(1);
        b_log = params_log(2); 
        deltaTsc_log = params_log(5);
        Tcp_log = params_log(4);
        c_log = params_log(3);  
        
    elseif isempty(ind) ~= 1 && length(params_log)==8
        constant = constant_v([1 2 3 4 5]);
        v = zeros(1, 5);
        [log_v, ind_v] = ismember([1 2 3 4 5], find(constant_v~=0));
        v(ind_v~=0) = log10(constant(ind_v~=0));
        v(ind_v==0) = params_log(ind_v==0);
%         v = log10(v);
        a_log = v(1);
        b_log = v(2); 
        deltaTsc_log = v(5);
        Tcp_log = v(4);
        c_log = v(3);    
    end
% cTnT

    Jsc_ctnt = (Cs_ctnt - Cc_ctnt);
    Jcp_ctnt = 10^(a_log)*(Cc_ctnt - Cp_ctnt);
    Jpm_ctnt = 10^(b_log)*Cp_ctnt;
    
% CK-MB    
    
if length(params_log)==8


    Cc_ck_mb = x(4);      % concentration of CK-MB into cytosol
    Cp_ck_mb = x(5);      % concentration of CK-MB into plasma

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
% Gamma functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    G_cp = t^3/(t^3 + 10^(3*(Tcp_log)));
    G_sc = t^3/(t^3 + 10^(3*(deltaTsc_log)) + 10^(3*(Tcp_log)));
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
% Flows between the compartments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    Jcp_ck_mb = 10^(c_log)*(Cc_ck_mb - Cp_ck_mb);
    Jpm_ck_mb = 10^(b_log)*Cp_ck_mb;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
% ODE 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

    dCs_ctnt_tau = - Jsc_ctnt*G_sc;
    dCc_ctnt_tau =   Jsc_ctnt*G_sc - Jcp_ctnt*G_cp;
    dCp_ctnt_tau =   Jcp_ctnt*G_cp - Jpm_ctnt;
    dCc_ckmb_tau = - Jcp_ck_mb*G_cp;
    dCp_ckmb_tau =   Jcp_ck_mb*G_cp - Jpm_ck_mb;
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
% Output of model: concentration value of cTnT and CK-MB into sarcomere,
% cytosol and plasma.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

    d_concentration = [dCs_ctnt_tau; dCc_ctnt_tau; dCp_ctnt_tau; dCc_ckmb_tau; dCp_ckmb_tau];
   
else
    G_sc = t^3/(t^3 + 10^(3*(Tsc_log)));
    dCs_ctnt_tau = - Jsc_ctnt*G_sc;
    dCc_ctnt_tau =   Jsc_ctnt*G_sc - Jcp_ctnt;
    dCp_ctnt_tau =   Jcp_ctnt - Jpm_ctnt;
    d_concentration = [dCs_ctnt_tau; dCc_ctnt_tau; dCp_ctnt_tau];
end

end