function varargout = grainGrow(varargin)
% GRAINGROW MATLAB code for grainGrow.fig
%      GRAINGROW, by itself, creates a new GRAINGROW or raises the existing
%      singleton*.
%
%      H = GRAINGROW returns the handle to a new GRAINGROW or the handle to
%      the existing singleton*.
%
%      GRAINGROW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAINGROW.M with the given input arguments.
%
%      GRAINGROW('Property','Value',...) creates a new GRAINGROW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before grainGrow_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to grainGrow_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help grainGrow

% Last Modified by GUIDE v2.5 15-Nov-2017 12:29:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @grainGrow_OpeningFcn, ...
                   'gui_OutputFcn',  @grainGrow_OutputFcn, ...
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


% --- Executes just before grainGrow is made visible.
function grainGrow_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to grainGrow (see VARARGIN)

% Choose default command line output for grainGrow
handles.output = hObject;
map = zeros(300,300)+100;
imagesc(map,[0,100]);
axis off;
grid off;
box off;
colormap gray;
handles.mapReady = 0;
handles.afterReady  = 0;
handles.reserved = 0;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes grainGrow wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = grainGrow_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    sizeX = round(str2double(get(handles.sizeX, 'String')));
    sizeY = round(str2double(get(handles.sizeY, 'String')));
    numOfGrains = round(str2double(get(handles.edit1, 'String')));
    prop = round(str2double(get(handles.propabilityEdit, 'String')));
    emptyPixel = numOfGrains+2;
    if(handles.mapReady)
        map = handles.map;
    else 
        map = zeros(sizeX+2,sizeY+2)+emptyPixel;
    end
    map = growBack(sizeX, sizeY, numOfGrains, map, prop, handles.reserved);
    handles.map = map;
    handles.emptyPixel = emptyPixel;
    handles.numOfGrains = numOfGrains;
    handles.sizeXnum = sizeX;
    handles.sizeYnum = sizeY;
    handles.mapReady = 0;
    handles.afterReady  = 1;
    % Update handles structure
    guidata(hObject,handles);
    


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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



function sizeY_Callback(hObject, eventdata, handles)
% hObject    handle to sizeY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sizeY as text
%        str2double(get(hObject,'String')) returns contents of sizeY as a double


% --- Executes during object creation, after setting all properties.
function sizeY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sizeY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sizeX_Callback(hObject, eventdata, handles)
% hObject    handle to sizeX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sizeX as text
%        str2double(get(hObject,'String')) returns contents of sizeX as a double


% --- Executes during object creation, after setting all properties.
function sizeX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sizeX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in importButton.
function importButton_Callback(hObject, eventdata, handles)
% hObject    handle to importButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Import the data to program
    [ map, sizeX, sizeY, nucl ] = growOpen();
    handles.map = map;
    set(handles.sizeX, 'String', num2str(sizeX));
    set(handles.sizeY, 'String', num2str(sizeY));
    set(handles.edit1, 'String', num2str(nucl));
    growDraw(map, nucl);
    handles.afterReady=1;
    % Update handles structure
    guidata(hObject,handles);



% --- Executes on button press in exportButton.
function exportButton_Callback(hObject, eventdata, handles)
% hObject    handle to exportButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fileName = growSave(handles.map, handles.axes1, max(max(handles.map))-1);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit6.
function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit6


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in inclusionGen.
function inclusionGen_Callback(hObject, eventdata, handles)
% hObject    handle to inclusionGen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    incAmount = round(str2double(get(handles.edit4, 'String')));
    incSize = round(str2double(get(handles.edit5, 'String')));
    incTypeIndex = get(handles.edit6, 'Value');
    sizeX = round(str2double(get(handles.sizeX, 'String')))+2;
    sizeY = round(str2double(get(handles.sizeY, 'String')))+2;
    numOfGrains = round(str2double(get(handles.edit1, 'String')));
    if(get(handles.before, 'Value') == 1)
        incTimeIndex = 1;
        % generate map 
        map = zeros(sizeX, sizeY)+numOfGrains+2;
    else
        incTimeIndex = 2;
        map = handles.map;
    end
    map = growInclusion(incAmount, incSize, incTypeIndex, incTimeIndex, map, sizeX, sizeY, handles.afterReady);
    growDraw(map, numOfGrains);
    handles.map = map;
    handles.mapReady = 1;
    % Update handles structure
    guidata(hObject,handles);
       
    
% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function propabilityEdit_Callback(hObject, eventdata, handles)
% hObject    handle to propabilityEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of propabilityEdit as text
%        str2double(get(hObject,'String')) returns contents of propabilityEdit as a double


% --- Executes during object creation, after setting all properties.
function propabilityEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to propabilityEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in grainSelection.
function grainSelection_Callback(hObject, eventdata, handles)
% hObject    handle to grainSelection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    map = handles.map;
    emptyPx = handles.emptyPixel;
    if(get(handles.substr,'Value') == 1)
        newmap = growSubstructure(map, emptyPx, handles.sizeXnum, handles.sizeYnum, [3, 12, 24]);
    else
        newmap = growDualPhase(map, emptyPx, handles.sizeXnum, handles.sizeYnum, [3, 12, 24]);
    end
    growDraw(newmap,handles.numOfGrains);
    handles.map = newmap;
    handles.reserved = [3, 12, 24];
    handles.mapReady = 1;
% Update handles structure
    guidata(hObject,handles);
       


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OrigDlgH = ancestor(hObject, 'figure');
delete(OrigDlgH);
grainGrow;


% --- Executes on button press in BColor.
function BColor_Callback(hObject, eventdata, handles)
% hObject    handle to BColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    newmap = grainBColoring( handles.map, handles.sizeXnum, handles.sizeYnum);
    growDraw(newmap, handles.numOfGrains);
    handles.map = newmap;
% Update handles structure
    guidata(hObject,handles);



% --- Executes on button press in clearAfter.
function clearAfter_Callback(hObject, eventdata, handles)
% hObject    handle to clearAfter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    newmap = growClearAfterBCol(handles.map, handles.sizeXnum, handles.sizeYnum, handles.emptyPixel);
    growDraw(newmap, handles.numOfGrains);
    handles.map = newmap;
    handles.mapReady = 1;
% Update handles structure
    guidata(hObject,handles);