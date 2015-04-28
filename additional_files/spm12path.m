% spm12path.m
%
% Script to add paths for spm12/spm12w & spm12 tools and inform the user of 
% version and file locations. Can be copied and modified to setup paths for 
% different revisions of spm12/spm12w allowing multiple versions to coexist.
%
% To run on matlab start: matlab -nosplash -nodesktop -r spm12path
%
%
%
% spm12w was developed by the Wagner, Heatherton & Kelley Labs
%
% Author: Dylan Wagner
% Created: August, 2010
% Updated: November, 2014
% =======1=========2=========3=========4=========5=========6=========7=========8

fprintf('=== Adding paths for spm12/spm12w/tools ... \n');

% spm12 and spm12w path variables (edit these)
spm12_path  = 'C:\Users\ddw\Dropbox\Matlab\spm12\spm12_6225';
spm12w_path = 'C:\Users\ddw\Documents\GitHub\spm12w\spm12w';

% Optional tools paths (edit these, add additional tools to the tools var)
tools_path   = 'C:\Users\ddw\Dropbox\Matlab\spm12\tools\';
tools{1} = 'motionfingerprint_1.5.2';
tools{2} = 'PhysIO_r534';
tools{3} = 'mni2tal';
tools{4} = 'r2agui_2.7';
tools{5} = 'xjview_8.12';

% Add spm paths
addpath(spm12_path, spm12w_path)

% Add tools paths
for i = 1:length(tools)
    addpath(fullfile(tools_path, tools{i}));
end

% Check SPM12 revision
[r,v] = spm('Ver');
spm12loc = fileparts(which('spm'));

% Check SPM12w location
spm12wloc = fileparts(which('spm12w'));

% Print path checks
fprintf(['=== You are using %s revision %s located in ... \n' ...
         '=== %s \n'], r, v,spm12loc);
fprintf(['=== You are using spm12w located in ... \n' ...
         '=== %s \n'], spm12wloc);
fprintf(['=== You are using fMRI tools located in ... \n' ...
         '=== %s \n'], tools_path);

clear tools *_path r v spm12loc spm12wloc