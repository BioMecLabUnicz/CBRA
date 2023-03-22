function ora = ComputeOre(h, min, sec)
    ore = [];
    minuti = [];
    secondi = [];

    if length(h)==1
        ore = strcat('0', num2str(h));
    else
        ore = num2str(h);
    end
    if length(min)==1
        minuti = strcat('0', num2str(min));
    else
        minuti = num2str(min);
    end
    if length(sec)==1
        secondi = strcat('0', num2str(sec));
    else
        secondi = num2str(sec);
    end
   ora = strcat(ore, ':', minuti, ':', secondi);
    
end