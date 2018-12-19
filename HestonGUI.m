function varargout = HestonGUI(varargin)
% HESTONGUI MATLAB code for HestonGUI.fig
%      HESTONGUI, by itself, creates a new HESTONGUI or raises the existing
%      singleton*.
%
%      H = HESTONGUI returns the handle to a new HESTONGUI or the handle to
%      the existing singleton*.
%
%      HESTONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HESTONGUI.M with the given input arguments.
%
%      HESTONGUI('Property','Value',...) creates a new HESTONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HestonGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HestonGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HestonGUI

% Last Modified by GUIDE v2.5 19-Dec-2018 17:54:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HestonGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @HestonGUI_OutputFcn, ...
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


% --- Executes just before HestonGUI is made visible.
function HestonGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HestonGUI (see VARARGIN)

% Choose default command line output for HestonGUI
handles.output = hObject;
set(handles.plotagainst,'SelectionChangeFcn',@Btn_callback); 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HestonGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HestonGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function sliderT_Callback(hObject, eventdata, handles)
% hObject    handle to sliderT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
T = round(get(handles.sliderT,'Value'));
set(handles.editT,'String', num2str(T));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function sliderT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderS0_Callback(hObject, eventdata, handles)
% hObject    handle to sliderS0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
S0 = round(get(handles.sliderS0,'Value'),2);
set(handles.editS0,'String', num2str(S0));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function sliderS0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderS0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editS0_Callback(hObject, eventdata, handles)
% hObject    handle to editS0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editS0 as text
%        str2double(get(hObject,'String')) returns contents of editS0 as a double
S0 = str2double(get(handles.sliderS0,'String'));
set(handles.sliderS0,'Value', str2double(get(hObject,'String')));
S0 = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function editS0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editS0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderSigma_Callback(hObject, eventdata, handles)
% hObject    handle to sliderSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sigma = round(get(handles.sliderSigma,'Value'),2);
set(handles.editSigma,'String', num2str(sigma));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function sliderSigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editSigma_Callback(hObject, eventdata, handles)
% hObject    handle to editSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSigma as text
%        str2double(get(hObject,'String')) returns contents of editSigma as a double
sigma = str2double(get(handles.sliderSigma,'String'));
set(handles.sliderSigma,'Value', str2double(get(hObject,'String')));
sigma = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function editSigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderTT_Callback(hObject, eventdata, handles)
% hObject    handle to sliderTT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
theta = round(get(handles.sliderTT,'Value'),2);
set(handles.editTT,'String', num2str(theta));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function sliderTT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderTT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editTT_Callback(hObject, eventdata, handles)
% hObject    handle to editTT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTT as text
%        str2double(get(hObject,'String')) returns contents of editTT as a double
theta = str2double(get(handles.sliderTT,'String'));
set(handles.sliderTT,'Value', str2double(get(hObject,'String')));
theta = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function editTT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editT_Callback(hObject, eventdata, handles)
% hObject    handle to editT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editT as text
%        str2double(get(hObject,'String')) returns contents of editT as a double
T = str2double(get(handles.sliderT,'String'));
set(handles.sliderT,'Value', str2double(get(hObject,'String')));
T = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function editT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderRho_Callback(hObject, eventdata, handles)
% hObject    handle to sliderRho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
rho = round(get(handles.sliderRho,'Value'),2);
set(handles.editRho,'String', num2str(rho));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function sliderRho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderRho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editRho_Callback(hObject, eventdata, handles)
% hObject    handle to editRho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRho as text
%        str2double(get(hObject,'String')) returns contents of editRho as a double
rho = str2double(get(handles.sliderRho,'String'));
set(handles.sliderRho,'Value', str2double(get(hObject,'String')));
rho = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function editRho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderK_Callback(hObject, eventdata, handles)
% hObject    handle to sliderK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
kappa = round(get(handles.sliderK,'Value'),2);
set(handles.editK,'String', num2str(kappa));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function sliderK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editK_Callback(hObject, eventdata, handles)
% hObject    handle to editK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editK as text
%        str2double(get(hObject,'String')) returns contents of editK as a double
kappa = str2double(get(handles.sliderK,'String'));
set(handles.sliderK,'Value', str2double(get(hObject,'String')));
kappa = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function editK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderD_Callback(hObject, eventdata, handles)
% hObject    handle to sliderD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
delta = round(get(handles.sliderD,'Value'),2);
set(handles.editD,'String', num2str(delta));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function sliderD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editD_Callback(hObject, eventdata, handles)
% hObject    handle to editD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD as text
%        str2double(get(hObject,'String')) returns contents of editD as a double
delta = str2double(get(handles.sliderD,'String'));
set(handles.sliderD,'Value', str2double(get(hObject,'String')));
delta = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function editD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderR_Callback(hObject, eventdata, handles)
% hObject    handle to sliderR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
r = round(get(handles.sliderR,'Value'),2);
set(handles.editR,'String', num2str(r));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function sliderR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editR_Callback(hObject, eventdata, handles)
% hObject    handle to editR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editR as text
%        str2double(get(hObject,'String')) returns contents of editR as a double
r = str2double(get(handles.sliderR,'String'));
set(handles.sliderR,'Value', str2double(get(hObject,'String')));
r = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function editR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editX_Callback(hObject, eventdata, handles)
% hObject    handle to editX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editX as text
%        str2double(get(hObject,'String')) returns contents of editX as a double


% --- Executes during object creation, after setting all properties.
function editX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editH_Callback(hObject, eventdata, handles)
% hObject    handle to editH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editH as text
%        str2double(get(hObject,'String')) returns contents of editH as a double


% --- Executes during object creation, after setting all properties.
function editH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Btn_callback(hObject, eventdata)
handles = guidata(hObject);
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object 
    case 'radiobuttonR'
        set(handles.plottmp,'String','r');
    case 'radiobuttonSigma'
        set(handles.plottmp,'String','sigma');
    case 'radiobuttonTT'
        set(handles.plottmp,'String','theta');
    case 'radiobuttonD'
        set(handles.plottmp,'String','delta');
    case 'radiobuttonRho'
        set(handles.plottmp,'String','rho');
    case 'radiobuttonK'
        set(handles.plottmp,'String','kappa');
    case 'radiobuttonT'
        set(handles.plottmp,'String','T');
    case 'radiobuttonNone'
        set(handles.plottmp,'String','None');
end
guidata(hObject, handles)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.priceval,'String','Calculating');
h = waitbar(0,'Please wait...');
S0 = str2double(get(handles.editS0,'String'));
r = str2double(get(handles.editR,'String'));
sigma0 = str2double(get(handles.editSigma,'String'));
kappa = str2double(get(handles.editK,'String'));
theta = str2double(get(handles.editTT,'String'));
delta = str2double(get(handles.editD,'String'));
rho = str2double(get(handles.editRho,'String'));
T = str2double(get(handles.editT,'String'));
X = str2num(get(handles.editX,'String'));
H = str2num(get(handles.editH,'String'));
xh = [X;H]';
N = T*250;
P = 2000;

S = multiHeston(S0, sigma0, r, kappa, theta, delta, rho, T, N, 10000);
v0 = multiWCEHPrice(S,xh,r);
% set(handles.priceval,'String',num2str(v0));

xaxislabel = get(handles.plottmp,'String');

switch xaxislabel
    case 'r'
        [xval,price] = plotPriceHeston(S0, sigma0, -0.1:0.005:0.2, kappa, theta, delta, rho, T, N, P, xh, 'r');
    case 'sigma'
        [xval,price] = plotPriceHeston(S0, 0:0.005:1, r, kappa, theta, delta, rho, T, N, P, xh, 'sigma');
    case 'kappa'
        [xval,price] = plotPriceHeston(S0, sigma0, r, 0:0.01:1, theta, delta, rho, T, N, P, xh, 'kappa');
    case 'theta'
        [xval,price] = plotPriceHeston(S0, sigma0, r, kappa, 0:0.01:1, delta, rho, T, N, P, xh, 'theta');
    case 'delta'
        [xval,price] = plotPriceHeston(S0, sigma0, r, kappa, theta, 0:0.05:10, rho, T, N, P, xh, 'delta');
    case 'rho'
        [xval,price] = plotPriceHeston(S0, sigma0, r, kappa, theta, delta, -1:0.01:1, T, N, P, xh, 'rho');
    case 'T'
        [xval,price] = plotPriceHeston(S0, sigma0, r, kappa, theta, delta, rho, 1:1:20, N, P, xh, 'T');
    case 'None'
        xval = 1;
        price = 1;     
end

set(handles.priceval,'String',num2str(v0));

axes(handles.axes1)
plot(xval,price, 'LineWidth', 2);
xlabel(xaxislabel);
ylabel('Price');
datacursormode on
close(h)

guidata(hObject, handles);
