% Creates output files depending on the config file 
savevar = jsondecode(fileread('config.json'));
for i = 1:size(savevar.Save,1)
    if savevar.Save(i).Type == "WaveFile"
        if(exist(savevar.Save(i).MatlabVariable,'var') == 1)
            eval(['val = ',savevar.Save(i).MatlabVariable,';']);
            n = str2num(savevar.Save(i).SamplingFrequency);
            audiowrite(strcat('Outputs\',savevar.Save(i).Filename),val,n);
        end
    elseif savevar.Save(i).Type == "Constant"
        save(savevar.Save(i).Path,savevar.Save(i).VariableName,'-ascii')
    elseif savevar.Save(i).Type == "Matrix"
        try
            file = fopen(savevar.Save(i).Path,'wt');
            eval(['val = ',savevar.Save(i).VariableName,';']);
            for i = 1:size(val,1)
                fprintf(file,'%g,',val(i,:));
                fprintf(file,'\n');
            end
            fclose(file);
        catch exception
            throw(exception)
        end

    % Image is .jpg file
    elseif savevar.Save(i).Type == "Image"
        eval(['val = ',savevar.Save(i).VariableName,';']);
        imwrite(val,savevar.Save(i).Path);
    else
        fprintf('%s not saved into file, please check Save.json if Type is specified.', savevar.Save(i).VariableName); 
    end
end