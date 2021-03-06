function varargout = GBMGUI(varargin)
% GBMGUI MATLAB code for GBMGUI.fig
%      GBMGUI, by itself, creates a new GBMGUI or raises the existing
%      singleton*.
%
%      H = GBMGUI returns the handle to a new GBMGUI or the handle to
%      the existing singleton*.
%
%      GBMGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GBMGUI.M with the given input arguments.
%
%      GBMGUI('Property','Value',...) creates a new GBMGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GBMGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GBMGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GBMGUI

% Last Modified by GUIDE v2.5 20-Dec-2018 00:37:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GBMGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GBMGUI_OutputFcn, ...
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


% --- Executes just before GBMGUI is made visible.
function GBMGUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
set(handles.plotagainst,'SelectionChangeFcn',@Btn_callback); 

guidata(hObject, handles);

% UIWAIT makes GBMGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GBMGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




function S0_Callback(hObject, eventdata, handles)
S0 = round(get(handles.S0,'Value'),2);
set(handles.S0txt,'String', num2str(S0));
guidata(hObject, handles);

function S0_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function S0txt_Callback(hObject, eventdata, handles)
S0 = str2double(get(handles.S0,'String'));
set(handles.S0,'Value', str2double(get(hObject,'String')));
S0 = str2double(get(hObject,'String'));


function S0txt_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function rslider_Callback(hObject, eventdata, handles)
r = round(get(handles.rslider,'Value'),2);
set(handles.rtxt,'String', num2str(r));
guidata(hObject, handles);


function rslider_CreateFcn(hObject, eventdata, handles)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function rtxt_Callback(hObject, eventdata, handles)
r = str2double(get(handles.rslider,'String'));
set(handles.rslider,'Value', str2double(get(hObject,'String')));
r = str2double(get(hObject,'String'));

function rtxt_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function sigmaslider_Callback(hObject, eventdata, handles)
sigma = round(get(handles.sigmaslider,'Value'),2);
set(handles.sigmatxt,'String', num2str(sigma));
guidata(hObject, handles);

function sigmaslider_CreateFcn(hObject, eventdata, handles)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function sigmatxt_Callback(hObject, eventdata, handles)
sigma = str2double(get(hObject,'String')) ;
set(handles.sigmaslider,'Value', str2double(get(hObject,'String')));
sigma = str2double(get(hObject,'String'));

function sigmatxt_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Tslider_Callback(hObject, eventdata, handles)
T = round(get(handles.Tslider,'Value'));
set(handles.Ttxt,'String', num2str(T));
guidata(hObject, handles);

function Tslider_CreateFcn(hObject, eventdata, handles)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function Ttxt_Callback(hObject, eventdata, handles)
T = str2double(get(handles.Tslider,'String'));
set(handles.Tslider,'Value', str2double(get(hObject,'String')));
T = str2double(get(hObject,'String'));

function Ttxt_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Xtxt_Callback(hObject, eventdata, handles)

function Xtxt_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Htxt_Callback(hObject, eventdata, handles)

function Htxt_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Btn_callback(hObject, eventdata)
handles = guidata(hObject);
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object 
    case 'rswitch'
        set(handles.plottmp,'String','r');
    case 'sigmaswitch'
        set(handles.plottmp,'String','sigma');
    case 'Tswitch'
        set(handles.plottmp,'String','T');
    case 'noneswitch'
        set(handles.plottmp,'String','None');
end
guidata(hObject, handles)


function add_pushbutton_Callback(hObject, eventdata, handles)
set(handles.answer_staticText,'String','Calculating');
h = waitbar(0,'Please wait...');

S0 = str2double(get(handles.S0txt,'String'));
r = str2double(get(handles.rtxt,'String'));
sigma = str2double(get(handles.sigmatxt,'String'));
T = str2double(get(handles.Ttxt,'String'));
X = str2num(get(handles.Xtxt,'String'));
H = str2num(get(handles.Htxt,'String'));
xh = [X;H]';

S = simGBM(S0, r, sigma, T, T, 100000);
v0 = multiWCEHPrice(S,xh,r);
set(handles.answer_staticText,'String',num2str(v0));
% set(handles.answer_staticText,'String',get(handles.plottmp,'String'));

xaxislabel = get(handles.plottmp,'String');

switch xaxislabel
    case 'r'
        [xval,price] = plotPrice(S0, -0.2:0.005:0.2, sigma, T, 10000,  xh, 'r');
    case 'sigma'
        [xval,price] = plotPrice(S0, r, 0:0.005:0.5, T, 10000,  xh, 'sigma');
    case 'T'
        [xval,price] = plotPrice(S0, r, sigma, 1:20, 10000,  xh, 'T');
    case 'None'
        xval = 1;
        price = 1;     
end

axes(handles.axes1)
plot(xval,price, 'LineWidth', 2);
xlabel(xaxislabel);
ylabel('Price');
datacursormode on
close(h)

guidata(hObject, handles);


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
