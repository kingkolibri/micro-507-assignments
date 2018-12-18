function [bezierCurve, d_bezierCurve] = bezierPolynomial(P)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    n = size(P,1)-1; % polynomial order
    
    syms t
    B = bernsteinMatrix(n, t);
    
    bezierCurve = simplify(B*P);
    
    d_bezierCurve = diff(bezierCurve);
    
    
    fplot(bezierCurve(1), bezierCurve(2), [0, 1], 'DisplayName', 'C')
    hold on
        fplot(d_bezierCurve(1), d_bezierCurve(2), [0, 1], 'DisplayName', 'dC')
        scatter(P(:,1), P(:,2),'filled')
        title([num2str(n), '-order Bezier curve'])
    hold off
    legend()
    
    
end