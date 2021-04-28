function[]= guiCalc()

global calc
calc.fig = figure('numbertitle','off','name','Calculator'); 
calc.title = uicontrol('style','text','units','normalized','position',[.335 .85 .2 .09],'string','Calculator','horizontalalignment','right','ForegroundColor','red');
calc.title = uicontrol('style','text','units','normalized','position',[.079 .82 .15 .05],'string','First Number','horizontalalignment','right','ForegroundColor','blue');
calc.title = uicontrol('style','text','units','normalized','position',[.75 .82 .15 .05],'string','Second Number','horizontalalignment','right','ForegroundColor','blue');
calc.firstNumber = uicontrol('style','edit','units','normalized','position',[.1 .78 .15 .05],'string','0','horizontalalignment','right');
calc.secondNumber = uicontrol('style','edit','units','normalized','position',[.75 .78 .15 .05],'string','0','horizontalalignment','right');
calc.answerNumberDisplay = uicontrol('style','text','units','normalized','position',[.44 .1 .09 .095],'string','Answer','horizontalalignment','right');
calc.operation = uicontrol('style','popupmenu','units','normalized','position',[.45 .78 .09 .05],'string',{'+','-','*','/'},'horizontalalignment','right','callback',{@calculate});
calc.calculate= uicontrol('style','pushbutton','units','normalized','position',[.425 .43 .15 .05],'string','Calculate','callback',{@calculate});
calc.clear= uicontrol('style','pushbutton','units','normalized','position',[.47 .6 .05 .05],'string','Clear','callback',{@clear});
%my text titles, 2 edit boxes, answer text, order of operation popup menu and calculate
%push button that's called back to the calculate function, and also my
%clear push button that is called back to its own clear function

  function[]= calculate(hObject,eventdata)
      
%         op= get(calc.operation,'String');
        op2= get(calc.operation,'Value');
        %created this variable to represent the values of the popup menu
        
        num1= str2num(calc.firstNumber.String);
        num2= str2num(calc.secondNumber.String);
        ans= 0;
        %converted my strings into number so I could use them in my if
        %statement
    if isempty(num1) || isempty(num2)
           msgbox('Insufficient Value! Please Try A Numeric Value!','Error','error','modal')
    end
    %This checks if the user gives any inputs that are not numeric values,
    %as when converting the strings that are not numbers would give an
    %empty array
       
        if op2 == 1
            ans= num1+num2;
        
            elseif op2 == 2
            ans= num1-num2;
        
            elseif op2 == 3
            ans= num1*num2;
        
            else
            ans= num1/num2;
        end
        %This orders what operation to work on the numbers with based on
        %the popup menus values
        calc.answerNumberDisplay.String = num2str(ans);
        %converting my ans back into my string answer so it can be
        %displayed 
    end

    function[] = clear(source,event)
        num1=0;
        num2=0;
        calc.firstNumber.String= num2str(num1);
        calc.secondNumber.String= num2str(num2);
     end
%this callback function clears the first and second numbers for the user. Setting
%the strings equal to zero when the clear button is pushed

end
%     