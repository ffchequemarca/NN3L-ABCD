function varargout = GUI_NN(varargin)
% GUI_NN MATLAB code for GUI_NN.fig
%      GUI_NN, by itself, creates a new GUI_NN or raises the existing
%      singleton*.
%
%      H = GUI_NN returns the handle to a new GUI_NN or the handle to
%      the existing singleton*.
%
%      GUI_NN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_NN.M with the given input arguments.
%
%      GUI_NN('Property','Value',...) creates a new GUI_NN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_NN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_NN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_NN

% Last Modified by GUIDE v2.5 17-Oct-2018 09:01:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_NN_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_NN_OutputFcn, ...
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


% --- Executes just before GUI_NN is made visible.
function GUI_NN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_NN (see VARARGIN)

% Choose default command line output for GUI_NN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_NN wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_NN_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global filename Input Imagen

[file,path] = uigetfile;
filename=strcat(path,file);
Imagen_No=imread(filename);
[Input,Imagen]= NN_ImageProcessing(filename);

axes(handles.axes1)
handles.axes1=Imagen_No;
imagesc(handles.axes1)
axis off

axes(handles.axes2)
handles.axes2=Imagen;
imagesc(handles.axes2)
axis off



% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global Input 
Letras=['A','B','H','Z','X','M','*','T','O','#'];
Out=NN3L_Run(Input);
Out_tlbx=NN_Toolbox(Input');

set(handles.uitable1,'Data',(Out'.*100));
set(handles.uitable2,'Data',(abs(Out_tlbx.*100)));

Pos=find(Out==max(Out));
set(handles.text3,'string',Letras(Pos));
set(handles.text4,'string',(Out(Pos)*100));

Pos=find(Out_tlbx==max(Out_tlbx));
set(handles.text5,'string',Letras(Pos));
set(handles.text6,'string',(Out_tlbx(Pos)*100));





% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
