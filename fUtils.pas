unit fUtils;

interface
uses
  Windows, Messages, SysUtils, adodb, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DBCtrls, Clipbrd,  DBClient,wwdbEdit,menus,inifiles,Wwquery,
  Quickrpt,qrprntr;


{-----------------------------------------------------------------------}

  type TFrmClass = class of TForm;


  procedure MsgAbort(const Msg: String);

  procedure ShowDialog(ClassOfFrm: TFrmClass);

  procedure qryExec(qry : TADOQuery; sqlText   : String);
  procedure qryUpdate(qry : TADOQuery; tableName, field, value, condField, condValue : String);

  procedure RefreshQueries(const Qrys : Array of TAdoQuery); overload;
  procedure RefreshQueries(const Qry : TAdoQuery); overload;

  procedure cdsInsertRecord(const cds : Array of TClientDataSet); overload;
  procedure cdsInsertRecord(const cds : TClientDataSet); overload;

  procedure SetFieldValue(const cbox: array of TdbCheckBox);  overload;
  procedure SetFieldValue(const cbox: TdbCheckBox);  overload;

  procedure ClearFld(const Fld: array of TwwDBEdit);  overload;
  procedure ClearFld(const Fld: TwwDBEdit);  overload;

  procedure QuerySpecifiedIDParam(cds: TClientDataSet;qry:TAdoQuery; ParamValue: String;
                                  const Fld:TField); overload;
  procedure QuerySpecifiedIDParam(cd: array of TClientDataSet;Qrys: array of TAdoQuery;
                                  ParamValue: String;const Fld:TField);overload;

  procedure queryParamID(qry:TAdoQuery;ParamValue:String; const Fld:TField);

  procedure RefreshQueriesAndResync(const Qrys: array of TAdoQuery);

  procedure ControlsShow(const Ctrls: array of TControl);
  procedure ControlsHide(const Ctrls: array of TControl);
  procedure ControlsSH(const CtrlsShow, CtrlsHide: array of TControl);

  procedure ControlsEnable(const Ctrls: array of TControl);
  procedure ControlsDisable(const Ctrls: array of TControl);
  procedure ControlsEnableDisable(const CtrlsEnable, CtrlsDisable: array of TControl);

  procedure AssignDataSource(const Qry: array of TAdoQuery; ds:TDataSource);

  procedure EnabledMenu(list : Array of TMenuItem);
  procedure DisabledMenu(list : Array of TMenuItem);
  procedure MenuEnableDisable(const MenuEnable, MenuDisable: array of TMenuItem);
  procedure ValueChecked(cbox : Array of TDBCheckBox);
{############################ Message Dialogs ###########################}
  function msgDlg(msg:String;msgType:TMsgDlgType;buttons:TMsgDlgButtons):Word;
  function msgInfo(msg : String) : Word;
  function msgError(msg : Exception) : Word; overload;
  function msgError(msg : String) : Word; overload;
  function msgWarning(msg: String) : Word;
{############################ Ini Files #################################}
  function StripFileExtension(const FileName: string): String;
  function GetParams(const fileName, IniSection, IniItem: String): String; overload;
  function GetParams(inifile: TIniFile; IniSection, IniItem: String): String; overload;
  function GetAppIniFileName(): String;
  function GetAppProperty(IniSection,IniItem: String): String;

  {#############################################################}
  function getNextPrimaryKey(qry: TADOQuery; fieldName : String) : String;


  function  qryOpen   (qry : TADOQuery; sqlText   : String) : boolean; overload;
  procedure OpenQuery(const qry : Array of TADOQuery); overload;
  procedure qrySetUp(qry : TADOQuery; sqlText : String);

  function  qrySelectStr(qry : TADOQuery; tableName, fieldName, fieldValue : String):boolean;   overload;
  function  qrySelectStr(qry : TADOQuery; tableName, fieldName, fieldValue, fieldOrder : String; asc : boolean):boolean; overload;

  procedure updateField(ds : TDataSource; FieldName, newValue: String); overload;
  procedure updateField(ds : TDataSet; FieldName, newValue: String); overload;

  function  getField(ds : TDataSet; FieldNAme :  String) : TField; overload;
  function  getField(ds : TDatasource; FieldNAme :  String) : TField; overload;
  function  getFieldStr(ds : TDatasource; FieldName :  String) : String;overload;
  function  getFieldStr(ds : TDataSet; FieldName :  String) : String;overload;

  procedure cancelDataChanges(ds : Array of TDataSource); overload;
  procedure cancelDataChanges(datasource : TDataSource);  overload;

  function  postData(ds : Array of TDataSource; isDelete : boolean) : boolean; overload;
  function  postDataCDS(ds : Array of TDataSet; isDelete : boolean) : boolean; overload;
  function  postData(ds : TDataSet; isDelete : boolean) : boolean;   overload;

  procedure applyDataUpdates(datasource : TDataSource);  overload;
  procedure applyDataUpdates(ds : TDataSet); overload;
  {########################## miscelaneous utils #############################}
  procedure setControlColor(list : Array of TControl; newColor : TColor);

implementation

uses AFISConstants,fCustomPreview;
{-----------------------------------------------------------------------}
procedure MsgAbort(const Msg: String);
begin
  raise exception.create(Msg);
end;
{-----------------------------------------------------------------------}
function msgDlg(msg:String;msgType:TMsgDlgType;buttons:TMsgDlgButtons):Word;
{ super helper which allow easy substition of MessageDlg with something else   }
begin
    Result := MessageDlg(msg, msgType, buttons, 0);
end;
{-----------------------------------------------------------------------}
function msgError(msg : String) : Word;
begin
{ error message dialog with ok option }
    Result := msgDlg(msg, mtError, [mbOk]);
end;
{-----------------------------------------------------------------------}
function msgError(msg : Exception) : Word;
begin
{ error message dialog with ok option, take Exception as a parameter}
    Result := msgDlg(msg.Message, mtError, [mbOk]);
end;
{-----------------------------------------------------------------------}
function msgInfo(msg : String) : Word;
begin
{ info message dialog with ok button}
    Result := msgDlg(msg, mtInformation, [mbOk]);
end;
{-----------------------------------------------------------------------}
function msgWarning(msg : String) : Word;
begin
{ info message dialog with ok button}
    Result := msgDlg(msg, mtWarning, [mbOk]);
end;
{-----------------------------------------------------------------------}
function GetParams(const fileName,IniSection,IniItem: String): String;
var iniFile: TIniFile;
begin
  Result := '';
  iniFile := TIniFile.Create(fileName);
  try
     Result := GetParams(iniFile,IniSection,IniItem);
  finally
     if (iniFile) <> nil then iniFile.Free;
  end;
end;
{-----------------------------------------------------------------------}
function GetParams(iniFile: TIniFile; IniSection,IniItem: String): String;
begin
  Result := '';
  try
     Result := iniFile.ReadString(IniSection,IniItem,'');
  except on E: Exception do msgError(E);
  end;
end;
{-----------------------------------------------------------------------}
function GetAppIniFileName() : String;
begin
{ return the applications ini file name }
    Result := '';
    Result := StripFileExtension(Application.ExeName) + '.ini';
end;
{-----------------------------------------------------------------------}
function StripFileExtension(const FileName: String): String;
begin
{ strips the file extension of a given file name }
    Result := '';
    if Pos('.', FileName) = 0 then Result := FileName
        else Result := copy(FileName, 1,Pos('.', FileName) - 1);
end;
{-----------------------------------------------------------------------}
function GetAppProperty(IniSection,IniItem: String): String;
begin
  Result := '';
  Result := GetParams(GetAppIniFileName(),iniSection,IniItem);
end;
{-----------------------------------------------------------------------}
 function getNextPrimaryKey(qry: TADOQuery; fieldName : String) : String;
{ returns the next key }
var
  NextNumber : Integer;
begin
  Result := '';
  if (qrySelectStr(qry, 'NextKey', 'FieldName', fieldName)) then
    raise Exception.Create('NextKey Failure');

  NextNumber := qry.FieldByName('NextNumber').AsInteger;
  Result := IntToStr(NextNumber);
  qryExec(qry, 'UPDATE NextKey SET NextNumber = ' +IntToStr(NextNumber+1)+
               ' WHERE FieldName = ' + quotedStr(fieldName));
end;
{-----------------------------------------------------------------------}
function getField(ds : TDataSet; FieldNAme :  String) : TField;
begin
{ get a field value from a dataset }
  Result := nil;
  Result := ds.FieldByName(FieldName);
end;
{-----------------------------------------------------------------------}
function qrySelectStr(qry:TADOQuery;tableName,fieldName,fieldValue:String)
{ select based on a string value } :boolean; overload;
begin
  Result := qrySelectStr(qry,tableName, fieldName, fieldValue, fieldName, true);
end;
{-----------------------------------------------------------------------}
function qrySelectStr(qry:TADOQuery;tableName,fieldName,fieldValue,fieldOrder :
{ select based on a string giving an order }String; asc : boolean):boolean;
var order : String;
begin
  if (asc) then order := 'ASC' else order := 'DESC';
  Result := qryOpen(qry,'SELECT * FROM '+tableName+
                        ' WHERE '+fieldName+'='+quotedStr(fieldValue) +
                        ' ORDER BY '+fieldOrder+ ' ' + order);
end;
{-----------------------------------------------------------------------}
function getField(ds : TDatasource; FieldNAme :  String) : TField; begin
{ get the field from the dataset }
    Result := nil;
    Result := getField(ds.DataSet, fieldName);
end;
{-----------------------------------------------------------------------}
function getFieldStr(ds : TDatasource; FieldName :  String) : String; begin
{get the field str value from the dataset }
    Result := getFieldStr(ds.DataSet, fieldName);
end;
{-----------------------------------------------------------------------}
function getFieldStr(ds : TDataSet; FieldName :  String) : String; begin
{get the field str value from the dataset }
   Result := '';
   Result := getField(ds, fieldName).asString;
end;
{-----------------------------------------------------------------------}
procedure updateField(ds : TDataSource; FieldName, newValue: String);
begin
{ update field value }
  if (newValue = BLANK) then newValue := NULL_ID;
  getField(ds, fieldName).Value := newValue;
end;
{-----------------------------------------------------------------------}
procedure updateField(ds : TDataSet; FieldName, newValue: String);
begin
{ update field value }
  getField(ds, fieldName).Value := newValue;
end;
{-----------------------------------------------------------------------}
function postData(ds : Array of TDataSource; isDelete : boolean) : boolean;
{ post for an array of datasources, returns true if posted }var i:Integer;begin
  Result := false;
  try
    for i:=0 to Length(ds)-1 do
      if (postData(ds[i].DataSet, isDelete)) then Result := true;
  except on e: exception do
    msgError(e);
  end;
end;
{-----------------------------------------------------------------------}
function postDataCDS(ds : Array of TDataSet; isDelete : boolean) : boolean;
{ post an array datasources, returns true if data posted }var i:Integer;begin
  Result := false;
  for i:=0 to Length(ds)-1 do
    if (postData(ds[i], isDelete)) then Result := true;
end;
{-----------------------------------------------------------------------}
function postData(ds : TDataSet; isDelete : boolean) : boolean; begin
{ post a single datasource, calls applyupdates for cds }
  Result := false;
  try
    if (ds.State in [dsEdit, dsInsert ]) or (isDelete) then
    begin
        if not isDelete then ds.Post;
        Result := true;
        applyDataUpdates(ds);
    end;
  except on e: exception do msgError(e); end;
end;
{-----------------------------------------------------------------------}
procedure applyDataUpdates(datasource : TDataSource); begin
{ apply updates to a client data set }
    try
      if (datasource.DataSet is TClientDataSet) then
        (datasource.DataSet as TClientDataSet).ApplyUpdates(0)
    except on E : Exception do
        msgError(e);
    end;
end;
{-----------------------------------------------------------------------}
procedure applyDataUpdates(ds : TDataSet); overload; begin
{ apply updates to a client data set }
    try
      if (ds is TClientDataSet) then
        (ds as TClientDataSet).ApplyUpdates(0)
    except on E : Exception do
        msgError(e);
    end;
end;
{-----------------------------------------------------------------------}
procedure cancelDataChanges(ds : Array of TDataSource);
{ cancel datachanges for an array of datasources }
var i : Integer;
begin
  for i:=0 to Length(ds)-1 do cancelDataChanges(ds[i]);
end;
{-----------------------------------------------------------------------}
procedure cancelDataChanges(datasource : TDataSource);
begin
{ cancel data changes for a dataset }
  if (DataSource <> nil) and (DataSource.State <> dsInactive) then
     DataSource.DataSet.Cancel;
end;
{-----------------------------------------------------------------------}
procedure qrySetUp(qry : TADOQuery; sqlText : String); begin
{ setup a qry for executing / opening }
  with qry do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlText);
  end;
end;
{-----------------------------------------------------------------------}
procedure qryExec(qry : TADOQuery; sqlText : String); begin
{ execute a qry }
  qrySetUp(qry, sqlText);
  qry.ExecSQL;
end;
{-----------------------------------------------------------------------}
procedure qryUpdate(qry:TADOQuery;tableName,field,value,condField,condValue:String);
{ update the database using this qry, with field, value,cond }
begin
  qryExec(qry,'UPDATE '+tableName+' SET '+field+' = '+value+
              ' WHERE '+condField+' = '+condValue);
end;
{-----------------------------------------------------------------------}
procedure ShowDialog(ClassOfFrm: TFrmClass);
begin
  { COMMON PROCEDURE TO OPEN DIALOG FORMS }
  with ClassOfFrm.Create(Application) do
  try
    ShowModal;
  finally
    Release;
  end;
end;
{-----------------------------------------------------------------------}
procedure OpenQuery(const Qry: Array of TADOQuery);
var
  i : integer;
begin
  for i:= 0 to High(Qry) do begin
    if Qry[i].Active then Qry[i].Close;
    Qry[i].Open;
  end;
end;
{-----------------------------------------------------------------------}
function qryOpen(qry : TADOQuery; sqlText : String) : boolean;
begin
{ open a qry }

  qrySetUp(qry, sqlText);
  qry.Open;
  Result := qry.Eof;
end;
{-----------------------------------------------------------------------}
procedure RefreshQueriesAndResync(const Qrys: array of TAdoQuery);
var
  Bmk: TBookMark;
begin
  Bmk := Qrys[0].GetBookmark;
  try
    RefreshQueries(Qrys);
    try
      Qrys[0].GotoBookmark(Bmk);
    except
    end;
  finally
    Qrys[0].FreeBookmark(Bmk);
  end;
end;
{-----------------------------------------------------------------------}
procedure QuerySpecifiedIDParam(cds: TClientDataSet;Qry:TAdoQuery; ParamValue: String; const Fld:TField); overload;
var i: Integer;
begin
  with cds do begin
     CLOSE;
     qry.Parameters.ParamByName(ParamValue).Value := Fld.AsInteger;
     OPEN;
  end;
end;

{-----------------------------------------------------------------------}
procedure QuerySpecifiedIDParam(cd: array of TClientDataSet; Qrys: array of TAdoQuery;
                                ParamValue: String;const Fld:TField);overload;
var i: Integer;
begin
  for i:= 0 to High(Qrys) do
    QuerySpecifiedIDParam(cd[i],Qrys[i],ParamValue,fld);
end;
{-----------------------------------------------------------------------}
procedure queryParamID(qry:TAdoQuery;ParamValue:String; const Fld:TField);
begin
  with qry do
    begin
      CLOSE;
      Parameters.ParamByName(ParamValue).Value := Fld.asInteger;
      OPEN;
    end;
end;
{-----------------------------------------------------------------------}
procedure RefreshQueries(const Qrys: array of TAdoQuery);
{refresh an array of querys}
var
  i : integer;
begin
  for i := 0 to High(qrys) do RefreshQueries(qrys[i]);
end;
{-----------------------------------------------------------------------}
procedure RefreshQueries(const Qry: TAdoQuery);
{refresh a single query}
begin
  with Qry do
  begin
    CLOSE;
    OPEN;
  end;
end;
{-----------------------------------------------------------------------}
procedure SetFieldValue(const cbox: array of TdbCheckBox);
{refresh an array of querys}
var
  i : integer;
begin
  for i := 0 to High(cbox) do SetFieldValue(cbox[i]);
end;
{-----------------------------------------------------------------------}
procedure SetFieldValue(const cbox: TdbCheckBox);
begin
  with cbox do begin
    cbox.Checked := False;
  end;
end;
{-----------------------------------------------------------------------}
procedure ClearFld(const Fld: TwwDBEdit);
begin
  Fld.Clear;
end;
{-----------------------------------------------------------------------}
procedure ClearFld(const Fld: array of TwwDBEdit);
var
  i: Integer;
begin
  for i := 0 to High(Fld) do ClearFld(Fld[i]);
end;
{-----------------------------------------------------------------------}
procedure AssignDataSource(const Qry: array of TAdoQuery; ds:TDataSource);
var i : Integer;
begin
  for i:= 0 to High(Qry) do begin
    Qry[i].DataSource := ds;
  end;
end;
{-----------------------------------------------------------------------}
procedure cdsInsertRecord(const cds: array of TClientDataSet);
{refresh an array of querys}
var
  i : integer;
begin
  for i := 0 to High(cds) do cdsInsertRecord(cds[i]);
end;
{-----------------------------------------------------------------------}
procedure cdsInsertRecord(const cds: TClientDataSet);
{refresh a single query}
begin
  with cds do
  begin
    OPEN;
    INSERT;
  end;
end;
{-----------------------------------------------------------------------}

procedure ControlsShow(const Ctrls: array of TControl);
var
  i: Integer;
begin
  for i := 0 to High(Ctrls) do Ctrls[i].Visible := True;
end;
{-----------------------------------------------------------------------}
procedure ControlsHide(const Ctrls: array of TControl);
var
  i: Integer;
begin
  for i := 0 to High(Ctrls) do Ctrls[i].Visible := False;
end;
{-----------------------------------------------------------------------}
procedure ControlsSH(const CtrlsShow, CtrlsHide: array of TControl);
begin
  ControlsShow(CtrlsShow);
  ControlsHide(CtrlsHide);
end;
{-----------------------------------------------------------------------}
procedure ControlsEnable(const Ctrls: array of TControl);
var
  i: Integer;
begin
  for i := 0 to High(Ctrls) do Ctrls[i].Enabled := True;
end;
{-----------------------------------------------------------------------}
procedure ControlsDisable(const Ctrls: array of TControl);
var
  i: Integer;
begin
  for i := 0 to High(Ctrls) do Ctrls[i].Enabled := False;
end;
{-----------------------------------------------------------------------}
procedure ControlsEnableDisable(const CtrlsEnable, CtrlsDisable: array of TControl);
begin
  ControlsEnable(CtrlsEnable);
  ControlsDisable(CtrlsDisable);
end;
{-----------------------------------------------------------------------}
procedure EnabledMenu(list : Array of TMenuItem);
{ enable or diable an array of controls }
var i: integer;
begin
  for i :=0 to Length(list)-1 do list[i].Enabled := true;
end;
{-----------------------------------------------------------------------}
procedure DisabledMenu(list : Array of TMenuItem);
var i: integer;
begin
{ disable a set of controls }
  for i :=0 to Length(list)-1 do list[i].Enabled := false;
end;
{-----------------------------------------------------------------------}
procedure MenuEnableDisable(const MenuEnable, MenuDisable: array of TMenuItem); begin
{ enable a set of controls }
    EnabledMenu(MenuEnable);
    DisabledMenu(MenuDisable);
end;
{-----------------------------------------------------------------------}
procedure ValueChecked(cbox : Array of TDBCheckBox);
{ enable or diable an array of controls }
var i: integer;
begin
  for i :=0 to Length(cbox)-1 do cbox[i].checked := false;
end;
{-----------------------------------------------------------------------}
procedure setControlColor(list : Array of TControl; newColor : TColor);
{ set a list of controls to a color
  note: may thorw an exception if control doesnt have a color property         }
var i: integer;
begin
    for i :=0 to Length(list)-1 do TDBEDit(list[i]).Color  := newColor;
end;
{-----------------------------------------------------------------------}
end.
