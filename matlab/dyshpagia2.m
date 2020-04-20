function varargout = dyshpagia2(varargin)
% DYSHPAGIA2 MATLAB code for dyshpagia2.fig
%      DYSHPAGIA2, by itself, creates a new DYSHPAGIA2 or raises the existing
%      singleton*.
%
%      H = DYSHPAGIA2 returns the handle to a new DYSHPAGIA2 or the handle to
%      the existing singleton*.
%
%      DYSHPAGIA2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DYSHPAGIA2.M with the given input arguments.
%
%      DYSHPAGIA2('Property','Value',...) creates a new DYSHPAGIA2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dyshpagia2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dyshpagia2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dyshpagia2

% Last Modified by GUIDE v2.5 27-Sep-2017 11:00:19

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dyshpagia2_OpeningFcn, ...
                   'gui_OutputFcn',  @dyshpagia2_OutputFcn, ...
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


% --- Executes just before dyshpagia2 is made visible.
function dyshpagia2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dyshpagia2 (see VARARGIN)

% set(handles.parar_b,'UserData',0)
% Choose default command line output for dyshpagia2
% imaqreset

% axes(handles.axes1);
% vid = webcam(1);
% himage = image(zeros(720,1280,3),'parent',handles.axes1);
% preview(vid,himage);
% Update handles structure

handles.output = hObject;

guidata(hObject, handles);
movegui(hObject,'center');

% UIWAIT makes dyshpagia2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dyshpagia2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



axes(handles.axes1); %\ù��° ���� ����

%%%%%%%%%%%%%%%%%%%%%%%%%%%���� ��ķ ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imaqhwinfo

vid =videoinput('winvideo',1);  %��ķ�� 1�� ����
hImage=image(zeros(750,950,3),'Parent',handles.axes1); %������ ũ�� ���� �� RGB���� ����
preview(vid,hImage); %���� ����
assignin('base','vid',vid); %�����Լ��� Ŀ���â�� ���


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


vid=evalin('base','vid'); %�����Լ��� Ŀ���â���� ������
im = getsnapshot(vid); %���� ĸó
axes(handles.axes2) %�ι�° ���� ����
imshow(im) %���� ���
assignin('base','im',im); %ĸ�� ������ Ŀ��� â�� ���
% 
% try
%     img = handles.axes1;
%     i = getsnapshot(img);
%     axes(handles.axes2)
%     imshow(i);
%     imwrite(i,strcat(['image',num2str(n),'jpg']))
% catch
% end
%     n = str2double(get(handles.axes1,'string')) +1;
%     set(handles.axes1,'string'num2str(n));
%     
%     axes(handles.axes2)
%     imshow(i);
%     imwrite(i,strcat(['im

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im=evalin('base','im'); %Ŀ�ǵ� â���� image(ĸó)������ ����� 
global Iopenned2
% [h,s,v] = rgb2hsv(im); % Extract out the H, S, and V images individually


%%%%%%%%%%%%%%%%%%%%%%%%%%%������׷� ��Ʈ��Ī%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
streched_part = imadjust(im,stretchlim(im)); %������׷� ��Ʈ��Ī
decorrstreyched_part = decorrstretch(im,'tol',0.01); 
% [h2,s2,v2] =  rgb2hsv(decorrstreyched_part);
% hsv_img = h2.* s2.* v2;
axes(handles.axes2);
imshow(decorrstreyched_part);
assignin('base','decorrstreyched_part',decorrstreyched_part);

dr = decorrstreyched_part(:,:,1); 
dg = decorrstreyched_part(:,:,2);
db = decorrstreyched_part(:,:,3);
axes(handles.axes3) %������׷����
imhist(dr);
axes(handles.axes4) %������׷����
imhist(dg);
axes(handles.axes5) %������׷����
imhist(db);
% 

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%RGB������ HSV�� ��ȯ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
decorrstreyched_part=evalin('base','decorrstreyched_part');
[h2,s2,v2]=rgb2hsv(decorrstreyched_part);
% h2 = decorrstreyched_part(:,:,1);
% s2 = decorrstreyched_part(:,:,2);
% v2 = decorrstreyched_part(:,:,3);
% [h2,s2,v2] =  decorrstreyched_part;
%imshowpair(h,h2,'montage'),title('convert H, H1');

%H range thresold
level1=evalin('base','level1'); %H���� Ŀ�ǵ� â���� �ҷ���
level2=evalin('base','level2'); %S���� Ŀ�ǵ� â���� �ҷ���
level3=evalin('base','level3'); %V���� Ŀ�ǵ� â���� �ҷ���

Ithresh = im2bw(h2,level1); %H���� ����ȭ ����

%V range thresold

Ithresh2 = im2bw(v2,level2); %S���� ����ȭ ����
%s range thresold

Ithresh3 = im2bw(s2,level3); %V���� ����ȭ ����

sum = Ithresh.* Ithresh2 .* Ithresh3; %H,S,V���� ����ȭ ��
axes(handles.axes6);
imshow(sum);
% imfill(���� ä��)
Ifill = imfill(sum,'holes'); %HSV���� ������ ���� ����

se = strel('disk',3);  %imdilate(���� Ȯ��)
Iopenned = imdilate(Ifill,se);

se2 = strel('disk',20); %imopen (���� ħ��)
Iopenned2 = imopen(Iopenned,se2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%����� ������ ���� �׸�ڽ� ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ����� ������ ���� �׸�ڽ� ����
Ireg = regionprops(Iopenned2,'centroid'); 
[labeled,numObjects] = bwlabel(Iopenned2,4);

assignin('base','Iopenned2',Iopenned2);

% Ư¡ ���� ���� ���ϴ� Ư¡�� �����ϸ��
stats = regionprops(labeled,'Eccentricity','Area','BoundingBox');
areas = [stats.Area];
eccentricities = [stats.Eccentricity];

idxOfskttles = find(eccentricities);
statsDefects = stats(idxOfskttles);

im=evalin('base','im'); 
% axes(handles.axes6);
% imshow(Iopenned2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%����� ������ ���� �׸�ڽ� ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on;
for idx = 1:length(idxOfskttles)
    h = rectangle('Position',statsDefects(idx).BoundingBox);
    set(h,'EdgeColor',[.75 0 0]);
    hold on;
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%���õ� ������ �κ� ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Iopenned2=evalin('base','Iopenned2');
part=evalin('base','part');

%%%%%%%%%%%%%%%%%%%%%%%%%%%Ư¡�� ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ư¡�� ����
C = corner(Iopenned2,'Harris',200); %�ڳ��� 200�� ����

axes(handles.axes7) %4��° ���� ����
imshow(part);
hold on
plot(C(:,1),C(:,2),'r*'); %�ڳ� �κ� ������ üũ 


%%%%%%%%%%%%%%%%%%%%%%%%%%%ù��° �ڳ��� ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ù��° �ڳ��� ����
x = C(:,1); 
y = C(:,2);
[row, col] = size(C);
first_point = min(x);
[fx]=find(C == first_point);
f=C(fx(1,:),:);

total_x = 0;
total_y = 0;
for n=1:row
    total_x= x(n) + total_x;
    total_y= y(n) + total_y;
    if (n == row)
        %���� �߽��� ã��, ù���� ã��
        mx=total_x/row;
        my=total_y/row;
        
        hold on;
        plot(mx,my,'g*');
        plot(f(1),f(2),'g*');
        point1 = [mx,my];
        point2 = [f(1),f(2)];
        %first point to second point distace
        h = imdistline(gca,[mx,f(1)],[my,f(2)]);
        fapi = iptgetapi(h);
        dist = fapi.getDistance();
        fpoint = fapi.getPosition();
        %���� ��ȯ
        dist = dist * 0.013
        fapi.setLabelTextFormatter('%0.0f');
        
    end
    
end
%% ù��° �ڳ��� ���� ���������� �Ÿ� ȹ��
assignin('base','dist',dist);
for n=1:row
    td = imdistline(gca,[mx,x(n)],[my,y(n)]);
    api = iptgetapi(td);
    dist(n) = api.getDistance();
    
    % �� ���� ã��
    [fx,fy]=find(dist == dist(n));
    % f(1)�������� Ŭ��� �����Ѵ�.  
    f=C(fy(1,:),:);
    
    if (f(1) <= mx)  % ������ ���� �����ʿ��� ����Ŀ� ���� �޶�����. 
        api.delete();
        dist(n) = 0;
    end
    
    if (n == row)
        % �ִ� �Ÿ� ã��
        mdist = max(dist);
        % �ִ� �Ÿ� �߻� ���� 
        [fx,fy]=find(dist == mdist);
        %�ִ밪 ��ǥ ��ġ 
        f=C(fy(1,:),:);
        point3 = [f(1),f(2)];

        plot(f(1),f(2),'g*');
        
        h = imdistline(gca,[mx,f(1)],[my,f(2)]);
        sapi = iptgetapi(h);
        dist2 = sapi.getDistance();
        dist2 = dist2 * 0.013
        spoint = sapi.getPosition();
        sapi.setLabelTextFormatter('%0.0f');
        %set(handles.Text6,'string',dist2);
    end
    api.delete();
end
assignin('base','dist2',dist2);
hold off

%dist=dist + dist2
dist=evalin('base','dist');
dist2=evalin('base','dist2');
total = dist + dist2;
assignin('base','total',total);
set(handles.text6,'string',total);
% --- Executes n slider movement.



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%���� ȹ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global im im2
[path,user_cance] = imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im = imread(path);
im = im2double(im);
im2 = im;
axes(handles.axes2);
imshow(im);
assignin('base','im',im);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%������ ���� ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im=evalin('base','im');
Iopenned2=evalin('base','Iopenned2');

BW2 = bwareaopen(Iopenned2,8000);

[fx,fy]=find(BW2 == 1);

% color Threshold�� ���� ����ȭ maskȭ�鿡�� ���� ū x�� y���� ȹ��
fymin = min(fy);
fymax = max(fy);
fxmin = min(fx);
fxmax = max(fx);

imshow(BW2);
hold on;
% �ִ밪���� ǥ��
plot(fymin-30,fxmin-30,'r*');
plot(fymax+30,fxmax+30,'b*');
%%%%%%%%%%%%%%%%%%%%%%%%%%%������ ���� ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��������ȭ�� �ִ������� �ּ� ������ image crop
part = imcrop(im,[fymin-30 fxmin-30 fymax-fymin+60 fxmax-fxmin+60]);
Iopenned2 = imcrop(Iopenned2,[fymin-30 fxmin-30 fymax-fymin+60 fxmax-fxmin+60]);
partgray = rgb2gray(part);

% �� ���� �ٽ� ����
red = part(:,:,1); % Red channel
green = part(:,:,2); % Green channel
blue = part(:,:,3); % Blue channel

%%%%%%%%%%%%%%%%%%%%%%%%%%%�ڸ� ���� ������׷� ��Ȱȭ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
decorrstreyched_part = decorrstretch(part,'tol',0.01);
dr = decorrstreyched_part(:,:,1);
dg = decorrstreyched_part(:,:,2);
db = decorrstreyched_part(:,:,3);
hold off

axes(handles.axes6)
imshow(Iopenned2);
assignin('base','Iopenned2',Iopenned2);
assignin('base','part',part);


function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

level1 = get(hObject,'Value');
assignin('base','level1',level1);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%% ������ H������ Ʈ���ٷ� ����ȭ �� ����
level1 = 0.8;
assignin('base','level1',level1);
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
level2 = get(hObject,'Value');
assignin('base','level2',level2);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%% ������ S������ Ʈ���ٷ� ����ȭ �� ����
level2 = 0.5;
assignin('base','level2',level2);
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
level3 = get(hObject,'Value');
assignin('base','level3',level3);

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%% ������ V������ Ʈ���ٷ� ����ȭ �� ����
level3 = 0.5;
assignin('base','level3',level3);
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end