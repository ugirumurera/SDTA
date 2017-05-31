classdef SimulationBasedModel < TrafficModel
    properties
        config_file
        output_file
        sim_duration
        prefix
        output_folder
        beats
    end
    
    methods(Access=public)
        
        function [this] = SimulationBasedModel(config_file,output_file,sim_duration,prefix)
            
            this = this@TrafficModel('s');
            
            this.config_file = config_file;
            this.output_file = output_file;
            this.sim_duration = sim_duration;
            this.prefix = prefix;
            this.output_folder = output_folder;
            
            % create beats wrapper and run simulation
            this.beats = BeATSWrapper(configfile);
            this.beats.run_simulation(prefix,output_requests_file,output_folder,sim_duration);
            
        end
        
        function r = evaluateTravelTime(this)
            %Calculating the average travel time
            p = this.beats.get_path_travel_times;
            r = nan(1,numel(p));
            for i=1:numel(p)
                r(i) = mean(diff(p(i).departure_arrival_times,[],2));
            end
        end
        
    end
    
end