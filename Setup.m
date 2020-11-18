format long
clear

try 
    global const;
    var = jsondecode(fileread('config.json'));
    const = var.Constants.Constant;

    % make output dir
    if exist('Outputs','dir') == 1
        mkdir('Outputs')
    end
    
    % Adding paths for project
    [rows, columns] = size(var.Paths);
    for r = 1:rows
        addpath(var.Paths(r).Path);
    end

catch exception
    throw(exception)
end

