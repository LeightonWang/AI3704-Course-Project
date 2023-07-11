function [exectime, data] = ctrlcode(seg, data)

switch seg
case 1
% Read all buffered packets
temp = ttTryFetch('sensor_signal');
 while ~isempty(temp)
    y = temp;
    temp = ttTryFetch('sensor_signal');
 end
 x0 = ttAnalogIn(1);
 v0 = ttAnalogIn(2);

 if isempty(y)
    % data.u = data.old; % 丢包，保持 u(k-1)
    data.u = 0;
 else
    x1 = y(1); v1 = y(2);
    data.u = -10 * (x0 - x1) - 40 * (v0 - v1);
    data.old = data.u;
 end
    exectime = 0.000;

 case 2
 msg.msg = data.u;
 msg.type = 'control_signal';
 disp(msg);
 disp SendFromController;
 ttSendMsg(1, msg, 80); % Send 80 bits to node 1 (actuator)
 exectime = -1; % finished
 end
