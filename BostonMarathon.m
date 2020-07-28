%%
syms A; %Design Matrix
syms T; %Our 'b'
syms a; %matrix of variables
syms AtA;
syms At;
syms RHS; %AtT
syms finalMatrix;
%Setting up our A

A = [1 13.1 619 23;
    1 13.5 803 42;
    1 13.8 207 31;
    1 13.1 409 38;
    1 12.5 482 45];

disp("Rank of A is: " + rank(A)) % gives if 4 which means that A has 
%full column rank meaning AtA is invertible


At = transpose(A);
AtA = At * A;

T = [181;
    193;
    212;
    221;
    248];

RHS = At * T;
a = AtA\RHS; %gives us (AtA)^(-1) * AtT
 %a_0 = 492.0442, a_1 = -23.4355, a_2 = -.0761, a_3 = 1.862
disp("a_0 is: " + a(1));
disp("a_1 is: " + a(2));
disp("a_2 is: " + a(3));
disp("a_3 is: " + a(4));

%% 
%For part b. Height = 74 in. Weight = 180 lbs. MilesRan = 450. Age = 43
x1 = 74/(180)^(1/3);
x2 = 450;
x3 = 43;
t = a(1) + x1 * a(2) + x2 * a(3) + x3 * a(4);
% gives us 230.7209 mins
disp("Estimated time is " + t + " minutes for a person with the given information")
%%
%For part c. Height = 68 in. Weight = 137 lbs. MilesRan = solve for. Age =
%33. Goal is 3 hrs and 5 mins or 185 mins

x1 = 68 /(137)^(1/3);
x3 = 33;
t = 185;

%Now we solve t = a(1) + x1 * a(2) + x2 * a(3) + x3 * a(4) for x2

x2 = (t - a(1) - x1 * a(2) -x3 * a(4)) / (a(3));
% gives us 779.8626 miles
disp("This person will need to run approximately " + x2 + " miles within 8 weeks of the marathon"); 