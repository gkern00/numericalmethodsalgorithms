clear
clc

epsilon = 1;

while 1.0 + (epsilon) > 1.0
    epsilon = epsilon/2;
end

display(epsilon);