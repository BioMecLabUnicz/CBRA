function [conn] = dbConnection(username, password)
            dbname = 'cbra_new';    
            % Username and Password per accedere al DB          
            % Specifichiamo la tipologia di driver utilizzato
            driver = 'com.mysql.jdbc.Driver';
            % Specifichiamo l'inidrizzo
            dburl = 'jdbc:mysql://localhost:33061/cbra_new'; %/useSSL=false&? 
%             currentFolder = pwd;
            path_driver =  'mysql-connector-java-5.0.8-bin.jar';
            javaclasspath(path_driver);
            % Effettuiamo la connessione (.handles aggiunto dopo)
            conn = database(dbname, username, password, driver, dburl);
end