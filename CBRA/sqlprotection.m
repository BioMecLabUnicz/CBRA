function [msg, result] = sqlprotection(val)
%SQLPROTECTION Summary of this function goes here
%   Detailed explanation goes here
    result = true;
    disp("-----CHECK FOR SQL INJECTION-----")
    msg = 'MESSAGE: Not detected';
    taboo = {'--' '#' '/*' '*/' '"' "=" "SELECT " "INSERT " 'DROP ' 'DELETE ' 'FILE ' 'IF ' 'OR ' 'AND ' 'HAVING ' 'LIMIT '};

    for i = 1:length(val)
        for j = 1:length(taboo)
            if contains(val{i}, taboo{j}, 'IgnoreCase', true)
                msg = 'WARNING: SQL injection detected!';
                disp(msg)
                disp("---------------------------------")
                result = false;
                return
            end
        end
    end
end