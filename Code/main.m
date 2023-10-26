function manualControl()
    global key
    InitKeyboard();

    % Basically tank controls
    while true
        pause(0.1);
        switch key
            case 'uparrow'
                %disp('Up arrow pressed!');
                brick.MoveMotor('A', 10);
                brick.MoveMotor('B', 10);
                
            case 'downarrow'
                disp('Down arrow pressed!');
                brick.MoveMotor('A', -10);
                brick.MoveMotor('B', -10);
                
            case 'leftarrow'
                disp('Left arrow pressed!');
                brick.MoveMotor('A', 10);
                brick.MoveMotor('B', -10);
                
            case 'rightarrow'
                disp('Right arrow pressed!');
                brick.MoveMotor('A', -10);
                brick.MoveMotor('B', 10);
                
            case 0
                disp('No Key Press');
                brick.StopAllMotors()

            case 'q'
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
end


function main()
    brick = ConnectBrick("Marengo")
    manualControl()
    colorDetection(brick)
end