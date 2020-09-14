unit dmAFIS;

interface

uses
  Windows, Messages, SysUtils, adodb, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwtable, DBClient, Provider;
 function getNextKey(fieldName : String) : String;
type
  TdmfAFIS = class(TDataModule)
    QryGetNextID: TADOQuery;
    dspGetNextID: TDataSetProvider;
    cdsGetNextID: TClientDataSet;
    QryNextID: TADOQuery;
    QryNextIDFieldName: TStringField;
    QryNextIDNextNumber: TIntegerField;
    qryFileLocation: TADOQuery;
    qryFileStatus: TADOQuery;
    qryFileLocationFileLocationID: TIntegerField;
    qryFileLocationFileLocation: TStringField;
    qryFileStatusFileStatusID: TIntegerField;
    qryFileStatusFileStatus: TStringField;
    QryLuNameType: TADOQuery;
    QryLuNameTypeNameType: TStringField;
    QryLuNameTypeNameTypeID: TIntegerField;
    QryLuEthnicity: TADOQuery;
    QryLuEthnicityEthnicity: TStringField;
    QryLuEthnicityEthnicityID: TIntegerField;
    QryluAddrType: TADOQuery;
    QryluAddrTypeAddressType: TStringField;
    QryluAddrTypeAddressTypeID: TIntegerField;
    QryLodgerRole: TADOQuery;
    QryLodgerRoleRole: TStringField;
    QryLodgerRoleRoleID: TIntegerField;
    QryRelationship: TADOQuery;
    QryRelationshipRelationshipID: TIntegerField;
    QryRelationshipRelationship: TStringField;
    qryOtherPersonRole: TADOQuery;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    QryLuReligion: TADOQuery;
    QryLuReligionReligionID: TIntegerField;
    QryLuReligionReligion: TStringField;
    QryMaritalStatus: TADOQuery;
    QryMaritalStatusMaritalStatusID: TIntegerField;
    QryMaritalStatusMaritalStatusDescription: TStringField;
    qryFPerson: TADOQuery;
    dspFPerson: TDataSetProvider;
    cdsFPerson: TClientDataSet;
    QryMPerson: TADOQuery;
    dspMPerson: TDataSetProvider;
    cdsMPerson: TClientDataSet;
    QryMName: TADOQuery;
    dspMName: TDataSetProvider;
    cdsMName: TClientDataSet;
    cdsMNameNameID: TIntegerField;
    cdsMNamePersonID: TIntegerField;
    cdsMNameSurname: TStringField;
    cdsMNameFirstName: TStringField;
    cdsMNameMiddleName: TStringField;
    cdsMNameNameTypeID: TIntegerField;
    cdsMNameIsActive: TStringField;
    qryFName: TADOQuery;
    dspFName: TDataSetProvider;
    cdsFName: TClientDataSet;
    cdsFNameNameID: TIntegerField;
    cdsFNamePersonID: TIntegerField;
    cdsFNameTitle: TStringField;
    cdsFNameSurname: TStringField;
    cdsFNameFirstName: TStringField;
    cdsFNameMiddleName: TStringField;
    cdsFNameNameTypeID: TIntegerField;
    cdsFNameDataEntryDate: TDateTimeField;
    cdsFNameIsActive: TStringField;
    cdsFPersonPersonID: TIntegerField;
    cdsFPersonGender: TStringField;
    cdsFPersonDOB: TDateTimeField;
    cdsFPersonReligionID: TIntegerField;
    cdsFPersonHomePhone: TStringField;
    cdsFPersonWorkPhone: TStringField;
    cdsFPersonMobilePhone: TStringField;
    cdsFPersonEmail: TStringField;
    cdsFPersonMailFlag: TStringField;
    cdsFPersonX: TStringField;
    dspPerson: TDataSetProvider;
    cdsPerson: TClientDataSet;
    qryPerson: TADOQuery;
    cdsPersonPersonID: TIntegerField;
    cdsPersonGender: TStringField;
    cdsPersonDOB: TDateTimeField;
    cdsPersonHomePhone: TStringField;
    cdsPersonWorkPhone: TStringField;
    cdsPersonMobilePhone: TStringField;
    cdsPersonEmail: TStringField;
    cdsPersonIsActive: TStringField;
    qryName: TADOQuery;
    dspName: TDataSetProvider;
    cdsName: TClientDataSet;
    cdsNameNameID: TIntegerField;
    cdsNamePersonID: TIntegerField;
    cdsNameSurname: TStringField;
    cdsNameFirstName: TStringField;
    cdsNameNameTypeID: TIntegerField;
    cdsNameIsActive: TStringField;
    qry: TADOQuery;
    cdsABC: TClientDataSet;
    cdsABCABCID: TIntegerField;
    cdsABCFPersonID: TIntegerField;
    cdsABCMPersonID: TIntegerField;
    cdsABCMaritalStatusID: TIntegerField;
    cdsABCAddressID: TIntegerField;
    cdsABCDateLastChildPlaced: TDateTimeField;
    cdsABCDateApplication: TDateTimeField;
    cdsABCDateApprovalRenewed: TDateTimeField;
    cdsABCChildNo: TStringField;
    cdsABCOtherChildren: TStringField;
    cdsABCComments: TStringField;
    cdsABCIsActive: TStringField;
    cdsABCStage1: TStringField;
    cdsABCStage2: TStringField;
    cdsABCStage3: TStringField;
    cdsABCDateEOI: TDateTimeField;
    cdsABCDateAssRequested: TDateTimeField;
    cdsABCAssessingWorker: TStringField;
    cdsABCWorkshopAttended: TDateTimeField;
    cdsABCDateInfoSession: TDateTimeField;
    cdsABCDateApproval: TDateTimeField;
    cdsABCDateReApproval: TDateTimeField;
    cdsABCDateValidUntil: TDateTimeField;
    cdsABCDateAllocated: TDateTimeField;
    cdsABCDateChildPlaced: TDateTimeField;
    cdsABCDateAOG: TDateTimeField;
    dspABC: TDataSetProvider;
    QryABC: TADOQuery;
    QryAddress: TADOQuery;
    dspAddress: TDataSetProvider;
    cdsAddress: TClientDataSet;
    cdsAddressAddressID: TIntegerField;
    cdsAddressStreet: TStringField;
    cdsAddressSuburb: TStringField;
    cdsAddressState: TStringField;
    cdsAddressPostcode: TStringField;
    cdsAddressCountry: TStringField;
    cdsAddressDataEntryDate: TDateTimeField;
    cdsAddressIsActive: TStringField;
    cdsAddressPostalStreet: TStringField;
    cdsAddressPostalSuburb: TStringField;
    cdsAddressPostalState: TStringField;
    cdsAddressPostalPostcode: TStringField;
    cdsAddressCareOf: TStringField;
    cdsABCMeetBirthMother: TStringField;
    cdsABCBirthMotherFULLId: TStringField;
    cdsABCAdoptParentFULLIdByBM: TStringField;
    cdsABCBirthMotherMembers: TStringField;
    cdsABCBMLastContact: TDateTimeField;
    cdsABCMeetBirthFather: TStringField;
    cdsABCBirthFatherFULLId: TStringField;
    cdsABCAdoptParentFULLIdByBF: TStringField;
    cdsABCBirthFatherMembers: TStringField;
    cdsABCBFLastContact: TDateTimeField;
    cdsABCPostAdoptionAgreement: TMemoField;
    qryABCPerson: TADOQuery;
    dspABCPerson: TDataSetProvider;
    cdsABCPerson: TClientDataSet;
    cdsABCPersonABCPersonID: TIntegerField;
    cdsABCPersonABCId: TIntegerField;
    cdsABCPersonIsActive: TStringField;
    cdsGetNextIDFieldName: TStringField;
    cdsGetNextIDNextKeyId: TIntegerField;
    cdsPersonX: TStringField;
    cdsABCPersonConsents: TStringField;
    cdsABCPersonDateSigned: TDateTimeField;
    cdsNameDataEntryDate: TDateTimeField;
    cdsABCPersonRoleId: TIntegerField;
    QryChild: TADOQuery;
    dspChild: TDataSetProvider;
    cdsChild: TClientDataSet;
    cdsChildPersonID: TIntegerField;
    cdsChildGender: TStringField;
    cdsChildDOB: TDateTimeField;
    cdsChildIsActive: TStringField;
    cdsChildX: TStringField;
    cdsChildName: TClientDataSet;
    cdsChildNameNameID: TIntegerField;
    cdsChildNamePersonID: TIntegerField;
    cdsChildNameSurname: TStringField;
    cdsChildNameFirstName: TStringField;
    cdsChildNameMiddleName: TStringField;
    cdsChildNameNameTypeID: TIntegerField;
    cdsChildNameDataEntryDate: TDateTimeField;
    cdsChildNameIsActive: TStringField;
    dspChildName: TDataSetProvider;
    QryChildName: TADOQuery;
    QryABCChild: TADOQuery;
    dspABCChild: TDataSetProvider;
    cdsABCChild: TClientDataSet;
    cdsABCChildABCChildID: TIntegerField;
    cdsABCChildABCID: TIntegerField;
    cdsABCChildChildID: TIntegerField;
    cdsABCChildIsActive: TStringField;
    QryICAChild: TADOQuery;
    dspICAChild: TDataSetProvider;
    cdsICAChild: TClientDataSet;
    cdsICAChildICAChildID: TIntegerField;
    cdsICAChildICAID: TIntegerField;
    cdsICAChildChildID: TIntegerField;
    cdsICAChildIsActive: TStringField;
    cdsABCPersonStatus: TStringField;
    cdsABCPersonMaritalStatusId: TIntegerField;
    cdsABCPersonBParentRelationshipId: TIntegerField;
    cdsABCPersonOtherChildren: TStringField;
    cdsABCPersonNameId: TIntegerField;
    QryICA: TADOQuery;
    dspICA: TDataSetProvider;
    cdsICA: TClientDataSet;
    cdsICAICAID: TIntegerField;
    cdsICAMPersonID: TIntegerField;
    cdsICAFPersonID: TIntegerField;
    cdsICAAddressID: TIntegerField;
    cdsICAFileNo: TStringField;
    cdsICAChildNo: TStringField;
    cdsICAOtherChildren: TStringField;
    cdsICADateLastChildPlaced: TDateTimeField;
    cdsICADateExpOfInt: TDateTimeField;
    cdsICADateApplication: TDateTimeField;
    cdsICADateAssReq: TDateTimeField;
    cdsICADateApproval: TDateTimeField;
    cdsICADateValidUntil: TDateTimeField;
    cdsICADateApprovalRenewed: TDateTimeField;
    cdsICADateFileOverseas: TDateTimeField;
    cdsICADateAllocated: TDateTimeField;
    cdsICADatePlaced: TDateTimeField;
    cdsICADateOfArrival: TDateTimeField;
    cdsICADateClosed: TDateTimeField;
    cdsICAMaritalStatusID: TIntegerField;
    cdsICACountry: TStringField;
    cdsICAIsActive: TStringField;
    cdsICAKoreanCitizenshipCertificate: TStringField;
    cdsICACertOfConformity: TStringField;
    cdsICAStage1: TStringField;
    cdsICAStage2: TStringField;
    cdsICAStage3: TStringField;
    cdsICAStage4: TStringField;
    cdsICAStage5: TStringField;
    cdsICAInfoSession: TDateTimeField;
    cdsICAEducationForums: TDateTimeField;
    cdsICAWorker: TStringField;
    cdsICAAssessingWorker: TStringField;
    cdsICAAOG: TDateTimeField;
    cdsICADocoReceived: TDateTimeField;
    cdsICAProgressReport1: TIntegerField;
    cdsICAProgressReport2: TIntegerField;
    cdsICAProgressReport3: TIntegerField;
    cdsICAProgressReport4: TIntegerField;
    cdsICAFeePaidDate: TDateTimeField;
    cdsICAComment: TStringField;
    cdsICAAssessDate: TDateTimeField;
    cdsICADueDate1: TDateTimeField;
    cdsICAReceivedDate1: TDateTimeField;
    cdsICADateSentOverseas1: TDateTimeField;
    cdsICADueDate2: TDateTimeField;
    cdsICAReceivedDate2: TDateTimeField;
    cdsICADueDate3: TDateTimeField;
    cdsICAReceivedDate3: TDateTimeField;
    cdsICADateSentOverseas3: TDateTimeField;
    cdsICADueDate4: TDateTimeField;
    cdsICAReceivedDate4: TDateTimeField;
    cdsICADateSentOverseas4: TDateTimeField;
    cdsICADateAllocatedToWorker: TDateTimeField;
    cdsICADateSentOverseas2: TDateTimeField;
    cdsMNameTitle: TStringField;
    cdsABCPersonAddressId: TIntegerField;
    cdsAddressAddressLine2: TStringField;
    cdsNameMiddleName: TStringField;
    qryAbout: TADOQuery;
    qryAboutOwnerEmailAddress: TStringField;
    cdsABCDateClosed: TDateTimeField;
    cdsABCStepParent: TStringField;
    cdsABCPartChild: TStringField;
    cdsICADateCasePlanCompleted: TDateTimeField;
    cdsICAChildDetails: TStringField;
    cdsFPersonChildScreeningDate: TDateTimeField;
    cdsFPersonChildScreeningExpiry: TDateTimeField;
    cdsMNameDataEntryDate: TDateTimeField;
    cdsFPersonPlaceOfBirth: TStringField;
    cdsFPersonIsActive: TStringField;
    cdsMPersonPersonID: TIntegerField;
    cdsMPersonGender: TStringField;
    cdsMPersonDOB: TDateTimeField;
    cdsMPersonEthnicityId: TIntegerField;
    cdsMPersonPlaceOfBirth: TStringField;
    cdsMPersonBirthCountry: TStringField;
    cdsMPersonReligionId: TIntegerField;
    cdsMPersonHomePhone: TStringField;
    cdsMPersonWorkPhone: TStringField;
    cdsMPersonMobilePhone: TStringField;
    cdsMPersonEmail: TStringField;
    cdsMPersonProofOfID: TStringField;
    cdsMPersonComments: TMemoField;
    cdsMPersonChildScreeningDate: TDateTimeField;
    cdsMPersonChildScreeningExpiry: TDateTimeField;
    cdsMPersonMailFlag: TStringField;
    cdsMPersonIsActive: TStringField;
    cdsMPersonX: TStringField;
    cdsICAProgressReport5: TIntegerField;
    cdsICADueDate5: TDateTimeField;
    cdsICAReceivedDate5: TDateTimeField;
    cdsICADateSentOverseas5: TDateTimeField;
    cdsICAProgressReport6: TIntegerField;
    cdsICADueDate6: TDateTimeField;
    cdsICAReceivedDate6: TDateTimeField;
    cdsICADateSentOverseas6: TDateTimeField;
    cdsICAPartChild: TStringField;
    cdsABCApprovedForConsideration: TStringField;
    cdsABCRemarks: TStringField;
    procedure cdsICANewRecord(DataSet: TDataSet);
    
   private
    { Private declarations }
  public
    { Public declarations }


    procedure OpenQueries(const Qry: Array of TADOQuery); overload;
    procedure OpenQueries(const Qry: TADOQuery;
                          const Param: Array of String); overload;


  end;

var
  dmfAFIS: TdmfAFIS;
  QryNextIDTable: TAdoQuery;
  FTableName,
  FFieldName,
  FFieldValue: String;
  FInitNextID: Boolean;

implementation

uses fUtils;

{$R *.DFM}
{-----------------------------------------------------------------------------}
procedure TdmfAFIS.OpenQueries(const Qry: Array of TADOQuery);
var
  i: Integer;
begin
  for i := 0 to High(Qry) do
  begin
    if Qry[i].Active then Qry[i].CLOSE;
      Qry[i].OPEN;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TdmfAFIS.cdsICANewRecord(DataSet: TDataSet);
begin
  cdsICAStage1.asString := 'N';
  cdsICAStage2.asString := 'N';
  cdsICAStage3.asString := 'N';
  cdsICAStage4.asString := 'N';
  cdsICAStage5.asString := 'N';

  {N.Vo    START    30/06/2017}
  cdsICAPartChild.asString := 'N';
  {N.Vo    END    30/06/2017}
  cdsICAKoreanCitizenshipCertificate.asString := 'N';
  cdsICACertOfConformity.asString := 'N';
  cdsICAProgressReport1.asInteger := 0;
  cdsICAProgressReport2.asInteger := 0;
  cdsICAProgressReport3.asInteger := 0;
  cdsICAProgressReport4.asInteger := 0;
  cdsICAProgressReport5.asInteger := 0;
  cdsICAProgressReport6.asInteger := 0;
end;
{-----------------------------------------------------------------------------}
procedure TdmfAFIS.OpenQueries(const Qry: TADOQuery;
                               const Param: Array of String);
var
  i: Integer;
begin
  for i := 0 to High(Param) do Qry.Parameters[i].Value := Param[i];
  OpenQueries(Qry);
end;
{-----------------------------------------------------------------------------}
function getNextKey(fieldName : String) : String;
begin
{ get the next key }
  Result := '';
  Result := futils.getNextPrimaryKey(dmfAFIS.qry, fieldName);
end;
{-----------------------------------------------------------------------------}

end.
