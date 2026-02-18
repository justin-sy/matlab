function taylorSeries2()
    % Functions
    syms x;

    functions = [2*x^3 + x,sin(x)^2,cos(x),sin(x),exp(x)];

    % Print out functions
    for i = 1:1:length(functions)
        fprintf("Function %d: %s\n",i,char(functions(i)));
    end

    disp("---------------------");

    % Get function
    num = input("Enter a number for the function wanted: ");
    
    f = x;

    if num > 0 && num < length(functions) + 1
        f = functions(num);
    end

    % Get info for approximation
    terms = input("Enter number of terms: "); % Number of terms in taylor series approximation
    center = input("Enter center of approximation: "); % Center of approximation
    xval = input("Enter x value: "); % X value for approximation
    
    sums = zeros(1,terms+1); % Array to store current sum at each term

    % Calculate approximation
    yval = 0; % Final approximation value
    factorial = 1; % Value of factorial
    

    df = f; % Current function that will be differentiated repeatedly

    % Evaluate first term
    yval = yval + double(subs(df,x,center));
    sums(2) = yval;

    % Evaluate the rest of the terms
    for i = 1:1:terms-1
        df = diff(df); % Differentiate function

        numerator = double(subs(df,x,center)); % Find value of differentiated function at center

        factorial = factorial * i; % Multiply factorial by current value of i

        cury = (numerator/factorial) * (xval - center)^i; % Value of current term

        yval = yval + cury; % Add current term to yval

        sums(i+2) = yval; % Add current sum to sums
    end

    disp("---------------------");
    
    % Display approximation
    fprintf("Approximation: %.5f\n",yval);

    % Graph approximation

    % Plot actual function
    fplot(f,[min(xval,center) - abs(xval - center),max(xval,center) + abs(xval - center)],"r");
    hold on; % Keep current line

    % Plot approximation

    % Calculate step value
    steps = abs(xval-center)/terms;
    if xval < center
        % Reverse direction of steps if x value smaller than center of
        % approximation
        steps = steps * -1;
    end

    xterms = center:steps:xval;
    plot(xterms,sums,"b","LineWidth",1);
    hold on;

    title("Taylor Series Approximation");
    legend("Actual","Approximation");
    xlabel("X-Axis");
    ylabel("Y-Axis");

    grid on;

    return;
end
