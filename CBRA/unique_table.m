function Tout = unique_table(T)

    %// Convert input table into a cell array
    Tcell = cellfun(@(x) num2str(x),table2cell(T),'Uni',0);
    
    %// ID all cells of the cell array
    [~,~,id_cells] = unique(Tcell);
    
    %// Use the cell IDs to find the unique row IDs
    [~,unq_rowid] = unique(reshape(id_cells,size(Tcell)),'rows');
    
    %// Use the row IDs to get the expected table with unique rows
    Tout = T(unq_rowid,:);

return;
