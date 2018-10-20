%testScript for Project 6 classes

close all

% Test class Interval
i1= Interval(3,9);  % Instantiate an Interval with endpoints 3 and 9
L= i1.left          % Should be 3. The properties have the attribute "public"  
                    % so it is possible to access the property left directly.
a2= i1.overlap( Interval(5,15) )
                    % o references an Interval with endpoints 5 and 9.
w= a2.getWidth()    % Should be 4, the width of the Interval referenced by a2


% Test class Event

% My tests
% method earliestTime

% Event can be scheduled
e= Event(2,8,3,1,1);
possibleInterval= Interval(1,6);
t= e.earliestTime(possibleInterval);    % Output: t = 2

%Method Earliest time  
e1=Event(3,20,10,.5,4)
i=Interval(1,50);
e1.earliestTime(i) %displays 3
i=Interval(4,15);
e1.earliestTime(i) %displays 4
i=Interval(21,50);
e1.earliestTime(i) %Inf.Iinterval is completely out of the event's interval
i=Interval(4,11);
e1.earliestTime(i) %Inf. Interval is in shorter than the event duration
i=Interval (0,11);   e1.earliestTime(i) 
i=Interval(13,26); e1.earliestTime(i)
%Both are Inf. Interval is long enough but cannot fit event when the 
%earliest an event can start is 3 and the latest it can end is 20

% Only changed possibleInterval to test rest of cases. Executed other calls
% in same order
% Event can be scheduled. t is middle of available interval
possibleInterval = Interval(4.5,7.5);   % Output: t = 3.5

% Cases in which event cannot be scheduled. Output for these cases: t=inf
% There is overlap, but duration is longer than overlap interval
possibleInterval = Interval(1,4);
possibleInterval = Interval(8,10);
% No overlap in avaialble and possible interval
possibleInterval = Interval(0,1);
possibleInterval = Interval(9,10);

% method setScheduledTime
e.setScheduledTime(4);      % e.scheduledTime was previously -1
disp(e.scheduledTime);      % Output: 4

% method unschedule
e.unschedule;
disp(e.scheduledTime);      % Output: -1

% method getId
e= Event(2,8,3,1,1);        % Id is last argument
id= e.getId();              % Output: id = 1

% method draw
e= Event(2,8,4,.8,3);       % available interval is (2,8). duration is 4.
                            % importance is 0.8. id is 3.
possibleInterval= Interval(3.5,8.5);
t= e.earliestTime(possibleInterval);       % Case: event can be scheduled
e.setScheduledTime(t);      % If event cannot be scheduled, set 
% self.scheduledTime to -1
% Now method draw can be called. If self.scheduledTime~=1, method draw 
% will draw a filled box.
e.draw();



% Professor's test
e1= Event(3, 20, 10, .5, 4); % An Event with id 4, importance .5, and
                             % duration 10. % It’s available for scheduling 
                             % in the interval [3,20]. 
disp(e1.available.right); % Should be 20 
disp(e1.available.getWidth()); % Should be 17 
% disp(e1.id) % Error: id is private 
e1= Event(3, 20, 10, .5, 4);
figure; hold on 
e1.draw(); % Should see colored box with left edge at x=5 
hold off


% Test class Schedule

% method addEvent
e2= Event(0, 30, 8, .3, 1) 
e3= Event(8, 25, 6, 0, 5) 
s = Schedule(0, 40, 'Test Schedule') % Instantiate a Schedule object. s.eventArray is empty. 
%s.sname= 'New name' % ERROR: property sname has private set access 
disp(s.sname) % Should see ’Test Schedule’ since get access is public 
s.addEvent(e2)
s.addEvent(e3) 
s.addEvent( Event( 10, 38, 5, 1, 2) ) 
disp(s) % s.eventArray should be a length 3 cell array of Events 
s.eventArray{1}.getId() % Should see 1 
s.eventArray{1}.setScheduledTime(21)
% myTesting
disp(s.eventArray{1}.scheduledTime);

% method scheduleEvents
s.scheduleEvents();
disp(s.eventArray{3}.scheduledTime);  % To check if event has been scheduled 

% method draw 
figure; hold on
s.eventArray{1}.draw() % Should see colored box with left edge at x=21 
hold off

% Test class Course
c1= Course(8, 25, 6, 0.5, 6, 'CS1000'); 
figure; hold on 
c1.draw() % Should see white box with x range of 8 to 25
          % No filled box or course name graphed, because
          % c1.scheduledTime is -1. Constructor did that (like a default)
c1.setScheduledTime(9) 
hold off 
figure; hold on 
c1.draw() % Should see colored box with left edge at x=9 and 
          % the course name in the middle 
hold off 
s.addEvent(c1) 
disp(s.eventArray) % Should see that the last cell references a Course, 
                   % not an Event
                   
% My tests
% disp codes eliminated. Added a course
e2= Event(0, 30, 8, .3, 1); 
e3= Event(8, 25, 6, 0, 5); 
s = Schedule(0, 40, 'Test Schedule');
s.addEvent(e2);
s.addEvent(e3);
s.addEvent( Event( 10, 38, 5, 1, 2) );
c1= Course(8, 25, 6, 0.5, 6, 'CS1000'); 
s.addEvent(c1);
s.scheduleEvents()
s.draw()

% Made e3 and 3rd added event unable to be scheduled in [0,40] window
e2= Event(0, 30, 8, .3, 1); 
e3= Event(36, 42, 6, 0, 5); 
s = Schedule(0, 40, 'Test Schedule');
s.addEvent(e2);
s.addEvent(e3);
s.addEvent( Event( 38, 45, 5, 1, 2) );
c1= Course(8, 25, 6, 0.5, 6, 'CS1000'); 
s.addEvent(c1);
s.scheduleEvents()
s.draw()

% Test function createSchedule
[a, ex] = createSchedule('eventdata1.txt', 0, 100)
[a, ex] = createSchedule('eventdata2.txt', 0, 100)


t1=zeros(1,3);
  for n=100:50:200
      tic
      theta = rand(n,1)*2*pi;  % Angle of n random pts on the unit circle
      % Compute the area of the largest triangle that can be formed by
      % 3 of the n points
      A = 0;  % max area so far
      i=1;
      for i=1:n
          for j=1:n
              for k=1:n
                  % Triangle with vertices at points i,j,k
                  % Calculate Cartesian coordinates
                  c1 = cos(theta(i));
                  s1 = sin(theta(i));
                  c2 = cos(theta(j));
                  s2 = sin(theta(j));
                  c3 = cos(theta(k));
                  s3 = sin(theta(k));
                  % Area using Heron's Formula where a,b,c are side lengths
                  % of the triangle
                  a = sqrt((c1-c2)^2 + (s1-s2)^2);  % distance btw points i,j
                  b = sqrt((c1-c3)^2 + (s1-s3)^2);  % distance btw points i,k
                  c = sqrt((c2-c3)^2 + (s2-s3)^2);  % distance btw points j,k
                  s = (a+b+c)/2;
                  Aijk = sqrt((s-a)*(s-b)*(s-c)*s);
                  A = max(A,Aijk);
              end
          end
      end
      t1(i)=toc;
      i=i+1;
  end
  disp(t1)
  %1.1513,3.1427,7.9250
  
  function t1=Part2Triangle
  for n=100:50:200
      tic
      theta = rand(n,1)*2*pi;  % Angle of n random pts on the unit circle
      % Compute the area of the largest triangle that can be formed by
      % 3 of the n points
      A = 0;  % max area so far
      i=1;
      for i=1:n-2
          c1 = cos(theta(i));
          s1 = sin(theta(i));%no redunancy, no duplicates
          for j=i+1:n-1
               c2 = cos(theta(j));
               s2 = sin(theta(j));
              for k=j+1:n
                  % Triangle with vertices at points i,j,k
                  % Calculate Cartesian coordinates
                  c3 = cos(theta(k));
                  s3 = sin(theta(k));
                  % Area using Heron's Formula where a,b,c are side lengths
                  % of the triangle
                  a = sqrt((c1-c2)^2 + (s1-s2)^2);  % distance btw points i,j
                  b = sqrt((c1-c3)^2 + (s1-s3)^2);  % distance btw points i,k
                  c = sqrt((c2-c3)^2 + (s2-s3)^2);  % distance btw points j,k
                  s = (a+b+c)/2;
                  Aijk = sqrt((s-a)*(s-b)*(s-c)*s);
                  A = max(A,Aijk);
              end
          end
      end
      t1(i)=toc;
      i=i+1;
  end
  disp(t1)
  %0.0618 0.1300 0.3086
