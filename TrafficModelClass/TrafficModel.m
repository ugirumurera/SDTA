classdef (Abstract) TrafficModel < handle
    properties
        %modelType indicates whether what type of model we are using:
        %'s' = simulation based or 'a'= analytical
        modelType
    end
    
    methods(Access=public)
        
        function this=TrafficModel(modelType)
            this.modelType = modelType;
        end
        
    end
    
    methods (Abstract)
        evaluateTravelTime(this)
    end
    
end