function taylorSeries()
    % Get function
    num = input("Enter a number for the function wanted: ");

    syms x;
    
    f = x;

    if num == 1
       f = x^5;
    elseif num == 2
       f = sin(x)^2;
    elseif num == 3
        f = cos(x);
    elseif num == 4
        f = sin(x);
    elseif num == 5
        f = exp(x);
    end

    % Get info for approximation
    terms = input("Enter number of terms: "); % Number of terms in taylor series approximation
    center = input("Enter center of approximation: "); % Center of approximation
    xval = input("Enter x value: "); % X value for approximation
    
    sums = zeros(1,terms); % Array to store current sum at each term

    % Calculate approximation
    yval = 0; % Final approximation value
    factorial = 1; % Value of factorial
    

    df = f; % Current function that will be differentiated repeatedly

    % Evaluate first term
    yval = yval + double(subs(df,x,center));
    sums(1) = yval;

    % Evaluate the rest of the terms
    for i = 1:1:terms-1
        df = diff(df); % Differentiate function

        numerator = double(subs(df,x,center)); % Find value of differentiated function at center

        factorial = factorial * i; % Multiply factorial by current value of i

        cury = (numerator/factorial) * (xval - center)^i; % Value of current term

        yval = yval + cury; % Add current term to yval

        sums(i+1) = yval; % Add current sum to sums
    end

    % Display approximation
    disp(yval);

    % Graph approximation

    % Plot line of actual value
    actual = double(subs(f,x,xval));
    plot([1,terms],[actual,actual],"r","LineWidth",1);
    hold on; % Keep current line

    % Plot approximation
    xterms = 1:1:terms;
    plot(xterms,sums,"b","LineWidth",1);
    hold on;

    title("Taylor Series Approximation");
    legend("Actual","Approximation");
    xlabel("Terms");
    ylabel("Value");

    xlim([1,terms]);
    
    grid on;

    return;
end
