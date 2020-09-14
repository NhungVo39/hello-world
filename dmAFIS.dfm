object dmfAFIS: TdmfAFIS
  OldCreateOrder = False
  Height = 668
  Width = 728
  object QryGetNextID: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM NextKey'
      ''
      '')
    Left = 28
    Top = 12
  end
  object dspGetNextID: TDataSetProvider
    DataSet = QryGetNextID
    Left = 104
    Top = 12
  end
  object cdsGetNextID: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGetNextID'
    Left = 180
    Top = 12
    object cdsGetNextIDFieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object cdsGetNextIDNextKeyId: TIntegerField
      FieldName = 'NextKeyId'
    end
  end
  object QryNextID: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'vFieldName'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM NextID'
      'WHERE FieldName = :vFieldName')
    Left = 16
    Top = 76
    object QryNextIDFieldName: TStringField
      FieldName = 'FieldName'
      Origin = 'APPAFIS."dbo.NextID".FieldName'
      Size = 50
    end
    object QryNextIDNextNumber: TIntegerField
      FieldName = 'NextNumber'
      Origin = 'APPAFIS."dbo.NextID".NextNumber'
    end
  end
  object qryFileLocation: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM FileLocation')
    Left = 86
    Top = 74
    object qryFileLocationFileLocation: TStringField
      DisplayWidth = 25
      FieldName = 'FileLocation'
      Origin = 'APPAFIS."dbo.FileLocation".FileLocation'
      Size = 25
    end
    object qryFileLocationFileLocationID: TIntegerField
      DisplayWidth = 10
      FieldName = 'FileLocationID'
      Origin = 'APPAFIS."dbo.FileLocation".FileLocationID'
      Visible = False
    end
  end
  object qryFileStatus: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM FileStatus')
    Left = 167
    Top = 74
    object qryFileStatusFileStatus: TStringField
      DisplayWidth = 25
      FieldName = 'FileStatus'
      Origin = 'APPAFIS."dbo.FileStatus".FileStatus'
      Size = 25
    end
    object qryFileStatusFileStatusID: TIntegerField
      DisplayWidth = 10
      FieldName = 'FileStatusID'
      Origin = 'APPAFIS."dbo.FileStatus".FileStatusID'
      Visible = False
    end
  end
  object QryLuNameType: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM NameType'
      'WHERE (NameTypeID <> 7) or '
      '             (NameTypeID <> 8)'
      '')
    Left = 88
    Top = 132
    object QryLuNameTypeNameType: TStringField
      DisplayWidth = 35
      FieldName = 'NameType'
      Origin = 'APPAFIS."dbo.NameType".NameType'
      Size = 50
    end
    object QryLuNameTypeNameTypeID: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'NameTypeID'
      Origin = 'APPAFIS."dbo.NameType".NameTypeID'
      Visible = False
    end
  end
  object QryLuEthnicity: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Ethnicity'
      'WHERE IsActive = '#39'Y'#39)
    Left = 300
    Top = 76
    object QryLuEthnicityEthnicity: TStringField
      DisplayWidth = 35
      FieldName = 'Ethnicity'
      Origin = 'APPAFIS."dbo.Ethnicity".Ethnicity'
      Size = 50
    end
    object QryLuEthnicityEthnicityID: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'EthnicityID'
      Origin = 'APPAFIS."dbo.Ethnicity".EthnicityID'
      Visible = False
    end
  end
  object QryluAddrType: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM AddressType'
      'WHERE (IsActive = '#39'Y'#39')')
    Left = 24
    Top = 132
    object QryluAddrTypeAddressType: TStringField
      DisplayWidth = 35
      FieldName = 'AddressType'
      Origin = 'APPAFIS."dbo.AddressType".AddressType'
      Size = 50
    end
    object QryluAddrTypeAddressTypeID: TIntegerField
      DisplayWidth = 10
      FieldName = 'AddressTypeID'
      Origin = 'APPAFIS."dbo.AddressType".AddressTypeID'
      Visible = False
    end
  end
  object QryLodgerRole: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Role'
      'WHERE (IsActive = '#39'Y'#39') AND'
      '(Role <> '#39'Contact Person'#39')'
      'ORDER BY Role')
    Left = 28
    Top = 192
    object QryLodgerRoleRole: TStringField
      DisplayWidth = 35
      FieldName = 'Role'
      Origin = 'APPAFIS."dbo.Role".Role'
      Size = 50
    end
    object QryLodgerRoleRoleID: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'RoleID'
      Origin = 'APPAFIS."dbo.Role".RoleID'
      Visible = False
    end
  end
  object QryRelationship: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Relationship'
      'WHERE IsActive = '#39'Y'#39)
    Left = 368
    Top = 17
    object QryRelationshipRelationship: TStringField
      DisplayWidth = 35
      FieldName = 'Relationship'
      Origin = 'APPAFIS."dbo.Relationship".Relationship'
      Size = 50
    end
    object QryRelationshipRelationshipID: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'RelationshipID'
      Origin = 'APPAFIS."dbo.Relationship".RelationshipID'
      Visible = False
    end
  end
  object qryOtherPersonRole: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Role'
      'WHERE (IsActive = '#39'Y'#39') AND'
      '(Role <> '#39'Birth Relative'#39')'
      'ORDER BY Role')
    Left = 100
    Top = 192
    object StringField1: TStringField
      DisplayWidth = 35
      FieldName = 'Role'
      Origin = 'APPAFIS."dbo.Role".Role'
      Size = 50
    end
    object IntegerField1: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'RoleID'
      Origin = 'APPAFIS."dbo.Role".RoleID'
      Visible = False
    end
  end
  object QryLuReligion: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Religion'
      'WHERE IsActive = '#39'Y'#39
      'ORDER BY ReligionID')
    Left = 296
    Top = 20
    object QryLuReligionReligion: TStringField
      DisplayWidth = 30
      FieldName = 'Religion'
      Origin = 'APPAFIS."dbo.Religion".Religion'
      Size = 50
    end
    object QryLuReligionReligionID: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'ReligionID'
      Origin = 'APPAFIS."dbo.Religion".ReligionID'
      Visible = False
    end
  end
  object QryMaritalStatus: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM MaritalStatus'
      'WHERE IsActive = '#39'Y'#39
      'ORDER BY MaritalStatusID')
    Left = 296
    Top = 140
    object QryMaritalStatusMaritalStatusDescription: TStringField
      DisplayLabel = 'MaritalStatus'
      DisplayWidth = 20
      FieldName = 'MaritalStatusDescription'
      Origin = 'APPAFIS."dbo.MaritalStatus".MaritalStatusDescription'
    end
    object QryMaritalStatusMaritalStatusID: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'MaritalStatusID'
      Origin = 'APPAFIS."dbo.MaritalStatus".MaritalStatusID'
      Visible = False
    end
  end
  object qryFPerson: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'PersonID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Person'
      'WHERE (PersonID = :PersonID) AND '
      '               (IsActive = '#39'Y'#39')')
    Left = 28
    Top = 328
  end
  object dspFPerson: TDataSetProvider
    DataSet = qryFPerson
    Left = 88
    Top = 328
  end
  object cdsFPerson: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFPerson'
    Left = 128
    Top = 328
    object cdsFPersonPersonID: TIntegerField
      FieldName = 'PersonID'
    end
    object cdsFPersonReligionID: TIntegerField
      FieldName = 'ReligionID'
    end
    object cdsFPersonGender: TStringField
      FieldName = 'Gender'
      Size = 1
    end
    object cdsFPersonDOB: TDateTimeField
      FieldName = 'DOB'
    end
    object cdsFPersonHomePhone: TStringField
      FieldName = 'HomePhone'
    end
    object cdsFPersonWorkPhone: TStringField
      FieldName = 'WorkPhone'
    end
    object cdsFPersonMobilePhone: TStringField
      FieldName = 'MobilePhone'
      Size = 35
    end
    object cdsFPersonEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object cdsFPersonChildScreeningExpiry: TDateTimeField
      FieldName = 'ChildScreeningExpiry'
    end
    object cdsFPersonChildScreeningDate: TDateTimeField
      FieldName = 'ChildScreeningDate'
    end
    object cdsFPersonMailFlag: TStringField
      FieldName = 'MailFlag'
      Size = 1
    end
    object cdsFPersonX: TStringField
      FieldName = 'X'
      Size = 50
    end
    object cdsFPersonPlaceOfBirth: TStringField
      FieldName = 'PlaceOfBirth'
      Size = 50
    end
    object cdsFPersonIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
  end
  object QryMPerson: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'PersonID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Person'
      'WHERE (PersonID = :PersonID) AND '
      '               (IsActive = '#39'Y'#39')')
    Left = 20
    Top = 248
  end
  object dspMPerson: TDataSetProvider
    DataSet = QryMPerson
    Left = 88
    Top = 248
  end
  object cdsMPerson: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMPerson'
    Left = 140
    Top = 248
    object cdsMPersonPersonID: TIntegerField
      FieldName = 'PersonID'
    end
    object cdsMPersonGender: TStringField
      FieldName = 'Gender'
      Size = 1
    end
    object cdsMPersonDOB: TDateTimeField
      FieldName = 'DOB'
    end
    object cdsMPersonEthnicityId: TIntegerField
      FieldName = 'EthnicityId'
    end
    object cdsMPersonPlaceOfBirth: TStringField
      FieldName = 'PlaceOfBirth'
      Size = 50
    end
    object cdsMPersonBirthCountry: TStringField
      FieldName = 'BirthCountry'
      Size = 50
    end
    object cdsMPersonReligionId: TIntegerField
      FieldName = 'ReligionId'
    end
    object cdsMPersonHomePhone: TStringField
      FieldName = 'HomePhone'
    end
    object cdsMPersonWorkPhone: TStringField
      FieldName = 'WorkPhone'
    end
    object cdsMPersonMobilePhone: TStringField
      FieldName = 'MobilePhone'
      Size = 35
    end
    object cdsMPersonEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object cdsMPersonProofOfID: TStringField
      FieldName = 'ProofOfID'
      Size = 1
    end
    object cdsMPersonComments: TMemoField
      FieldName = 'Comments'
      BlobType = ftMemo
      Size = 1
    end
    object cdsMPersonChildScreeningDate: TDateTimeField
      FieldName = 'ChildScreeningDate'
    end
    object cdsMPersonChildScreeningExpiry: TDateTimeField
      FieldName = 'ChildScreeningExpiry'
    end
    object cdsMPersonMailFlag: TStringField
      FieldName = 'MailFlag'
      Size = 1
    end
    object cdsMPersonIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
    object cdsMPersonX: TStringField
      FieldName = 'X'
      Size = 50
    end
  end
  object QryMName: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'NameID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Name'
      'WHERE (NameID = :NameID) AND  '
      '               (IsActive = '#39'Y'#39')')
    Left = 204
    Top = 244
  end
  object dspMName: TDataSetProvider
    DataSet = QryMName
    Left = 264
    Top = 244
  end
  object cdsMName: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMName'
    Left = 316
    Top = 244
    object cdsMNameNameID: TIntegerField
      FieldName = 'NameID'
    end
    object cdsMNamePersonID: TIntegerField
      FieldName = 'PersonID'
    end
    object cdsMNameNameTypeID: TIntegerField
      FieldName = 'NameTypeID'
    end
    object cdsMNameTitle: TStringField
      FieldName = 'Title'
      Size = 10
    end
    object cdsMNameSurname: TStringField
      FieldName = 'Surname'
      Size = 50
    end
    object cdsMNameFirstName: TStringField
      FieldName = 'FirstName'
      Size = 50
    end
    object cdsMNameMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 50
    end
    object cdsMNameDataEntryDate: TDateTimeField
      FieldName = 'DataEntryDate'
    end
    object cdsMNameIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
  end
  object qryFName: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'NameID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Name'
      'WHERE (NameID = :NameID) AND  '
      '             (IsActive = '#39'Y'#39')')
    Left = 196
    Top = 332
  end
  object dspFName: TDataSetProvider
    DataSet = qryFName
    Left = 256
    Top = 328
  end
  object cdsFName: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFName'
    Left = 312
    Top = 328
    object cdsFNameNameID: TIntegerField
      FieldName = 'NameID'
    end
    object cdsFNamePersonID: TIntegerField
      FieldName = 'PersonID'
    end
    object cdsFNameNameTypeID: TIntegerField
      FieldName = 'NameTypeID'
    end
    object cdsFNameTitle: TStringField
      FieldName = 'Title'
      Size = 10
    end
    object cdsFNameSurname: TStringField
      FieldName = 'Surname'
      Size = 50
    end
    object cdsFNameFirstName: TStringField
      FieldName = 'FirstName'
      Size = 50
    end
    object cdsFNameMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 50
    end
    object cdsFNameDataEntryDate: TDateTimeField
      FieldName = 'DataEntryDate'
    end
    object cdsFNameIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
  end
  object dspPerson: TDataSetProvider
    DataSet = qryPerson
    Left = 104
    Top = 464
  end
  object cdsPerson: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerson'
    Left = 184
    Top = 464
    object cdsPersonPersonID: TIntegerField
      FieldName = 'PersonID'
    end
    object cdsPersonGender: TStringField
      FieldName = 'Gender'
      Size = 1
    end
    object cdsPersonDOB: TDateTimeField
      FieldName = 'DOB'
    end
    object cdsPersonHomePhone: TStringField
      FieldName = 'HomePhone'
    end
    object cdsPersonWorkPhone: TStringField
      FieldName = 'WorkPhone'
    end
    object cdsPersonMobilePhone: TStringField
      FieldName = 'MobilePhone'
    end
    object cdsPersonEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object cdsPersonIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
    object cdsPersonX: TStringField
      FieldName = 'X'
      Size = 50
    end
  end
  object qryPerson: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'PersonID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Person'
      'WHERE (PersonID = :PersonID) AND '
      '             (IsActive = '#39'Y'#39')')
    Left = 32
    Top = 464
  end
  object qryName: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'NameID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Name'
      'WHERE (NameID = :NameID) AND  '
      '             (IsActive = '#39'Y'#39')')
    Left = 256
    Top = 464
  end
  object dspName: TDataSetProvider
    DataSet = qryName
    Left = 336
    Top = 464
  end
  object cdsName: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspName'
    Left = 416
    Top = 464
    object cdsNameNameID: TIntegerField
      FieldName = 'NameID'
    end
    object cdsNamePersonID: TIntegerField
      FieldName = 'PersonID'
    end
    object cdsNameSurname: TStringField
      FieldName = 'Surname'
      Size = 50
    end
    object cdsNameFirstName: TStringField
      FieldName = 'FirstName'
      Size = 50
    end
    object cdsNameMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 50
    end
    object cdsNameNameTypeID: TIntegerField
      FieldName = 'NameTypeID'
    end
    object cdsNameDataEntryDate: TDateTimeField
      FieldName = 'DataEntryDate'
    end
    object cdsNameIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
  end
  object qry: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    Left = 520
    Top = 32
  end
  object cdsABC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspABC'
    Left = 580
    Top = 140
    object cdsABCABCID: TIntegerField
      FieldName = 'ABCID'
    end
    object cdsABCFPersonID: TIntegerField
      FieldName = 'FPersonID'
    end
    object cdsABCMPersonID: TIntegerField
      FieldName = 'MPersonID'
    end
    object cdsABCMaritalStatusID: TIntegerField
      FieldName = 'MaritalStatusID'
    end
    object cdsABCAddressID: TIntegerField
      FieldName = 'AddressID'
    end
    object cdsABCDateLastChildPlaced: TDateTimeField
      FieldName = 'DateLastChildPlaced'
    end
    object cdsABCDateApplication: TDateTimeField
      FieldName = 'DateApplication'
    end
    object cdsABCDateApprovalRenewed: TDateTimeField
      FieldName = 'DateApprovalRenewed'
    end
    object cdsABCChildNo: TStringField
      FieldName = 'ChildNo'
      Size = 10
    end
    object cdsABCOtherChildren: TStringField
      FieldName = 'OtherChildren'
    end
    object cdsABCComments: TStringField
      FieldName = 'Comments'
      Size = 250
    end
    object cdsABCIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
    object cdsABCStage1: TStringField
      FieldName = 'Stage1'
      Size = 1
    end
    object cdsABCStage2: TStringField
      FieldName = 'Stage2'
      Size = 1
    end
    object cdsABCStage3: TStringField
      FieldName = 'Stage3'
      Size = 1
    end
    object cdsABCDateEOI: TDateTimeField
      FieldName = 'DateEOI'
    end
    object cdsABCDateAssRequested: TDateTimeField
      FieldName = 'DateAssRequested'
    end
    object cdsABCApprovedForConsideration: TStringField
      FieldName = 'ApprovedForConsideration'
      Size = 300
    end
    object cdsABCAssessingWorker: TStringField
      FieldName = 'AssessingWorker'
      Size = 35
    end
    object cdsABCWorkshopAttended: TDateTimeField
      FieldName = 'WorkshopAttended'
    end
    object cdsABCDateInfoSession: TDateTimeField
      FieldName = 'DateInfoSession'
    end
    object cdsABCDateApproval: TDateTimeField
      FieldName = 'DateApproval'
    end
    object cdsABCDateReApproval: TDateTimeField
      FieldName = 'DateReApproval'
    end
    object cdsABCDateValidUntil: TDateTimeField
      FieldName = 'DateValidUntil'
    end
    object cdsABCDateAllocated: TDateTimeField
      FieldName = 'DateAllocated'
    end
    object cdsABCDateChildPlaced: TDateTimeField
      FieldName = 'DateChildPlaced'
    end
    object cdsABCDateAOG: TDateTimeField
      FieldName = 'DateAOG'
    end
    object cdsABCRemarks: TStringField
      FieldName = 'Remarks'
      Size = 300
    end
    object cdsABCMeetBirthMother: TStringField
      FieldName = 'MeetBirthMother'
      Size = 1
    end
    object cdsABCBirthMotherFULLId: TStringField
      FieldName = 'BirthMotherFULLId'
      Size = 1
    end
    object cdsABCAdoptParentFULLIdByBM: TStringField
      FieldName = 'AdoptParentFULLIdByBM'
      Size = 1
    end
    object cdsABCBirthMotherMembers: TStringField
      FieldName = 'BirthMotherMembers'
      Size = 1
    end
    object cdsABCBMLastContact: TDateTimeField
      FieldName = 'BMLastContact'
    end
    object cdsABCMeetBirthFather: TStringField
      FieldName = 'MeetBirthFather'
      Size = 1
    end
    object cdsABCBirthFatherFULLId: TStringField
      FieldName = 'BirthFatherFULLId'
      Size = 1
    end
    object cdsABCAdoptParentFULLIdByBF: TStringField
      FieldName = 'AdoptParentFULLIdByBF'
      Size = 1
    end
    object cdsABCBirthFatherMembers: TStringField
      FieldName = 'BirthFatherMembers'
      Size = 1
    end
    object cdsABCBFLastContact: TDateTimeField
      FieldName = 'BFLastContact'
    end
    object cdsABCPostAdoptionAgreement: TMemoField
      FieldName = 'PostAdoptionAgreement'
      BlobType = ftMemo
      Size = 1
    end
    object cdsABCDateClosed: TDateTimeField
      FieldName = 'DateClosed'
    end
    object cdsABCStepParent: TStringField
      FieldName = 'StepParent'
      Size = 1
    end
    object cdsABCPartChild: TStringField
      FieldName = 'PartChild'
      Size = 1
    end
  end
  object dspABC: TDataSetProvider
    DataSet = QryABC
    Left = 544
    Top = 140
  end
  object QryABC: TADOQuery
    Connection = frmMain.dbAFIS
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ABCID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM ABC'
      'WHERE  (ABCID = :ABCID)')
    Left = 500
    Top = 140
  end
  object QryAddress: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'AddressID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Address'
      'WHERE (AddressID =  :AddressID) AND '
      '               (IsActive = '#39'Y'#39')')
    Left = 472
    Top = 196
  end
  object dspAddress: TDataSetProvider
    DataSet = QryAddress
    Left = 556
    Top = 196
  end
  object cdsAddress: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAddress'
    Left = 608
    Top = 196
    object cdsAddressAddressID: TIntegerField
      FieldName = 'AddressID'
    end
    object cdsAddressStreet: TStringField
      FieldName = 'Street'
      Size = 50
    end
    object cdsAddressSuburb: TStringField
      FieldName = 'Suburb'
      Size = 50
    end
    object cdsAddressState: TStringField
      FieldName = 'State'
      Size = 10
    end
    object cdsAddressPostcode: TStringField
      FieldName = 'Postcode'
      Size = 10
    end
    object cdsAddressCountry: TStringField
      FieldName = 'Country'
      Size = 50
    end
    object cdsAddressDataEntryDate: TDateTimeField
      FieldName = 'DataEntryDate'
    end
    object cdsAddressIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
    object cdsAddressPostalStreet: TStringField
      FieldName = 'PostalStreet'
      Size = 50
    end
    object cdsAddressPostalSuburb: TStringField
      FieldName = 'PostalSuburb'
      Size = 50
    end
    object cdsAddressPostalState: TStringField
      FieldName = 'PostalState'
      Size = 10
    end
    object cdsAddressPostalPostcode: TStringField
      FieldName = 'PostalPostcode'
      Size = 5
    end
    object cdsAddressCareOf: TStringField
      FieldName = 'CareOf'
      Size = 50
    end
    object cdsAddressAddressLine2: TStringField
      FieldName = 'AddressLine2'
      Size = 80
    end
  end
  object qryABCPerson: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'ABCPersonID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM ABCPerson'
      'WHERE  (ABCPersonID = :ABCPersonID) and'
      '(IsActive = '#39'Y'#39')')
    Left = 468
    Top = 260
  end
  object dspABCPerson: TDataSetProvider
    DataSet = qryABCPerson
    Left = 552
    Top = 260
  end
  object cdsABCPerson: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspABCPerson'
    Left = 628
    Top = 260
    object cdsABCPersonABCPersonID: TIntegerField
      FieldName = 'ABCPersonID'
    end
    object cdsABCPersonABCId: TIntegerField
      FieldName = 'ABCId'
    end
    object cdsABCPersonNameId: TIntegerField
      FieldName = 'NameId'
    end
    object cdsABCPersonRoleId: TIntegerField
      FieldName = 'RoleId'
    end
    object cdsABCPersonAddressId: TIntegerField
      FieldName = 'AddressId'
    end
    object cdsABCPersonConsents: TStringField
      FieldName = 'Consents'
      Size = 50
    end
    object cdsABCPersonDateSigned: TDateTimeField
      FieldName = 'DateSigned'
    end
    object cdsABCPersonIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
    object cdsABCPersonStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object cdsABCPersonMaritalStatusId: TIntegerField
      FieldName = 'MaritalStatusId'
    end
    object cdsABCPersonBParentRelationshipId: TIntegerField
      FieldName = 'BParentRelationshipId'
    end
    object cdsABCPersonOtherChildren: TStringField
      FieldName = 'OtherChildren'
      Size = 50
    end
  end
  object QryChild: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'PersonID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Person'
      'WHERE (PersonID = :PersonID)')
    Left = 568
    Top = 404
  end
  object dspChild: TDataSetProvider
    DataSet = QryChild
    Left = 596
    Top = 404
  end
  object cdsChild: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChild'
    Left = 624
    Top = 404
    object cdsChildPersonID: TIntegerField
      FieldName = 'PersonID'
    end
    object cdsChildGender: TStringField
      FieldName = 'Gender'
      Size = 1
    end
    object cdsChildDOB: TDateTimeField
      FieldName = 'DOB'
    end
    object cdsChildIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
    object cdsChildX: TStringField
      FieldName = 'X'
      Size = 50
    end
  end
  object cdsChildName: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChildName'
    Left = 664
    Top = 436
    object cdsChildNameNameID: TIntegerField
      FieldName = 'NameID'
    end
    object cdsChildNamePersonID: TIntegerField
      FieldName = 'PersonID'
    end
    object cdsChildNameSurname: TStringField
      FieldName = 'Surname'
      Size = 50
    end
    object cdsChildNameFirstName: TStringField
      FieldName = 'FirstName'
      Size = 50
    end
    object cdsChildNameMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 50
    end
    object cdsChildNameNameTypeID: TIntegerField
      FieldName = 'NameTypeID'
    end
    object cdsChildNameDataEntryDate: TDateTimeField
      FieldName = 'DataEntryDate'
    end
    object cdsChildNameIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
  end
  object dspChildName: TDataSetProvider
    DataSet = QryChildName
    Left = 604
    Top = 436
  end
  object QryChildName: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'NameID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Name'
      'WHERE (NameID = :NameID)')
    Left = 568
    Top = 436
  end
  object QryABCChild: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'ABCChildID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM ABCChild'
      'WHERE (ABCChildID = :ABCChildID)')
    Left = 560
    Top = 495
  end
  object dspABCChild: TDataSetProvider
    DataSet = QryABCChild
    Left = 604
    Top = 496
  end
  object cdsABCChild: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspABCChild'
    Left = 648
    Top = 496
    object cdsABCChildABCChildID: TIntegerField
      FieldName = 'ABCChildID'
    end
    object cdsABCChildABCID: TIntegerField
      FieldName = 'ABCID'
    end
    object cdsABCChildChildID: TIntegerField
      FieldName = 'ChildID'
    end
    object cdsABCChildIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
  end
  object QryICAChild: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'ICAChildID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM ICAChild'
      'WHERE (ICAChildID = :ICAChildID)')
    Left = 572
    Top = 560
  end
  object dspICAChild: TDataSetProvider
    DataSet = QryICAChild
    Left = 600
    Top = 560
  end
  object cdsICAChild: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspICAChild'
    Left = 628
    Top = 560
    object cdsICAChildICAChildID: TIntegerField
      FieldName = 'ICAChildID'
    end
    object cdsICAChildICAID: TIntegerField
      FieldName = 'ICAID'
    end
    object cdsICAChildChildID: TIntegerField
      FieldName = 'ChildID'
    end
    object cdsICAChildIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
  end
  object QryICA: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <
      item
        Name = 'ICAID'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM ICA'
      'WHERE (ICAID = :ICAID)')
    Left = 504
    Top = 100
  end
  object dspICA: TDataSetProvider
    DataSet = QryICA
    Left = 532
    Top = 100
  end
  object cdsICA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspICA'
    OnNewRecord = cdsICANewRecord
    Left = 576
    Top = 100
    object cdsICAICAID: TIntegerField
      FieldName = 'ICAID'
    end
    object cdsICAMPersonID: TIntegerField
      FieldName = 'MPersonID'
    end
    object cdsICAFPersonID: TIntegerField
      FieldName = 'FPersonID'
    end
    object cdsICAAddressID: TIntegerField
      FieldName = 'AddressID'
    end
    object cdsICAFileNo: TStringField
      FieldName = 'FileNo'
      Size = 11
    end
    object cdsICAChildNo: TStringField
      FieldName = 'ChildNo'
      Size = 10
    end
    object cdsICAOtherChildren: TStringField
      FieldName = 'OtherChildren'
    end
    object cdsICADateLastChildPlaced: TDateTimeField
      FieldName = 'DateLastChildPlaced'
    end
    object cdsICADateExpOfInt: TDateTimeField
      FieldName = 'DateExpOfInt'
    end
    object cdsICADateApplication: TDateTimeField
      FieldName = 'DateApplication'
    end
    object cdsICADateAssReq: TDateTimeField
      FieldName = 'DateAssReq'
    end
    object cdsICADateApproval: TDateTimeField
      FieldName = 'DateApproval'
    end
    object cdsICADateValidUntil: TDateTimeField
      FieldName = 'DateValidUntil'
    end
    object cdsICADateApprovalRenewed: TDateTimeField
      FieldName = 'DateApprovalRenewed'
    end
    object cdsICADateFileOverseas: TDateTimeField
      FieldName = 'DateFileOverseas'
    end
    object cdsICADateAllocated: TDateTimeField
      FieldName = 'DateAllocated'
    end
    object cdsICADatePlaced: TDateTimeField
      FieldName = 'DatePlaced'
    end
    object cdsICADateOfArrival: TDateTimeField
      FieldName = 'DateOfArrival'
    end
    object cdsICADateClosed: TDateTimeField
      FieldName = 'DateClosed'
    end
    object cdsICAMaritalStatusID: TIntegerField
      FieldName = 'MaritalStatusID'
    end
    object cdsICACountry: TStringField
      FieldName = 'Country'
      Size = 50
    end
    object cdsICAIsActive: TStringField
      FieldName = 'IsActive'
      Size = 1
    end
    object cdsICAKoreanCitizenshipCertificate: TStringField
      FieldName = 'KoreanCitizenshipCertificate'
      Size = 1
    end
    object cdsICACertOfConformity: TStringField
      FieldName = 'CertOfConformity'
      Size = 1
    end
    object cdsICAStage1: TStringField
      FieldName = 'Stage1'
      Size = 1
    end
    object cdsICAStage2: TStringField
      FieldName = 'Stage2'
      Size = 1
    end
    object cdsICAStage3: TStringField
      FieldName = 'Stage3'
      Size = 1
    end
    object cdsICAStage4: TStringField
      FieldName = 'Stage4'
      Size = 1
    end
    object cdsICAStage5: TStringField
      FieldName = 'Stage5'
      Size = 1
    end
    object cdsICAInfoSession: TDateTimeField
      FieldName = 'InfoSession'
    end
    object cdsICAEducationForums: TDateTimeField
      FieldName = 'EducationForums'
    end
    object cdsICAWorker: TStringField
      FieldName = 'Worker'
      Size = 30
    end
    object cdsICAAssessingWorker: TStringField
      FieldName = 'AssessingWorker'
      Size = 30
    end
    object cdsICAAOG: TDateTimeField
      FieldName = 'AOG'
    end
    object cdsICADocoReceived: TDateTimeField
      FieldName = 'DocoReceived'
    end
    object cdsICAProgressReport1: TIntegerField
      FieldName = 'ProgressReport1'
    end
    object cdsICAProgressReport2: TIntegerField
      FieldName = 'ProgressReport2'
    end
    object cdsICAProgressReport3: TIntegerField
      FieldName = 'ProgressReport3'
    end
    object cdsICAProgressReport4: TIntegerField
      FieldName = 'ProgressReport4'
    end
    object cdsICAFeePaidDate: TDateTimeField
      FieldName = 'FeePaidDate'
    end
    object cdsICAComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object cdsICAAssessDate: TDateTimeField
      FieldName = 'AssessDate'
    end
    object cdsICADueDate1: TDateTimeField
      FieldName = 'DueDate1'
    end
    object cdsICAReceivedDate1: TDateTimeField
      FieldName = 'ReceivedDate1'
    end
    object cdsICADateSentOverseas1: TDateTimeField
      FieldName = 'DateSentOverseas1'
    end
    object cdsICADueDate2: TDateTimeField
      FieldName = 'DueDate2'
    end
    object cdsICAReceivedDate2: TDateTimeField
      FieldName = 'ReceivedDate2'
    end
    object cdsICADueDate3: TDateTimeField
      FieldName = 'DueDate3'
    end
    object cdsICAReceivedDate3: TDateTimeField
      FieldName = 'ReceivedDate3'
    end
    object cdsICADateSentOverseas3: TDateTimeField
      FieldName = 'DateSentOverseas3'
    end
    object cdsICADueDate4: TDateTimeField
      FieldName = 'DueDate4'
    end
    object cdsICAReceivedDate4: TDateTimeField
      FieldName = 'ReceivedDate4'
    end
    object cdsICADateSentOverseas4: TDateTimeField
      FieldName = 'DateSentOverseas4'
    end
    object cdsICADateAllocatedToWorker: TDateTimeField
      FieldName = 'DateAllocatedToWorker'
    end
    object cdsICADateSentOverseas2: TDateTimeField
      FieldName = 'DateSentOverseas2'
    end
    object cdsICADateCasePlanCompleted: TDateTimeField
      FieldName = 'DateCasePlanCompleted'
    end
    object cdsICAChildDetails: TStringField
      FieldName = 'ChildDetails'
      Size = 250
    end
    object cdsICAProgressReport5: TIntegerField
      FieldName = 'ProgressReport5'
    end
    object cdsICADueDate5: TDateTimeField
      FieldName = 'DueDate5'
    end
    object cdsICAReceivedDate5: TDateTimeField
      FieldName = 'ReceivedDate5'
    end
    object cdsICADateSentOverseas5: TDateTimeField
      FieldName = 'DateSentOverseas5'
    end
    object cdsICAProgressReport6: TIntegerField
      FieldName = 'ProgressReport6'
    end
    object cdsICADueDate6: TDateTimeField
      FieldName = 'DueDate6'
    end
    object cdsICAReceivedDate6: TDateTimeField
      FieldName = 'ReceivedDate6'
    end
    object cdsICADateSentOverseas6: TDateTimeField
      FieldName = 'DateSentOverseas6'
    end
    object cdsICAPartChild: TStringField
      FieldName = 'PartChild'
      Size = 1
    end
  end
  object qryAbout: TADOQuery
    Connection = frmMain.dbAFIS
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM ABOUT')
    Left = 608
    Top = 32
    object qryAboutOwnerEmailAddress: TStringField
      FieldName = 'OwnerEmailAddress'
      Origin = 'APPAFIS."dbo.About".OwnerEmailAddress'
      Size = 50
    end
  end
end
