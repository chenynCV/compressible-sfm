%FACOPTION specifies the parameters in facMethod.
%       Name                Value
%       'admmOption'        A structure generated by admmOption() to specify the
%                           parameters in admm.
%       'ksvdOption'        A structure generated by ksvdOption() to specify the
%                           parameters in ksvd.
%       'Recursive'         True or False, indicating whether do ADMM-KSVD
%                           again and again to get results.
%       'ThresScore'        A positive number between [0, 1], above which
%                           the algorithm stops.
%                           Default is 0.8.
%       'MaxRecr'           A positive integer indicating how many times
%                           KSVD run recursively for finding better
%                           dictionary.
%                           Default is 5.
%       'ThresGood'         A positive number give a threshold for deciding
%                           if the block in T is satisfied theorem 1 in
%                           blockKSVD.pdf document.
%                           Default is 0.1.
%       'PriorConst'        A positive number to control the magnitude of W and
%                           dictionary B.
%                           Default is 4.
%       'Sprior'            Cheat! for debugging purpose.
function option = facOption(varargin)
ip = inputParser;

defaultadmmOption = admmOption();
defaultksvdOption = ksvdOption();
defaultRecursive = false;
defaultThresScore = 0.8;
defaultMaxRecr = 5;
defaultThresGood = 0.1;
defaultPriorConst = 4;
defaultSprior = [];

addOptional(ip, 'admmOption', defaultadmmOption, @isstruct);
addOptional(ip, 'ksvdOption', defaultksvdOption, @isstruct);
addOptional(ip, 'Recursive', defaultRecursive, @islogical);
addOptional(ip, 'ThresScore', defaultThresScore, @isnumeric);
addOptional(ip, 'MaxRecr', defaultMaxRecr, @isnumeric);
addOptional(ip, 'ThresGood', defaultThresGood, @isnumeric);
addOptional(ip, 'PriorConst', defaultPriorConst, @isnumeric);
addOptional(ip, 'Sprior', defaultSprior, @isnumeric);

parse(ip, varargin{:});

option = ip.Results;
