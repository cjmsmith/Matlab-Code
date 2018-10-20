classdef Schedule < handle
% A schedule has an Interval window in which events can be scheduled and 
% a cell array of Events.
    
    properties (SetAccess = private)
        sname= '';                % The name of the schedule
        window= Interval.empty(); % The Interval in which events can be 
                                  %   scheduled
        eventArray= {};           % The cell array of events
    end
    
    methods
        function s = Schedule(startTime, endTime, scheduleName)
        % Construct schedule s.  s.window goes from startTime to endTime.
        % s.sname is the string name that is shown on the schedule.
        % s.eventArray starts as an empty cell array.
            %%%% Write your code below %%%%
            if (nargin==3)
                s.window=Interval(startTime,endTime);
                s.sname=scheduleName;
                s.eventArray={};
            end

        end
        
        function addEvent(self, ev)
        % Adds Event ev to the end of self.eventArray
            %%%% Write your code below %%%%
            x=length(self.eventArray);
            self.eventArray{x+1}=ev;
        end
        
        function extras = scheduleEvents(self)
        % Schedule events from self.eventArray in self.window.  First
        % unschedules all events.  Then use a heuristic to schedule events
        % as follows:
        % 1. Define a "remaining window," which is the window available for
        %    scheduling events.  Initialize the remaining window to be the 
        %    same as window (same left and reight ends).
        % 2. Find the earliest unscheduled event that can be scheduled in
        %    the remaining window.
        % 3. If multiple events have the same earliest time, choose the
        %    event with the highest ratio of importance to duration.
        % 4. If the event is scheduled, update the remaining window.
        % 5. Repeat steps 2 to 4 until no events can be scheduled.
        % extras is a cell array of the Events (and Courses) that did not
        % get scheduled.  The length of extras is the number of events that
        % did not get scheduled.  If all events got scheduled then extras
        % is the empty cell array {}.
        %%%%%%%%%%%%%%%%%%%
            
            %%%% Write your code below %%%%
           for k=1:length(self.eventArray)
               self.eventArray{k}.unschedule
           end
           
            %cell array that holds events that have correct
           %earliest time and can fit in the  remainding window
           extras=self.eventArray; %Extras contains all the events if none  
           remainding=self.window; %can get scheduled
           x=self.window.left;    %x is begininning of window
            while x<self.window.right
                j=1;
                MarkTheCell={};
                for i=1:length(self.eventArray)
                    if self.eventArray{i}.earliestTime(remainding)==x &&...
                            self.eventArray{i}.duration<=remainding.getWidth...
                            && self.eventArray{i}.scheduledTime==-1
                           MarkTheCell{j}=i;  
                           j=j+1;             
                    end
                end

                %Only one event has specified early time
                if length(MarkTheCell)==1
                    u=MarkTheCell{1};
                    self.eventArray{u}.scheduledTime=x; %event is scheduled
                    %at time x
                    x=x+self.eventArray{u}.duration; %update x
                    extras{u}=[]; %delete cell
                    
                    %More than one event with earliest time
                elseif length(MarkTheCell)>1
                    u=MarkTheCell{1};
                    mostImp=self.eventArray{u}.importance; 
                    d=self.eventArray{u}.duration;
                    %set the first event to most important so far
                    v=u;
                    for j=2:length(MarkTheCell)
                        u=MarkTheCell{j};
                        if self.eventArray{u}.importance/self.eventArray{u}.duration...
                                > (mostImp/d)
                            mostImp=self.eventArray{u}.importance;
                            d=self.eventArray{u}.duration;
                            v=u; %v keeps the u of the event we want to schedule
                            %since u changes every loop
                        end
                    end
                    self.eventArray{v}.scheduledTime=x;
                    x=x+self.eventArray{v}.duration; %update x
                    extras{v}=[];
                %No matching events were found? Keep searching
                else
                     x=x+1;  
                end
                remainding.left=x;
            end
        end
 
        
        function draw(self)
        % Draws the scedule and all the events.  This method sets up the 
        % figure window, shows the title (self.sname), labels the axes, and 
        % draws each event.  Figure window should be made full screen, 
        % ticks on the y-axis should only be drawn at integer (id) values 
        % and the axes should enclose only the scheduling window in the 
        % x-direction and only the range of event ids in the y-direction.

    if ~isempty(self.eventArray)
            %%%% Write your code below %%%%
            figure('units','normalized','outerposition',[0 .05 1 .95],...
                'name', 'Schedule')
            hold on
            v= [];
            for k= 1:length(self.eventArray)
                if self.eventArray{k}.scheduledTime~=-1
                    self.eventArray{k}.draw()
                    v= [v self.eventArray{k}.getId()];
                end
            end
            minId= min(v); maxId= max(v);
            xmin= self.window.left; xmax= self.window.right;
            title(self.sname)                  
            xlabel('ID')
            ylabel('Time')
            set(gca, 'ytick', minId:maxId)
            axis([xmin xmax minId-1 maxId+1])
            hold off
    end
end
            

        end
     %methods
    
end


