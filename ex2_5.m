
%a n*p
A = [1 2 3; 0 1 2; 0 4 1];

% Q e U fattorizzazione QU
Q = eye(size(A,1));
I = eye(size(A,1));

for i = 1:size(A,2)
    
    % get the column to build Hauseholder
    a = A(:,i);
    % set to 0 the first i-1 elements
    a(1:i-1) = zeros(i-1, 1);
    % get the element of the I matrix
    e = I(:,i);
    % get the new value of the i-element
    v = a + sign(a(i)) * norm(a) * e;
    
    % get hauseholder of the vector a modified at the i-element
    H = get_hauseholder_matrix(v)
    
    % set the new A
    A = H * A;
    
    % update Q
    Q = H * Q;
    
end

Q
R=Q'*A
norm(A - Q*R)

[C, D] = qr(A)
norm(Q - C)
norm(R - D)