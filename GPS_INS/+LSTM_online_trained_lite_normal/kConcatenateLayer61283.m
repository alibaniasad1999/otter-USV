classdef kConcatenateLayer61283 < nnet.layer.Layer & nnet.layer.Formattable
    %kConcatenateLayer61283
    % Auto-generated by MATLAB on 22-Aug-2023 23:11:28
    
    
    properties
        % Non Trainable Parameters
        
    end
    
    properties (Learnable)
        % Trainable parameters
        
    end
    
    properties (Hidden)
        % Code literals
        
        InputLabels
        OutputLabels
    end
    
    methods
        function obj = kConcatenateLayer61283(Name, Type)
            obj.Name = Name;
            obj.Type = Type;
            obj.NumInputs = 2;
            obj.NumOutputs = 1;
            obj.InputLabels = {'',''};
            obj.OutputLabels = {'fcs'};
        end
        
        function varargout = predict(obj, inputs0, inputs1)
            [temp{1}] = ConcatenateLayer61283(inputs0, inputs1, obj);
            
            % Extract results from function call.
            varargout{1} = temp{1}.value;
        end
    end
end

function [identity] = ConcatenateLayer61283(inputs0, inputs1, obj)
import LSTM_online_trained_lite_normal.ops.*;
[inputs0] = struct('value', inputs0, 'rank', 3);
obj.InputLabels{1} = inputs0.value.dims;
[inputs1] = struct('value', inputs1, 'rank', 3);
obj.InputLabels{2} = inputs1.value.dims;

concatAxis.value = double(1);
concatAxis.rank = 0;
[concat] = tfCat(concatAxis, inputs0, inputs1);
Identity.value = concat.value;
Identity.rank = concat.rank;

% assigning outputs
identity = addOutputLabel(Identity,1, obj);
end

