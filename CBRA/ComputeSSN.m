function ssn = ComputeSSN(cogn, nom, gg, mm, aaaa, alfa, luogNasc)

% =========================================================================
%  Name        : ComputeSSN
%  Since       : 2019
%  Author      : Anna Procopio <anna.procopio@unicz.it>
%  Description : cf module to generate Italian fiscal codes
%  ========================================================================



    load Comuni.mat;
    
    cogn = strrep(upper(cogn), ' ', '');
    nom = strrep(upper(nom), ' ', '');
    
    car_no = upper('??????');
    
    ssn = char(16);
    
    cogn_c = cogn(find(~ismember(cogn, upper('aeiou')) == 1));
    cogn_con = cogn_c(~ismember(cogn_c, car_no));
    cogn_vocal = cogn(find(ismember(cogn, upper('aeiou')) == 1));

    
    
    nom_c = nom(find(~ismember(nom, upper('aeiou')) == 1));
    nom_con = nom_c(~ismember(nom_c, car_no));

    nom_vocal = nom(find(ismember(nom, upper('aeiou')) == 1)); 
    cod_com = Comuni.code{luogNasc};
    
    
    %% Cognome

    switch length(cogn_con)

        case 2

            ssn(1:2) = cogn_con;

            switch length(cogn_vocal) 

                case 0
                    ssn(3) = 'X';
                otherwise                    
                    ssn(3) = cogn_vocal(1);
            end

        case 1

            ssn(1) = cogn_con;
            switch length(cogn_vocal) 

                case 0
                    ssn(2:3) = 'XX';
                case 1
                    ssn(3) = 'X';
                    ssn(2) = cogn_vocal(1);
                otherwise                    
                    ssn(2:3) = cogn_vocal(1:2);
            end               

        otherwise
            ssn(1:3) = cogn_con(1:3);    

    end

 %% Nome
 
     switch length(nom_con)

        case 3

            ssn(4:6) = nom_con;

        case 2

            ssn(4:5) = nom_con;
            switch length(nom_vocal) 

                case 0
                    ssn(6) = 'X';
                otherwise                    
                    ssn(6) = nom_vocal(1);
            end
            
         case 1

            ssn(4) = nom_con;
            
            switch length(nom_vocal) 

                case 0
                    ssn(5:6) = 'XX';
                case 1
                    ssn(5) = nom_vocal;
                    ssn(6) = 'X';
                    
                otherwise                    
                    ssn(5:6) = nom_vocal(1:2);
            end  
            
        otherwise
            ssn(4:6) = nom_con([1 3 4]);    

    end

%% Anno
    ssn(7:8) = aaaa([3 4]);
%% Mese
    [c, ind] = ismember(mm, [1,2,3,4,5,6,7,8,9,10,11,12]);
    month = {'A', 'B', 'C', 'D', 'E', 'H', 'L', 'M', 'P', 'R', 'S', 'T'};
    ssn(9) = month{ind};
%% Sesso + Giorno
    if strcmp(alfa, 'M') == 1
        if length(gg) == 1
            gg = strcat('0', gg);
        end
        ssn(10:11) = gg;
    else
        
        ssn(10:11) = num2str(str2num(gg) + 40);
    end
%% Comune
    ssn(12:15) = cod_com;
    
%% Carattere di controllo
    load pari_dispari.mat
    
    car_par = ssn(2:2:end-1);
    car_disp = ssn(1:2:end);
    
    contr = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',  'U', 'V', 'W', 'X', 'Y', 'Z'};
    sum_disp = FindV(split(car_disp, ''), pd, 1);
    sum_pari = FindV(split(car_par, ''), pd, 0);

    ind_contr = rem(sum([sum_disp sum_pari]), 26);
    ssn(16) = contr{ind_contr+1};

end