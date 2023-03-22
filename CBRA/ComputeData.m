function date_S = ComputeData(date, local)
    trad = datestr(date);
    data = datetime(trad, "InputFormat","dd-MMM-uuuu",'Locale','en_US');
    d = num2str(day(data));
    m = month(data);
    y = num2str(year(data));
    if strcmpi(local, 'it')
        date_S = strcat(d,'/',num2str(m),'/', y);
    else
        date_S = strcat(y,'-',num2str(m),'-', d);
    end
end