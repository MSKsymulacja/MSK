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

function e11_Callback(hObject, eventdata, handles)
end
function e11_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function uipanel7_SelectionChangeFcn(hObject, eventdata, handles)
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object
    case 'losowo'
	  set(findobj('Tag','t11'),'String','Liczba bitów:');
	  set(findobj('Tag','e11'),'String','1e2');      
     case 'recznie'    
	   set(findobj('Tag','t11'),'String','Podaj bity:');
       set(findobj('Tag','e11'),'String','[1 0 0 1 1 0]');     
end
end

function generuj1_Callback(hObject, eventdata, handles)
bity=str2num(get(handles.edit7,'String'));
snrx=str2num(get(handles.edit2,'String'));
snr=snrx(1):snrx(length(snrx));
wilson=str2num(get(handles.edit4,'String'));
     wykres_BER_msk(bity,snr,wilson/100) 

end

function edit3_Callback(hObject, eventdata, handles)
end

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function generuj1_ButtonDownFcn(hObject, eventdata, handles)
end

function pb4_Callback(hObject, eventdata, handles)
bityy=str2num(get(handles.e11,'String'));
snrr=str2num(get(handles.edit8,'String'));
wart = get(handles.uipanel7, 'SelectedObject');
tagus = get(wart,'Tag');
switch tagus;
     case 'losowo'
     rysuj_msk(bityy,snrr);   
     case 'recznie'  
	 rysuj2_msk(bityy,snrr);
end
end

function edit4_Callback(hObject, eventdata, handles)
end

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function edit2_Callback(hObject, eventdata, handles)
end

function edit7_Callback(hObject, eventdata, handles)
end

function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function edit8_Callback(hObject, eventdata, handles)
end

function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function edit9_Callback(hObject, eventdata, handles)
end

function edit9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function edit10_Callback(hObject, eventdata, handles)
end

function edit10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function edit11_Callback(hObject, eventdata, handles)
end

function edit11_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function pb5_Callback(hObject, eventdata, handles)
przedzial=str2num(get(handles.edit9,'String'));
snrx5=str2num(get(handles.edit10,'String'));
snr5=snrx5(1):snrx5(length(snrx5));
wilson5=str2num(get(handles.edit11,'String'));
[t,ber,up,down]=zmienna_il(przedzial,snr5,wilson5/100);
przedzial=cat(2,num2str(down),' - ',num2str(up));
if (t==0)
   h=msgbox('Przerwano');
else
h=msgbox(cat(2,{'Wymagana liczba powtórzeñ: '},num2str(t),{'Zmierzony BER: '},num2str(ber),{'Przedzia³ Wilsona dla zadanych parametrów: '},przedzial),'Obliczono');
end
end


% --- Executes on button press in Dokumentacja.
function Dokumentacja_Callback(hObject, eventdata, handles)
open('Dokumentacja.pdf')
end