function varargout = SpectogramUI(varargin)
% SPECTOGRAMUI MATLAB code for SpectogramUI.fig
%      SPECTOGRAMUI, by itself, creates a new SPECTOGRAMUI or raises the existing
%      singleton*.
%
%      H = SPECTOGRAMUI returns the handle to a new SPECTOGRAMUI or the handle to
%      the existing singleton*.
%
%      SPECTOGRAMUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPECTOGRAMUI.M with the given input arguments.
%
%      SPECTOGRAMUI('Property','Value',...) creates a new SPECTOGRAMUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpectogramUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpectogramUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpectogramUI

% Last Modified by GUIDE v2.5 20-Oct-2017 00:17:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpectogramUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SpectogramUI_OutputFcn, ...
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


% --- Executes just before SpectogramUI is made visible.
function SpectogramUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpectogramUI (see VARARGIN)

% Choose default command line output for SpectogramUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpectogramUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpectogramUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in yes.
function yes_Callback(hObject, eventdata, handles)
% hObject    handle to yes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    recObj = getappdata(0,'evalue');
    y = getaudiodata(recObj);
    totalSample = (0:1:length(y)-1);
    totalSample = totalSample';
    xlswrite(fullfile(pwd,'\Spectrogram.xlsm'),totalSample,'Raw Data','A2');
    xlswrite(fullfile(pwd,'\Spectrogram.xlsm'),y,'Raw Data','B2');
    xlswrite(fullfile(pwd,'\Spectrogram.xlsm'),length(totalSample),'Raw Data','C2');
    
    pause(1);
    
    ExcelApp = actxserver('Excel.Application');
    ExcelApp.Workbooks.Open(fullfile(pwd,'\Spectrogram.xlsm'));
    ExcelApp.Run('clearCells',length(y));
    
    ExcelApp.Quit;
    ExcelApp.release;    
    
    disp('Done exporting values to excel');

% --- Executes on button press in no.
function no_Callback(hObject, eventdata, handles)
% hObject    handle to no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(SpectogramUI)
SpectogramMain;

% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
recObj = getappdata(0,'evalue');
playObj = audioplayer(recObj);
playblocking(playObj);

% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
recObj = getappdata(0,'evalue');
myRecording = getaudiodata(recObj);

    y = getaudiodata(recObj);
    totalSample = (0:1:length(y)-1);
    totalSample = totalSample';
    %save('Spectrogram_Matlab_Variables');
    plot(y);
