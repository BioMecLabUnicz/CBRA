function [hash] = passEncrypt(pass, encType)
%passEncrypt Convert a string to a 64/32 char hex hash string
%
%   hash = passEncrypt(string, encType)
%
%IN:
%   string - a string!
%   encType - chars with one type of encryption method like 'SHA-256', 'MD5'
%
%OUT:
%   hash - a 64 character string, encoding the 256 bit SHA hash of string
%          in hexadecimal.
%
%   using java.security.MessageDiges

    hash = char(pass);
    pass = char(pass);
    try
        if ~strcmp(pass, "") && ~isempty(encType)
            md = java.security.MessageDigest.getInstance(encType);
            hash = sprintf('%2.2x', typecast(md.digest(double(pass)), 'uint8')');
        else
            error("passEncrypt:MissingValues", ...
                "Input values mast be: " + ...
                "\n 1. the string will be encrypted; " + ...
                "\n 2. a string or a char sequence with a correct encryption algorithm name like 'SHA-256', 'MD5'. ")
        end
    catch ME
        if strcmp(ME.identifier, "passEncrypt:MissingValues")
            disp(ME.message)
        else
            disp(ME.identifier)
            disp(ME.message)
        end
    end
end