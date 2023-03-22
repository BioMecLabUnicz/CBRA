function TemAcq = tempi(dataacquisizione, oraacquisizione, dataevento, oraevento)

    unionacquisizione = strcat(dataacquisizione,{' '},oraacquisizione);
    unionevento = strcat(dataevento, {' '},oraevento);
    
    t1 = datetime(unionevento);
    t2= datetime(unionacquisizione);
    
    dt = datenum(t2 - t1);
    TemAcq = dt*24;