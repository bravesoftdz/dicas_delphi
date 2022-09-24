object Form1: TForm1
  Left = 0
  Top = 0
  Caption = '[ VENDA ]'
  ClientHeight = 395
  ClientWidth = 958
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 21
  object DBGrid: TDBGrid
    AlignWithMargins = True
    Left = 10
    Top = 53
    Width = 938
    Height = 252
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    BorderStyle = bsNone
    Color = clWhite
    DataSource = dsItensGrid
    DrawingStyle = gdsGradient
    FixedColor = 5395026
    GradientEndColor = 5395026
    GradientStartColor = 5395026
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI Semibold'
    TitleFont.Style = [fsBold]
    OnColExit = DBGridColExit
    OnDrawColumnCell = DBGridDrawColumnCell
    OnKeyDown = DBGridKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'pro_codigo'
        Title.Caption = 'C'#243'digo'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_nome'
        Title.Caption = 'Produto'
        Width = 436
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_qtd'
        Title.Caption = 'QTD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_vlrunitario'
        Title.Caption = 'Vlr. Unit'#225'rio'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_subtotal'
        Title.Caption = 'Sub. Total'
        Width = 121
        Visible = True
      end>
  end
  object pnlSubTotal: TPanel
    Left = 0
    Top = 315
    Width = 958
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    Color = 16316664
    ParentBackground = False
    TabOrder = 1
    object lblTotal: TLabel
      AlignWithMargins = True
      Left = 722
      Top = 25
      Width = 97
      Height = 52
      Margins.Top = 25
      Margins.Right = 20
      Align = alRight
      Caption = 'Tot. Venda:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 727
      ExplicitHeight = 30
    end
    object lblVlrVenda: TLabel
      AlignWithMargins = True
      Left = 842
      Top = 20
      Width = 96
      Height = 57
      Margins.Top = 20
      Margins.Right = 20
      Align = alRight
      Caption = 'R$ 0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 760
      ExplicitTop = 40
      ExplicitHeight = 37
    end
    object lblMissao: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 25
      Width = 444
      Height = 52
      Margins.Top = 25
      Margins.Right = 20
      Align = alLeft
      Caption = '[ DESAFIO PRA GALERA ] Fa'#231'am o Total da Venda!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 30
    end
  end
  object pnlLineTopo: TPanel
    Left = 0
    Top = 0
    Width = 958
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    Color = 13948116
    ParentBackground = False
    TabOrder = 2
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 5
    Width = 958
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    Color = 16316664
    ParentBackground = False
    TabOrder = 3
    object lblTitVenda: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 306
      Height = 32
      Align = alLeft
      Caption = '[ SIMULA'#199#195'O DE UMA VENDA ]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5395026
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 30
    end
    object btnNovaVenda: TButton
      Left = 842
      Top = 0
      Width = 116
      Height = 38
      Cursor = crHandPoint
      Align = alRight
      Caption = 'Nova Venda'
      TabOrder = 0
      OnClick = btnNovaVendaClick
    end
  end
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=F:\_DATA_BASE_\DB_SISTEMA(4.0)\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Port=3040'
      'CharacterSet=win1252'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 384
    Top = 96
  end
  object QRY_ConsultaProdutos: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from produto where pro_codigo = :codigo')
    Left = 384
    Top = 160
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QRY_ConsultaProdutosPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Origin = 'PRO_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRY_ConsultaProdutosPRO_NOMECOMPLETO: TStringField
      FieldName = 'PRO_NOMECOMPLETO'
      Origin = 'PRO_NOMECOMPLETO'
      Size = 200
    end
    object QRY_ConsultaProdutosPRO_VLRVENDA: TFMTBCDField
      FieldName = 'PRO_VLRVENDA'
      Origin = 'PRO_VLRVENDA'
      Precision = 18
      Size = 2
    end
  end
  object TBL_itensGrid: TFDMemTable
    OnCalcFields = TBL_itensGridCalcFields
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 544
    Top = 104
    object TBL_itensGridpro_codigo: TIntegerField
      FieldName = 'pro_codigo'
    end
    object TBL_itensGridpro_nome: TStringField
      FieldName = 'pro_nome'
      Size = 100
    end
    object TBL_itensGridpro_qtd: TCurrencyField
      Alignment = taCenter
      FieldName = 'pro_qtd'
      currency = False
    end
    object TBL_itensGridpro_vlrunitario: TCurrencyField
      FieldName = 'pro_vlrunitario'
    end
    object TBL_itensGridpro_subtotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'pro_subtotal'
      Calculated = True
    end
  end
  object dsItensGrid: TDataSource
    DataSet = TBL_itensGrid
    Left = 536
    Top = 176
  end
end
