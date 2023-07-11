function [exectime, data] = senscode(seg, data)

switch seg
 case 1
  data.msg.msg = [ttAnalogIn(1), ttAnalogIn(2)];
  exectime = 0.000;
 case 2
  data.msg.type = 'sensor_signal';
  ttSendMsg(2, data.msg, 80); % Send message (80 bits) to node 2 (controller)
  exectime = 0.000;
 case 3
  exectime = -1; % finished
end
