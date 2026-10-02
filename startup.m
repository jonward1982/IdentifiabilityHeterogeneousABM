% Startup

home=pwd;

dlist=dir(home);

for i=1:length(dlist)
   
    if isdir(dlist(i).name) && dlist(i).name(1)~='.'
       
        addpath([home,'/',dlist(i).name]);
        
    end
    
end

clear home dlist i

% path0=home;
% path1=[home,'/bin'];
% addpath(path0,path1);
% clear home path0 path1