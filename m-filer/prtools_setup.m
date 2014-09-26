function prsetup()
    fprintf('This is a test to see the color highlight environment\n');
    for i = 1:10
        fprintf('\ni is: %1.0f',i)
    end
    A = [1 2 3 ; 1 2 3 ; 7 8 9 ];
    sizA = size(A);
    fprintf('\n\nA has dimensions %1.0fx%1.0f\n\n\n',sizA(1),sizA(2))
end
