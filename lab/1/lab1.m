%% Lab 1 (2018)
%% Part 1:Intro

clear variables
format short
clc

%% 1.1 The Desktop
%
% A multi-panelled desktop appears on Startup. Tabs organize different
%  graphical commands [buttons/menus]. We only need the HOME tab initially.
%  The various panels can be arranged using the Layout menu. 
%  The default layout includes:
%  
%% 
% * Command Window. You enter commands to MATLAB at the command prompt >>.  
%             You can use tab-completion, and use the up-arrows.
%             Drag-n-drop also works.
%             Can use as a 'calculator'
% * M-file editor, if a file is open to edit (note: you can use your own editor too)
% * Workspace, and Variable Editor 
% * Current Folder, and file browser
% * Toolstrip, including Menus, and links to the Help Menu. 
%   You can do a lot of things with menus and buttons on the Toolstrip,
%   rather than the command line.
% * When you plot a figure, the Figure menus are also available
%                 (more on plotting later)
% * the Command History pops up when using the up arrow
%  All of these panels can be re-arranged e.g. undocked
%

%% 
% Before we start, a brief check of the version number. 
% MATLAB is also on all university computer labs.
clc                 % clears the command window
version             % my version is newer than that in the lab
license('test','statistics_toolbox')
clear
%%
% In MATLAB, like many languages, "1" means true and "0" means false
% and you can also use the keyword "true" (without quotes) to make
% your code more readable.  For a general number n, n is considered "false"
% if it is zero; any other value is "true".
%% 1.2 Getting Help 
%
% Here are 3 useful ways to find help: help, the function browser, 
%  and Search in the doc/Help system.
%
% help: gives brief help from the command line
help atan
%{
    Brief description of command
    then  syntax /options
     then examples of usage
%}
% "help" also works on directories of related commands
 help elfun      % lists things like cosine, exp, log, etc.

%% 
% At the command prompt, the symbol $f_x$ denotes the function browser. 
% Click on this to browse for a function, arranged in a tree-like
% structure of directories, the same tree structure as in the doc/Help system. 
%%
% and most importantly, the powerful Help Browser: either hit "F1" key, 
% or the Home->Help menu or Home->? , or...
doc 

%% 1.3 Basic commands  

clc         % this clears the command window of old output
3 + 5
%%
clc
3 + 5;              % the semicolon suppresses output ( THIS IS A COMMENT)
3+             5;   % MATLAB ignores whitespaces usually
                    % (though sometimes it treats them as a comma)
% Note: comments can start ANYWHERE in a line of code
%   but you cannot "undo" a comment on the same line, e.g. % comment % code

%%
% Simplest commands:
% * (multiplication), + (addition), - (subtraction),
%   / (division), ^ (exponentiation)
%
% Operator precedence : don't memorize this, just use parentheses.

5*(8-3)/4

%%

(6.023e23)^2
% To enter small or large numbers, use e notation

sin(pi/2)

1/0

exp(1i*pi)

% MATLAB has complex numbers built in

% safer to use 1i or 1j for the unit imaginary number
% i, j often used for index counters

Inf/Inf

%% Assignment to scalar variables 

x = 4
% = means 'is assigned to' not 'equals'
% Note: we do not need to "declare" x, as we would in C or Fortran. 
% By default, a variable with a numeric value is double-precision floating
% point type. 
%
% 3*z
% a variable needs to have a value before it can be used
%%
% MATLAB is case-sensitive, so if we ask for the value of "X", we'll
% get an error.

% X
% For naming your own variables, you can use any mixture of upper- and 
% lower-case.  Variables may not start with a number, but can have
% numbers elsewhere in the name. Use meaningful names for variables.

% 1x = 56
%%
% ans stores the result of the latest calculation

x = 8; 2*x  % the semicolon suppresses output AND allows us
            % to add a second command.
ans + 2

%% Built-in functions
% MATLAB has LOTS of built-in  functions: cos, sin etc. see help elfun for
% a list
clc
x = exp( sin( atan( abs( log( 3 ) ) ) ) );
disp(x) 

% disp is like leaving off ; but doesn't echo the variable name
 
%% Breaking up long-lines of code onto two lines
% Not needed here but...
y = sin(47.5) + ...
    cos(23.9)

%% Comments
% Anything after a % is a comment

%% Strings
s = 'Hello world'; % A string is enclosed in single quotes [character vector]

%%
% To see the variables currently defined in the current workspace, use who
who

%%
% When working from the command line, all variables are stored in the base workspce.
% To see how much space they take, use whos
whos

%% 
% To see their values, use the Workspace pane in the Desktop environment

%% 1.4 Saving work
% To save variables and their values, use save
save mywork

%%
% To use them again later, use load
clear variables
who
disp('an empty workspace')
%%
load mywork 
who

% Now do Exercise Set 1 of Week 1

%% Part 2: Scripts and functions 
%
% Very quickly you will leave the command window and want to write a
% program. MATLAB programs are saved in text files called M-files.
%
% This file is an example of an "M-file".  The file is saved as "lab1new.m"
%         MATLAB also automatically makes backup files, called either "lab1.asv"
%         (windows) or "lab1.m~" (unix/linux); this behavior can be changed.
% 
% M-files can be either scripts or functions - two ways of writing
%  programs in MATLAB. Any text editor could be used to write M-files but
%  you might as well learn the MATLAB editor.

%% The editor
%
% The editor is highly customizable, and it has many keyboard shortcuts. 
%      These can be customized as well.
% You can start the editor by 
% |edit|
% or by opening a new script Ctrl-N
%
% For your system, you should know the following shortcuts:
%%
% # saving a file 
%                 (e.g. ctrl+X, ctrl+S for unix, or clrl+S for windows)
% # commenting a line of code
%                 (e.g. ctrl+/ for unix, ctrl+R for windows)
% # uncommenting a line of code 
%                 (e.g. ctrl+T for unix and windows)
% #  stopping a runaway calculation 
%                 ( e.g. ctrl+C)
% # see the "Editor" toolstrip  for more (e.g. changing the indent: ctrl+I)
% 
%% Once you open the editor
% you see the Editor tab, which you'll use a lot, 
% and the Publish tab and View tab, which you won't.
%% Two important concepts illustrated in this M-file:
% 
% # Comments.  Everything written here is a comment.  There are two ways to 
%                 write comments: either comment a single line with "%", or 
%                 use block comments to comment several lines, using "%{"
%                 followed by "%}".  See this file for examples.  Note that you 
%                 cannot have ANYTHING on the line that starts with "%{".
%                 By default, the editor puts comments in green (you can change this).
%                 For printing an m-file, you can make the comments appear in italics. 
%                 See the "page setup" menu. 
% # Code sections [code cells].
%                 MATLAB has two meanings for the word "cell", so don't get 
%                 confused.  The first meaning of "cell" is used in a m-file, and
%                 it is a way to split the M-file into sections, each of which
%                 can be executed separately.  This is a very useful tool.
%                 To execute a single cell, see the button in the toolbar, or
%                 hold down "ctrl" and then hit "enter" on your keyboard.
%                 The beginning of a cell is a special comment line that
%                 begins with two "%", not just one.
%                 The other use of the word "cell" refers to a type of variable, and
%                 may be discussed later.
%
% I use them for teaching because you can run code sections to illustrate
%       many constructs. You probably won't write any code with code
%       sections.

%% Example: computing sqrt(5)
% (this is an example of a code section)
%
% Newtons's method for computing $\sqrt{a}$ is
%
% $x_{n+1} = x_n/2+a/(2*x_n)$ 
%
% We'll study Newton's method later.
% In our example, we run 4 iterations with a = 5, starting from x_0 = 2. 
%
 %% Basic components of programming
 % 
 % All programming consists of 4 components: (A Moffat)
 %%
 % # calculation: using operators and built-in functions
 % # selection: making choices between different actions
 % # iteration: repeating actions a known or unknown number of times
 % # abstraction: creating self-contained units (functions) that can be
 %      re-used with different inputs
 % We now discuss iteration aka loops
 
%% 2.1 Controlled iteration: for loops
%  
% Since we know the number of times we want to repeat the line (4 times) 
% we use a for loop

doc for

%{
    convention:
        when using a command like "doc", there are three ways to call it
        (1) doc for
        (2) doc 'for' % 'for' is a string
        (3) doc('for')
    but the following will NOT work
        (4) doc(atan)
    because MATLAB thinks the argument is a variable
        for more details, see >> help syntax
%}
%%
% In our case, we need a variable (`index or loop counter') to monitor the number of
% iterations ; it takes in sequence the values specified in the expression,
% often a vector formed with the colon operator |m:n|

1:4
10:-1:3
1:2:10
%% A first attempt

xold = 2;               % initialize xold
for iteration = 1:4     % 4 Newton iterations
    xnew = xold/2+5/(2*xold);
end
root5 = xnew            % should approximate sqrt(5)
residual = root5^2-5    % the residual tests the result

%% 2.2 Creating a script M-file
% Just save MATLAB commands to a new script M-file
% and give it a name e.g. |firstNewtonScript.m|

type firstNewtonScript

%%
% check you saved it to somewhere on your path
%
% |path|
%
% so MATLAB knows where to find it.
% If not, add the folder to your path using Home->Set Path...
%    Add with Subfolders is often useful
%
% To run the script, just call its name

firstNewtonScript

% or Run from the editor
%% Scripts are good
%
% * Can run many times, no retyping
% * Can add lots of comments
% * I use them for teaching because you can run code sections to illustrate
%       many constructs
%% Scripts are bad
%
% * no flexibility, have to edit to change anything
% * all variables in base workspace - potentially dangerous

%% Functions are good
%
% * Function M-files offer more flexibility, by having input arguments
%   so you can re-use code for many cases. They can also have output
%   arguments that are returned by the function and can be assigned to
%   variables by the calling command. 
%   Functions can have zero inputs [e.g. a driver function that acts like a
%   script] and/or zero output arguments [e.g. a function that just creates
%   plots]
% * all variables created in a function are local variables, stored in a
%   local workspace. This makes functions safer to use.

%% 2.3 Creating a function M-file, with 1 input and 1 output
% Let's make the initial guess x0 an input argument
% and the 4th iterate an output 
%
% add the following line at the top
%
% |function root5 = firstNewtonFunc(x0)|
%
% change the next line to |xold = x0|
%
% delete (comment out) the line 
%
% |residual = root5^2-5|
%
% and save as |firstNewtonFunc.m|
%
% Note: function name has to match M-file name
%
% now call the function

y = firstNewtonFunc(2)

% Note: when we call a function the output 
%       can be called anything, here 'y'
% Now our function accepts the initial guess as input
%%
% We can add some comments directly after the first line
%
% This now becomes your own help file 

y = firstNewtonFunc(2)
help firstNewtonFunc
y^2-5
%%
% Something is wrong!
% Notice the Code Analyzer says all is OK.
%% 2.4 Using the Debugger
%
% Open |firstNewtonFunc.m| in the editor
%
% Set a breakpoint at the first statement and call the function
%
% Examine the values of all variables (who or workspace)
%
% Step through the code (F10)
%
% Don't forget to clear the breakpoint(s) when you're happy.
%
% y = firstNewtonFunc(2)
% y^2-5
%
% Much better!

%% 2.5 Selection: if..else
%
% There is a flaw in firstNewtonFunc.m

y = firstNewtonFunc(0)

%%
% We can fix it using an `if' statement

help if

%%
% In its simplest form
%
% |if condition
%        statement(s)
% end|
%
% where |condition| is a *logical expression* (an expression that evaluates to
% true or false)
%
% here the statement(s) are executed if condition evaluates to true
        

%% Boolean/logical expressions
%
% Logical expressions are typically formed using comparison operators
%
%                   > >= < <= == ~= 
%
% Warning: don't confuse == (equality operator) and = (assignment)
%
% and can themselves be combined with logical operators
%
%               &&  (and)  || (or)   ~ (not)

help relop
%%
% Also many built-in functions return logical values 
%
% In MATLAB, logical false is also 0
%
% logical true is also 1 (or any non-zero number)

help isreal

%% if..elseif ...else
%
% if statements can have many possible branches

help elseif

% The statement(s) under else are executed if all the previous conditions 
% were false.
%
% `if' statements can be nested [and nested..](be careful code is still clear)

%% 
% Now fix firstNewtonFunc.m and save as newtonFuncForLoop.m

y = newtonFuncForLoop(0)
y = newtonFuncForLoop(2)

%% 2.6 Multiple input and output
% A function can have many inputs by using the syntax
%
% |out = myfun(in1,in2,in3)|
%
% and/or many outputs
%
% |[out1,out2,out3] = myfun(in1)|
%
% which you then call as 
%
% |[x,y,z] = myfun(3)|
%
% or as
%
% |[x,~,z] = myfun(3)|
%
% if you don't want the value of out2.
%
% If you just call 
% |myfun(3)|
% you will get out1 returned as |ans|. 
%
% Moral: if you want more than 1 output, you have to ask for them
 
%% 2.7 Uncontrolled iteration: while loops
%
% if you want to terminate a loop on a condition, not a known number of
% iterations, use a while loop
%
% Can always simulate a |for| with a |while|, not vice versa

help while
%%
% Will repeat expression *while* the condition is true
%%
% * Initialize variables before the first loop
% * Update variables each time thru loop
% * Update termination condition every time
% through the loop      or .....
%
% Warning: if the condition is never false, the loop never stops!#$%@
% Ctrl+C


% Now do Exercise Set 2 of Week 1.

%% Part 3: 1D arrays (vectors) in MATLAB
% Technically, vectors are 2D arrays with 1 trivial dimension.
%% 3.1 Creating arrays
clc
format short

[-1 0 sqrt(2) pi]       % a row vector

zeros(1,6)

ones(1,5)

linspace(2,3,11)  % why 11? a row vector of equally spaced numbers
help linspace

% same as 
2:0.1:3

%%
clc
rand(1,5)         % uniform distribution on [0,1)

randn(1,5)      % standard normal distribution Z = N(0,1) 
% all row vectors

%% 3.2 Array operators
%
% Having produced some vectors, we want to do things with them. 
% Some are obvious:
a = 1:4;b = 5:8;c = [10 100 1000];
a+b
a-b

% a+c

% to add/subtract vectors, must be same shape/size
% a+b'

%%
% some are not so obvious
a<b
% a*b
a\b

%%
% To do elementwise operations, use array operators .*  ./  .^

a.*b
a./b
b.^a

%  *  /  \   ^  are meant for matrix operations (later)
%% Operating on vectors with scalars
clc
a
d = 5*a
e = d+2     % strictly an abuse of notation
ones(1,8)/2
[5 6 -9]>4

%% Scalar functions
% Most MATLAB scalar functions are written to act elementwise on a vector
% i.e. they are `vectorized'

sin(1:7)

%%
% If you write a function that can take a scalar input, try to write it so
% that it can act elementwise on a vector input
%
% This feature eliminates the need for a lot of for loops

for count = 1:7
    sin(count)
end                % never do this!

% it's also faster

%% 3.3 Accessing vector entries
%
% use () to access entries 

xx= 11:20
xx(4)

% Warning: MATLAB arrays start with index 1, not 0 (most languages) 

xx(end)  % the last entry

% xx(0)
% Warning: don't confuse with calling a function
 length(xx)    
 
 %% Vector slices
 %
 % use colon operator
 
 xx(2:5)
%% 3.4 Using arrays to store intermediate results
% Arrays are handy to store a whole set of results 
% e.g. a sequence of iterates
%
% In our Newton func, instead of returning the final value after n iterates, 
% we could store the whole iteration in a vector and return it
x0=2;  numIter = 4;  % just for publishing
xold = x0;      % the old code
for iteration = 1:numIter
    xnew = xold/2+5/(2*xold);
    xold = xnew;
end
root5 = xnew   % only returns the final iterate

%%
x0=2; numIter = 4;   % just for publishing
x(1) = x0;      % initialize xold
for n = 1:numIter
    x(n+1) = x(n)/2+5/(2*x(n));
    % xold = xnew;   no longer necessary
end
iterates = x;  %     the whole sequence of iterates
iterates
 %% 3.5 Representing functions with vectors
 
 x=linspace(0,pi,101);
 y = sin(x);  length(y)
 y(51)
 
 %% Plotting functions
 %
 % The standard plotting commands actually use vectors representing
 % (x_i,f(x_i))
 
 plot(x,y)
 %%
 % Don't forget to use array operators 
 
 plot(x,x.^2)
 
 %% 3.6 Functions acting on vectors
 clc;
 format
 
  x= [1 5 3 7 6]
  
  % There are many useful functions for handling vectors
  min(x)
  max(x) 
  length(x)
  sort(x)
  sum(x)
  prod(x)
  cumsum(x)
  mean(x)
  var(x)
  