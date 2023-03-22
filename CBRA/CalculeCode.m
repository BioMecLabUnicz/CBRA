function result = CalculeCode(nomeCentro, id_centro, id_paziente)
%CALCULECODE this function calculate unique identification code for each
%patient when he is saved in DBMS
    if isstring(nomeCentro)
        nomeCentro = convertStringsToChars(nomeCentro);
    end
    s1=nomeCentro(1:3);
    s2 = '000';
    s3 = '00000000';
    send=nomeCentro(end-2:end);
    if id_centro < 10
        s2 = strcat('00', string(id_centro));
    elseif id_centro > 9 && id_centro < 100
        s2 = strcat('0', string(id_centro));
    elseif id_centro > 99
        s2 = string(id_centro);
    end
    if id_paziente < 10
        s3 = strcat('0000000', string(id_paziente));
    elseif id_paziente > 9 && id_paziente < 100
        s3 = strcat('000000', string(id_paziente));
    elseif id_paziente > 99
        s3 = strcat('00000',string(id_paziente));
    end
%     result = strcat(s1, s2, s3, send, datestr(now, 'ddmmyyHHMMSS'));
    result = strcat(s1, s2, s3, send, datestr(now, 'HHMMSSFFF'));

    result = upper(result);
end

