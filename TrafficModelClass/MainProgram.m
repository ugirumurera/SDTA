%Initialze the simulation based traffic model and find average travel time

root = fileparts(mfilename('fullpath'))
config_file = fullfile(root,'SimpleTest.xml');
output_request = fullfile(root,'out.xml');
sim_duration = 3600;
prefix = 'test';
sim_model = SimulationBasedModel(config_file,output_request,sim_duration,prefix);

avg_travel_time = sim_model.evaluateTravelTime()