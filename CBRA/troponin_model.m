function [T_stemi, X_stemi, params] = troponin_model(data, tempo, function_d, parameter, constant_vector, globalfunction, localfunction, number_point, lb, ub)
%     tic
    t_vec_stemi = linspace(0,tempo(end)+50,tempo(end)+51);
    
    [parameter_init, params_lb, params_ub, i] = initializationVector(parameter, constant_vector, lb, ub);
    
    %ind = find(parameter_init == 0);
    if lb(9) == 0 && ub(9) == 0
        params_init_log = log10(parameter_init);
    
%% Lower and Upper Bounds
        params_lb_log = log10(params_lb);
        params_ub_log = log10(params_ub);

    else
        params_init_log = [log10(parameter_init(1:end-1)) parameter_init(end)];

%% Lower and Upper Bounds

        params_lb_log = [log10(params_lb(1:end-1)) params_lb(end)];
        params_ub_log = [log10(params_ub(1:end-1)) params_ub(end)];
    
        tempo = tempo - tempo(1);
    end
    
    display('***************************************')
    display('Costant Vector')
    display(num2str(constant_vector))
    display('***************************************')
    display('Parameter init')
    display(num2str(parameter_init))
    display('***************************************')
    display('***************************************')
    display('Parameter lb')
    display(num2str(params_lb))
    display('***************************************')
    display('***************************************')
    display('Parameter ub')
    display(num2str(params_ub))
    display('***************************************')
%     disp(strcat("initialization ",string(toc)))
%% Optimization function and data fitting 
%     tic
    func = @(params) function_d(params, data, tempo, constant_vector, i);

    if (strcmp(globalfunction,'MultiStart')== 1)
%         tic
        problem = createOptimProblem (localfunction, ...
               'objective',func,...
               'xdata', tempo,...
               'ydata', data, ...
               'x0', params_init_log,...
               'lb', params_lb_log, ...
               'ub', params_ub_log);
        ms = MultiStart ('MaxTime', 800, 'StartPointsToRun', 'bounds');
%         tic
%         assignin("base", "ms", ms);
%         assignin("base", "problem", problem);
%         assignin("base", "number_point", number_point);
        [params,obj_val] = run (ms, problem, number_point);
%         disp(string(toc))

    else
        
        parameter_number = length(find(constant_vector == 0));
        options = optimoptions('particleswarm','SwarmSize',number_point);
        [params,fval,exitflag,output] = particleswarm(func,parameter_number, params_lb_log,params_ub_log, options);
    end
%     disp(strcat("createOptimProblem ",string(toc)))
%     disp("Start model resolution...")
%     pause(1)
%% Parameters
    x0 = x0_found(params, constant_vector, i);

%% Resolution of the model
   [T_stemi, X_stemi] = ode23(@(t,x) odefun(t,x,params, constant_vector), t_vec_stemi, x0);