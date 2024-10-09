function varargout = untitled(varargin)
% UNTITLED M-file for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 28-Apr-2014 23:41:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

global cards symbol value displayvalue n h totalcards dealerpoints playerpoints totalgame
global dealer_a player_a dealer1stsymbol dealer1stdisplayvalue totalcash bet playerbet cardsleft
%cards=index of cards
%symbol,1=spades,2=hearts,3=clubs,4=diamonds
%n=the n^{th} card will appear next, cards(n) tells which card it is.
%eg. cards(n)=10, first set, spade 10;
%h are handles of pics, 4 columns by 8 rows, dealer symbol, dealer number;
%player symbol, player number;
%value=points, K=10, Q=10...
%displayvalue=K,Q,J,...
%totalcards=how many cards the player have currently
%dealerpoints playerpoints=calculate points
%dealer_a, player_a=how many A each one has that has been counted as 11.
%dealer1stsymbol=store dealer's first covered card's symbol
%dealer1stdisplayvalue=store dealer's first covered card's display value(K or 4...)
%totalcash=how much money you have now
%playerbet=get how much player bet at current round, once push ok button,
%the bet will be updated in calculation
%cardsleft=how many cards are left
[index,cards]=sort(rand(1,4*13*8));
symbol=ceil((mod(cards-1,52)+1)/13);
value=mod(cards-1,13)+1;
for i=1:length(value)
    if value(i)==1
        displayvalue{i}='A';
    elseif value(i)>1 && value(i)<=10
        displayvalue{i}=num2str(value(i));
    elseif value(i)==11
        displayvalue{i}='J';
    elseif value(i)==12
        displayvalue{i}='Q';
    elseif value(i)==13
        displayvalue{i}='K';
    end
end
for i=1:length(value)
    if value(i)>10
        value(i)=10;
    end
end

n=1;
totalcards=0;
dealer_a=0;player_a=0;

totalcash=100;
totalgame=0;
bet=0;
cardsleft=4*13*8;

h{1,1}=handles.d11;
h{1,2}=handles.d12;
h{2,1}=handles.d21;
h{2,2}=handles.d22;
h{3,1}=handles.d31;
h{3,2}=handles.d32;
h{4,1}=handles.d41;
h{4,2}=handles.d42;
h{5,1}=handles.d51;
h{5,2}=handles.d52;
h{6,1}=handles.d61;
h{6,2}=handles.d62;
h{7,1}=handles.d71;
h{7,2}=handles.d72;
h{8,1}=handles.d81;
h{8,2}=handles.d82;
h{1,3}=handles.p11;
h{1,4}=handles.p12;
h{2,3}=handles.p21;
h{2,4}=handles.p22;
h{3,3}=handles.p31;
h{3,4}=handles.p32;
h{4,3}=handles.p41;
h{4,4}=handles.p42;
h{5,3}=handles.p51;
h{5,4}=handles.p52;
h{6,3}=handles.p61;
h{6,4}=handles.p62;
h{7,3}=handles.p71;
h{7,4}=handles.p72;
h{8,3}=handles.p81;
h{8,4}=handles.p82;


set(handles.cash,'String', num2str(totalcash));
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in onemore.
function onemore_Callback(hObject, eventdata, handles)
% hObject    handle to onemore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cards symbol value displayvalue n h totalcards dealerpoints playerpoints totalgame
global dealer_a player_a dealer1stsymbol dealer1stdisplayvalue totalcash bet playerbet cardsleft
if symbol(n)==1
    pic = imread('spades.svg');
elseif symbol(n)==2
    pic = imread('hearts.svg');
elseif symbol(n)==3
    pic = imread('clubs.svg');
elseif symbol(n)==4
    pic = imread('diamonds.svg');
end
image(pic,'Parent',h{totalcards+1,3});
set(h{totalcards+1,3},'visible','off');
set(h{totalcards+1,4},'String',displayvalue{n});
%set(h{totalcards+1,4},'visible','on');
if value(n)==1
    if playerpoints+11>21
        playerpoints=playerpoints+1;
    else
        playerpoints=playerpoints+11;
        player_a=player_a+1;
    end
else
    playerpoints=playerpoints+value(n);
end
totalcards=totalcards+1;
n=n+1;
cardsleft=cardsleft-1;
set(handles.cardsleft,'String',num2str(cardsleft));
if playerpoints>21 && player_a>0 %if any ACE needs to be counted as 1
    player_a=player_a-1;
    playerpoints=playerpoints-10;
end
set(handles.playerpoints,'String',num2str(playerpoints));
if playerpoints>21
    set(handles.result, 'String', 'Lose');
    totalcash=totalcash-bet;
    set(handles.cash,'String',num2str(totalcash));
end


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cards symbol value displayvalue n h totalcards dealerpoints playerpoints totalgame
global dealer_a player_a dealer1stsymbol dealer1stdisplayvalue totalcash bet playerbet cardsleft
%show dealer's 1st card
pause(1);
if dealer1stsymbol==1
    pic = imread('spades.svg');
elseif dealer1stsymbol==2
    pic = imread('hearts.svg');
elseif dealer1stsymbol==3
    pic = imread('clubs.svg');
elseif dealer1stsymbol==4
    pic = imread('diamonds.svg');
end
image(pic,'Parent',h{1,1});
set(h{1,1},'visible','off');
set(h{1,2},'String',dealer1stdisplayvalue);
set(handles.dealerpoints,'String',num2str(dealerpoints));

%decide whether dealer needs more cards
dealertotalcards=2;
while dealerpoints<17
    if symbol(n)==1
        pic = imread('spades.svg');
    elseif symbol(n)==2
        pic = imread('hearts.svg');
    elseif symbol(n)==3
        pic = imread('clubs.svg');
    elseif symbol(n)==4
        pic = imread('diamonds.svg');
    end
    pause(1);
    image(pic,'Parent',h{dealertotalcards+1,1});
    set(h{dealertotalcards+1,1},'visible','off');
    set(h{dealertotalcards+1,2},'String',displayvalue{n});
    if value(n)==1
        if dealerpoints+11>21
            dealerpoints=dealerpoints+1;
        else
            dealerpoints=dealerpoints+11;
            dealer_a=dealer_a+1;
        end
    else
        dealerpoints=dealerpoints+value(n);
    end
    if dealerpoints>21 && dealer_a>0 %if any ACE needs to be counted as 1
        dealer_a=dealer_a-1;
        dealerpoints=dealerpoints-10;
    end        
    set(handles.dealerpoints,'String',num2str(dealerpoints))%show dealerpoints
    dealertotalcards=dealertotalcards+1;
    n=n+1;
    cardsleft=cardsleft-1;
    set(handles.cardsleft,'String',num2str(cardsleft));
end

%display result
if dealerpoints>21
    set(handles.result,'String','Win');
    totalcash=totalcash+bet;
    set(handles.cash,'String',num2str(totalcash));
else
    if dealerpoints>playerpoints
        set(handles.result,'String','Lose');
        totalcash=totalcash-bet;
        set(handles.cash,'String',num2str(totalcash));
    elseif dealerpoints==playerpoints
        set(handles.result,'String','Push');
    elseif dealerpoints<playerpoints
        set(handles.result,'String','Win');
        totalcash=totalcash+bet;
        set(handles.cash,'String',num2str(totalcash));
    end
end


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cards symbol value displayvalue n h totalcards dealerpoints playerpoints totalgame
global dealer_a player_a dealer1stsymbol dealer1stdisplayvalue totalcash bet playerbet cardsleft
if bet<5 | mod(bet,5)~=0
    errordlg('Your bet must be greater than $5. Bet then click confirm.');
else
    for i=1:8 %clear previous cards
        delete(allchild(h{i,1}));
        delete(allchild(h{i,3}));
        set(h{i,2},'String','');
        set(h{i,4},'String','');    
    end
    %reset points calculator
    totalcards=0;
    dealerpoints=0; playerpoints=0;
    dealer_a=0; player_a=0;
    set(handles.dealerpoints,'String',num2str(dealerpoints));
    set(handles.playerpoints,'String',num2str(playerpoints));
    set(handles.result,'String','');
    %initialize a new game with 4 cards
    %one 4 dealer, one 4 player, one 4 dealer, one 4 player
    %dealer 1st card
    dealer1stsymbol=symbol(n);
    dealer1stdisplayvalue=displayvalue{n};
    if value(n)==1
        dealer_a=dealer_a+1;
        dealerpoints=11;
    else
        dealerpoints=value(n);
    end
    %set(h{1,2},'visible','on');
    n=n+1;
    cardsleft=cardsleft-1;
    set(handles.cardsleft,'String',num2str(cardsleft));

    %player 1st card
    if symbol(n)==1
        pic = imread('spades.svg');
    elseif symbol(n)==2
        pic = imread('hearts.svg');
    elseif symbol(n)==3
        pic = imread('clubs.svg');
    elseif symbol(n)==4
        pic = imread('diamonds.svg');
    end
    image(pic,'Parent',h{1,3});
    set(h{1,3},'visible','off');
    set(h{1,4},'String',displayvalue{n});
    %set(h{1,4},'visible','on');
    if value(n)==1
        player_a=player_a+1;
        playerpoints=11;
    else
        playerpoints=value(n);
    end
    set(handles.playerpoints,'String',num2str(playerpoints));
    totalcards=totalcards+1;
    n=n+1;
    cardsleft=cardsleft-1;
    set(handles.cardsleft,'String',num2str(cardsleft));

    %dealer 2nd card
    if symbol(n)==1
        pic = imread('spades.svg');
    elseif symbol(n)==2
        pic = imread('hearts.svg');
    elseif symbol(n)==3
        pic = imread('clubs.svg');
    elseif symbol(n)==4
        pic = imread('diamonds.svg');
    end
    image(pic,'Parent',h{2,1});
    set(h{2,1},'visible','off');
    set(h{2,2},'String',displayvalue{n});
    if value(n)==1
        if dealerpoints+11>21
            dealerpoints=dealerpoints+1;
        else
            dealerpoints=dealerpoints+11;
            dealer_a=dealer_a+1;
        end
    else
        dealerpoints=dealerpoints+value(n);
    end
    %set(h{2,2},'visible','on');
    n=n+1;
    cardsleft=cardsleft-1;
    set(handles.cardsleft,'String',num2str(cardsleft));

    %player 2nd card
    if symbol(n)==1
        pic = imread('spades.svg');
    elseif symbol(n)==2
        pic = imread('hearts.svg');
    elseif symbol(n)==3
        pic = imread('clubs.svg');
    elseif symbol(n)==4
        pic = imread('diamonds.svg');
    end
    image(pic,'Parent',h{2,3});
    set(h{2,3},'visible','off');
    set(h{2,4},'String',displayvalue{n});
    %set(h{2,4},'visible','on');
    if value(n)==1
        if playerpoints+11>21
            playerpoints=playerpoints+1;
        else
            playerpoints=playerpoints+11;
            player_a=player_a+1;
        end
    else
        playerpoints=playerpoints+value(n);
    end
    set(handles.playerpoints,'String',num2str(playerpoints));
    totalcards=totalcards+1;
    n=n+1;
    cardsleft=cardsleft-1;
    set(handles.cardsleft,'String',num2str(cardsleft));
    if playerpoints==21 && dealerpoints<21
        set(handles.result,'String','Win');
        totalcash=totalcash+1.5*bet;
        set(handles.cash,'String',num2str(totalcash));
    end

    totalgame=totalgame+1;
    set(handles.totalgame,'String',num2str(totalgame));
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global playerbet
playerbet = str2double(get(hObject,'String'));

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in confirm.
function confirm_Callback(hObject, eventdata, handles)
% hObject    handle to confirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bet playerbet
bet=playerbet;


% --- Executes on button press in shuffle.
function shuffle_Callback(hObject, eventdata, handles)
% hObject    handle to shuffle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cards symbol value displayvalue n h totalcards dealerpoints playerpoints totalgame
global dealer_a player_a dealer1stsymbol dealer1stdisplayvalue totalcash bet playerbet cardsleft
[index,cards]=sort(rand(1,4*13*8));
symbol=ceil((mod(cards-1,52)+1)/13);
value=mod(cards-1,13)+1;
for i=1:length(value)
    if value(i)==1
        displayvalue{i}='A';
    elseif value(i)>1 && value(i)<=10
        displayvalue{i}=num2str(value(i));
    elseif value(i)==11
        displayvalue{i}='J';
    elseif value(i)==12
        displayvalue{i}='Q';
    elseif value(i)==13
        displayvalue{i}='K';
    end
end
for i=1:length(value)
    if value(i)>10
        value(i)=10;
    end
end

n=1;
cardsleft=4*13*8;


% --- Executes on button press in double.
function double_Callback(hObject, eventdata, handles)
% hObject    handle to double (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cards symbol value displayvalue n h totalcards dealerpoints playerpoints totalgame
global dealer_a player_a dealer1stsymbol dealer1stdisplayvalue totalcash bet playerbet cardsleft
bet=bet*2;
set(handles.edit1,'String',num2str(bet));
%do one more
if symbol(n)==1
    pic = imread('spades.svg');
elseif symbol(n)==2
    pic = imread('hearts.svg');
elseif symbol(n)==3
    pic = imread('clubs.svg');
elseif symbol(n)==4
    pic = imread('diamonds.svg');
end
image(pic,'Parent',h{totalcards+1,3});
set(h{totalcards+1,3},'visible','off');
set(h{totalcards+1,4},'String',displayvalue{n});
%set(h{totalcards+1,4},'visible','on');
if value(n)==1
    if playerpoints+11>21
        playerpoints=playerpoints+1;
    else
        playerpoints=playerpoints+11;
        player_a=player_a+1;
    end
else
    playerpoints=playerpoints+value(n);
end
totalcards=totalcards+1;
n=n+1;
cardsleft=cardsleft-1;
set(handles.cardsleft,'String',num2str(cardsleft));
if playerpoints>21 && player_a>0 %if any ACE needs to be counted as 1
    player_a=player_a-1;
    playerpoints=playerpoints-10;
end
set(handles.playerpoints,'String',num2str(playerpoints));
if playerpoints>21
    set(handles.result, 'String', 'Lose');
    totalcash=totalcash-bet;
    set(handles.cash,'String',num2str(totalcash));
else
    %do stop
    stop_Callback(hObject, eventdata, handles);
    set(handles.edit1,'String','');
    bet=0;
end
