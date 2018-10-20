function [s, extras] = createSchedule( dataFilename, scheduleStart, ...
                                       scheduleFinish )
%Creates a schedule based on the events data in a text file.
%   dataFilename is a string that names the text data file.
%   All events in dataFilename are added to a schedule within a window from
%   scheduleStart to scheduleFinish.  The events are then scheduled using
%   a heuristic (given in class Schedule), and the schedule is drawn.
%   dataFilename is the name of a file encoding data for all events to add
%   to the newly created schedule. Events are encoded in a given line L as 
%   follows: id = L(3:6), startAvailable = L(8:11), endAvailable= L(13:16),
%   duration = L(18:21), and importance = L(23:28). L(1) is 'e' if the line
%   represents a base Event, while L(1) is 'c' if it is a Course.  If the
%   event is a course, L(30:end) encodes the name of the course.

% Open the appropriate file
eventDataFile = fopen(dataFilename);

% Instantiate a Schedule object (no event is scheduled yet)
s = Schedule(scheduleStart, scheduleFinish, 'My Schedule');

% Read data from file and add the Event (or Course) to s.eventArray
%%%% Write your code below %%%%
k=0;
L= {};
while ~feof(eventDataFile)
    k=k+1;
    L{k}= fgetl(eventDataFile);
end

% You cannot set the read-only property 'eventArray' of Schedule.
n= length(L);
%s.eventArray= {}; % =cell(n,1);
for j= 1:n
    id= str2double(L{j}(3:6));
    startAv= str2double(L{j}(8:11));
    endAv= str2double(L{j}(13:16));
    dur= str2double(L{j}(18:21));
    import= str2double(L{j}(23:28));
    if length(L{j})==28
        e= Event(startAv,endAv,dur,import,id);
        s.addEvent(e); 
    else
        name= L{j}(30:end);
        disp('a');
        c= Course(startAv,endAv,dur,import,id,name);
        s.addEvent(c);
    end
end

% Close the data file
fclose(eventDataFile);

% Schedule the events
%%%% Write your code below %%%%
extras= s.scheduleEvents();

%for k=1:n
    %disp(s.eventArray{k}.scheduledTime)     % debug
%end

% Draw the schedule
%%%% Write your code below %%%%
close all
s.draw()

end

