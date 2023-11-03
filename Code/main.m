function manualControl()
    global key
    InitKeyboard();

    % A left motor, B right motor
    % Basically tank controls
    while true
        pause(0.1);
        switch key
            case 'uparrow'
                brick.StopMotor('A');
                brick.StopMotor('B');

                disp('Up arrow pressed!');
                brick.MoveMotor('A', 10);
                brick.MoveMotor('B', 10);
                
            case 'downarrow'
                brick.StopMotor('A');
                brick.StopMotor('B');

                disp('Down arrow pressed!');
                brick.MoveMotor('A', -10);
                brick.MoveMotor('B', -10);
                
            case 'leftarrow'
                brick.StopMotor('A');
                brick.StopMotor('B');
                
                disp('Left arrow pressed!');
                brick.MoveMotor('A', 10);
                brick.MoveMotor('B', -10);
                
            case 'rightarrow'
                brick.StopMotor('A');
                brick.StopMotor('B');

                disp('Right arrow pressed!');
                brick.MoveMotor('A', -10);
                brick.MoveMotor('B', 10);
                
            case 0
                disp('No Key Press');
                brick.StopAllMotors()

            case 'P'
                brick.StopMotor('A');
                brick.StopMotor('B');

            case 'q'
                brick.StopMotor('A');
                brick.StopMotor('B');
                break;
        end
    end

    CloseKeyboard()
end

function colorDetection(brick)
    brick.SetColorMode(1, 4)
    color_rgb = brick.ColorRGB(1)
    fprintf("\tRed: %d\n", color_rgb(1));
    fprintf("\tGreen: %d\n", color_rgb(2));
    fprintf("\tBlue: %d\n", color_rgb(3));

    while true
        color_rgb = brick.ColorRGB(1)
        case (color_rgb(1) > (color_rgb(2) + color_rgb(3)))
            disp('RED');
            pause(1);
        end

        case (color_rgb(2) > (color_rgb(1) + color_rgb(3)))
            disp('BLUE');
            pause(0.1);
            brick.beep();
            brick.beep();
        end

        case (color_rgb(3) > (color_rgb(1) + color_rgb(2)))
            disp('GREEN');
            pause(0.1);
            brick.beep();
            brick.beep();
            brick.beep();
        end
    end

end


function main()
    brick = ConnectBrick("Marengo")
    manualControl()
    colorDetection(brick)
end