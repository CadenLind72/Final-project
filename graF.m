function [] = graF()
close all
global graph
global color
global style
color = 'r';
style = 'o';
graph.figure = figure('numbertitle','on','name','Graph of Functions');
graph.xBox = uicontrol('style','edit','units','normalized','position',[.69 .8 .14 .05],'horizontalalignment','right');
graph.xname = uicontrol('style','text','units','normalized', 'position', [.7 .85 .1 .03 ],'string','x values','horizontalalignment','right');
graph.yBox = uicontrol('style','edit','units','normalized','position',[.83 .8 .14 .05], 'horizontalalignment','right');
graph.yname = uicontrol('style','text','units','normalized','position',[.8 .85 .12 .03], 'string','y values','horizontalalignment','right');
graph.reset = uicontrol('style','Push Button','units','normalized','position',[.9 .005 .1 .075],'string','reset','horizontalalignment','right','callback',@reset);
graph.xAxisName = uicontrol('style','text','units','normalized','position', [ .62 .93 .2 .07],'string','X-Axis Name','horizontalalignment','right');
graph.yAxisName = uicontrol('style','text','units','normalized','position', [ .82 .93 .14 .07],'string','Y-Axis Name','horizontalalignment','right');
graph.xAxisNameBox = uicontrol('style','edit','units','normalized','position', [ .69 .9 .14 .05],'horizontalalignment','right','callback',@plott);
graph.yAxisNameBox = uicontrol('style','edit','units','normalized','position', [ .83 .9 .14 .05],'horizontalalignment','right','callback',@plott);
graph.xmin = uicontrol('style','text','units','normalized','position', [ .01 .89 .14 .1],'string','X Lower Limit','horizontalalignment','right');
graph.ymin = uicontrol('style','text','units','normalized','position', [ .15 .89 .14 .1],'string','Y Lower Limit','horizontalalignment','right');
graph.xminBox = uicontrol('style','edit','units','normalized','position', [ .07 .9 .05 .05],'string','0','horizontalalignment','right','callback',@plott);
graph.yminBox = uicontrol('style','edit','units','normalized','position', [ .22 .9 .05 .05],'string','0','horizontalalignment','right','callback',@plott);
graph.xmax = uicontrol('style','text','units','normalized','position', [ .01 .8 .14 .1],'string','X Max Limit','horizontalalignment','right');
graph.ymax = uicontrol('style','text','units','normalized','position', [ .15 .8 .14 .1],'string','Y Max Limit','horizontalalignment','right');
graph.xmaxBox = uicontrol('style','edit','units','normalized','position', [ .07 .8 .05 .05],'string','10','horizontalalignment','right','callback',@plott);
graph.ymaxBox = uicontrol('style','edit','units','normalized','position', [ .22 .8 .05 .05],'string','10','horizontalalignment','right','callback',@plott);
x = plot(0,0);
x.Visible = 'on';
x.Parent.Units = 'normalized';
x.Parent.Position = [.05 .075 .8 .7];
graph.plot = uicontrol('style','Push Button','units','normalized','position',[.9 .1 .1 .075],'string','plot','horizontalalignment','right','callback',@plott);
Uib = uibuttongroup();
Uib.SelectionChangedFcn = @chgColor;
Uib.Units = 'normalized';
Uib.Position = [.85 .18 .2 .3];
graph.radio(1) = uicontrol(Uib,'style','radiobutton','units','normalized','position',[.1 .7 .9 .3],'string','red','horizontalalignment','right');
graph.radio(2) = uicontrol(Uib,'style','radiobutton','units','normalized','position',[.1 .45 .9 .3],'string','blue','horizontalalignment','right');
graph.radio(3) = uicontrol(Uib,'style','radiobutton','units','normalized','position',[.1 .2 .9 .3],'string','green','horizontalalignment','right');
Uib2 = uibuttongroup();
Uib2.SelectionChangedFcn = @chgStyle;
Uib2.Units = 'normalized';
Uib2.Position = [.85 .476 .2 .3];
graph.radio2(1) = uicontrol(Uib2,'style','radiobutton','units','normalized','position',[.1 .7 .9 .3],'string','cirles','horizontalalignment','right');
graph.radio2(2) = uicontrol(Uib2,'style','radiobutton','units','normalized','position',[.1 .45 .9 .3],'string','x','horizontalalignment','right');
graph.radio2(3) = uicontrol(Uib2,'style','radiobutton','units','normalized','position',[.1 .2 .9 .3],'string','dashed','horizontalalignment','right');
graph.namebar = uicontrol('style','edit','units','normalized','position',[.49 .9 .2 .1],'horizontalalignment','right');
graph.name = uicontrol('style','text','units','normalized','position',[ .29 .89 .2 .1], 'string','name of graph','horizontalalignment','right');
end
function [] = chgColor(source,event)
  global color
    if strcmp(event.NewValue.String,'red')
        color = 'r';
    elseif strcmp(event.NewValue.String,'blue')
        color = 'b';
    elseif  strcmp(event.NewValue.String,'green')
        color = 'g'; 
    end  
end
function [] = chgStyle(source,event)
    global style 
    if strcmp(event.NewValue.String,'circles')
        style = 'o';
    elseif strcmp(event.NewValue.String,'x')
        style = 'x';
    elseif strcmp(event.NewValue.String,'dashed')
        style = '--';
    end
end
function [] = reset(souce,event)
    global graph
    set(graph.xBox,'String','')
    set(graph.yBox,'String','')
    set(graph.namebar,'String','')
    plot(0,0)
end
function [] = plott(source,event) 
    global graph 
    global color
    global style
    xVal = graph.xBox.String;
    xVal = str2num(xVal);
    yVal = graph.yBox.String;
    yVal = str2num(yVal);
    if length(xVal) ~= length(yVal)
        msgbox('Please input the same amount of values. Also make sure each number has a space inbetween them!','Amount of number Error','error','modal')
        return
    end
   
   xLow = graph.xminBox.String;
   xLow = str2num(xLow);
   xMax = graph.xmaxBox.String;
   xMax = str2num(xMax);
   yLow = graph.yminBox.String;
   yLow = str2num(yLow);
   yMax = graph.ymaxBox.String;
   yMax = str2num(yMax);
   if xLow > xMax
       msgbox('Please make The minimum value for x smaller then the maximum','Limit error','error','modal')
       return
   end
   if yLow > yMax
       msgbox('Please make The minimum value for y smaller then the maximum','Limit error','error','modal')
       return
   end
    plot(xVal,yVal,[color style])
    xlim([xLow,xMax])
    xlabel(graph.xAxisNameBox.String)
    ylim([yLow,yMax])
    ylabel(graph.yAxisNameBox.String)
    title(graph.namebar.String)
    
end

