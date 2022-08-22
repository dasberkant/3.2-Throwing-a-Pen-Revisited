clear 
clc

PenIntersectsWithLine = 0;
PenRemainsOnTable = 0;
IntersectsAndFalls = 0;
for iteration=1:1000000
    theAngle = ((-1 + (361+1)*rand(1,1)));
    theAngle = mod(theAngle,360); %the rand of the angle is done.
    theAngle = mod(theAngle,180);
    radianAngle = deg2rad(theAngle);
    theDikeyLength = 0.8*sin(radianAngle);
    theYatayLength = 0.8*cos(radianAngle);
    x_coordinate = -theYatayLength/2+(5+theYatayLength/2+theYatayLength/2)*rand(1,1);
    y_coordinate = -theDikeyLength/2+(100+theDikeyLength/2+theDikeyLength/2)*rand(1,1);

    %x is randomized in the interval (-theYatayLength/2,5+theYatayLength/2).
    %y is randomized in the interval (-theDikeyLength/2,100+theDikeyLength/2).
    %the (x,y) coordinate to the central point of the stick and the angle are
    %assigned randomly.

    if((y_coordinate>=0 && y_coordinate<=100) && (x_coordinate>=0 && x_coordinate <= 5))
        PenRemainsOnTable = PenRemainsOnTable+1; 
    end
    for i=0:100
        if(abs(y_coordinate-i)<=theDikeyLength/2) 
            PenIntersectsWithLine = PenIntersectsWithLine + 1;   
            if((y_coordinate<0 || y_coordinate >100)||(x_coordinate<0 || x_coordinate>5))
                IntersectsAndFalls = IntersectsAndFalls+1;
            end
        end
    end
end


ProbabilityOfRemaining = PenRemainsOnTable/1000000;
ProbabilityOfIntersection = PenIntersectsWithLine/1000000;

fprintf("Pen remains on the table with a probability of %f.\nPen intersects with parallel lines" + ...
    " with a probability of %f.",ProbabilityOfRemaining,ProbabilityOfIntersection);

%fprintf("\nBoth Intersects and Falls number %f",IntersectsAndFalls);


