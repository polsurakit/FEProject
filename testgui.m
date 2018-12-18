function varargout = testgui(varargin)
% TESTGUI MATLAB code for testgui.fig
%      TESTGUI, by itself, creates a new TESTGUI or raises the existing
%      singleton*.
%
%      H = TESTGUI returns the handle to a new TESTGUI or the handle to
%      the existing singleton*.
%
%      TESTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTGUI.M with the given input arguments.
%
%      TESTGUI('Property','Value',...) creates a new TESTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before testgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to testgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help testgui

% Last Modified by GUIDE v2.5 18-Dec-2018 12:34:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @testgui_OpeningFcn, ...
                   'gui_OutputFcn',  @testgui_OutputFcn, ...
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


% --- Executes just before testgui is made visible.
function testgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to testgui (see VARARGIN)

% Choose default command line output for testgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes testgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = testgui_OutputFcn(hObject, eventdata, handles) 
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

function add_pushbutton_Callback(hObject, eventdata, handles)
S0 = str2double(get(handles.S0txt,'String'));
r = str2double(get(handles.rtxt,'String'));
sigma = str2double(get(handles.sigmatxt,'String'));
T = str2double(get(handles.Ttxt,'String'));
X = str2num(get(handles.Xtxt,'String'));
H = str2num(get(handles.Htxt,'String'));
xh = [X;H]';
S = simGBM(S0, r, sigma, T, T, 1000);
v0 = multiWCEHPrice(S,xh,r);
set(handles.answer_staticText,'String',num2str(v0));
guidata(hObject, handles);
