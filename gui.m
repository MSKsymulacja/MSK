function varargout = gui(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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
end

function gui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
end

function varargout = gui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
end

% --------------------------------------------------------------------

function e1_Callback(hObject, eventdata, handles)
end
function e1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object
    case 'losowo'
	  set(findobj('Tag','t1'),'String','Liczba bitów:');
	  set(findobj('Tag','e1'),'String','1e2');      
     case 'recznie'    
	   set(findobj('Tag','t1'),'String','Podaj bity:');
       	  set(findobj('Tag','e1'),'String','[1 0 0 1 1 0]');     
end
end

function generuj1_Callback(hObject, eventdata, handles)
bity=str2num(get(handles.e1,'String'));
snrx=str2num(get(handles.edit2,'String'));
snr=snrx(1):snrx(length(snrx));
wilson=str2num(get(handles.edit4,'String'));
wart = get(handles.uipanel2, 'SelectedObject');
tagus = get(wart,'Tag');
switch tagus;
     case 'losowo'
     wykres_BER_msk(bity,snr,wilson/100) 
     case 'recznie'  
     bity2=length(bity);
	 wykres_BER_msk(bity2,snr,wilson/100)
end
end

function edit3_Callback(hObject, eventdata, handles)
end

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in pushbutton2.

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over generuj1.
function generuj1_ButtonDownFcn(hObject, eventdata, handles)
end


% --- Executes on button press in pb4.
function pb4_Callback(hObject, eventdata, handles)
bityy=str2num(get(handles.e1,'String'));
snrr=str2num(get(handles.edit3,'String'));
wart = get(handles.uipanel2, 'SelectedObject');
tagus = get(wart,'Tag');
switch tagus;
     case 'losowo'
     rysuj_msk(bityy,snrr);   
     case 'recznie'  
	 rysuj2_msk(bityy,snrr);
end
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double

end
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
end



function edit2_Callback(hObject, eventdata, handles)
end
