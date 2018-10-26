object FrmBase: TFrmBase
  Left = 0
  Top = 0
  Caption = 'Base'
  ClientHeight = 423
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnBarraRodape: TPanel
    Left = 0
    Top = 382
    Width = 735
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object btnFechar: TButton
      Left = 636
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object PagePrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 735
    Height = 382
    ActivePage = tbDados
    Align = alClient
    TabOrder = 1
    object tbPesquisar: TTabSheet
      Caption = 'tbPesquisar'
      object pnBtnPesquisar: TPanel
        Left = 0
        Top = 313
        Width = 727
        Height = 41
        Align = alBottom
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 0
        object btndetalhar: TButton
          Left = 321
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Detalhar'
          TabOrder = 1
          OnClick = btndetalharClick
        end
        object btnnovo: TButton
          Left = 240
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Novo'
          TabOrder = 0
          OnClick = btnnovoClick
        end
        object btnexcluir: TButton
          Left = 402
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 2
          OnClick = btnexcluirClick
        end
      end
      object pnFiltro: TPanel
        Left = 0
        Top = 0
        Width = 727
        Height = 57
        Align = alTop
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 1
        object EdtPesquisar: TLabeledEdit
          Left = 16
          Top = 18
          Width = 577
          Height = 21
          EditLabel.Width = 55
          EditLabel.Height = 13
          EditLabel.Caption = 'Pesquisar'
          EditLabel.Color = clGray
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWhite
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentColor = False
          EditLabel.ParentFont = False
          TabOrder = 0
          OnEnter = EdtPesquisarEnter
          OnExit = EdtPesquisarExit
        end
        object btnpesquisar: TButton
          Left = 608
          Top = 16
          Width = 99
          Height = 25
          Caption = '&Pesquisar'
          TabOrder = 1
          OnClick = btnpesquisarClick
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 60
        Width = 721
        Height = 250
        Align = alClient
        DataSource = DSPesquisar
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenu1
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = btndetalharClick
      end
    end
    object tbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 313
        Width = 727
        Height = 41
        Align = alBottom
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 0
        object btnalterar: TButton
          Left = 297
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Alterar'
          TabOrder = 1
          OnClick = btnalterarClick
        end
        object btnlistar: TButton
          Left = 216
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Listar'
          TabOrder = 0
          OnClick = btnlistarClick
        end
        object btngravar: TButton
          Left = 378
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Gravar'
          TabOrder = 2
          OnClick = btngravarClick
        end
        object btncancelar: TButton
          Left = 459
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          TabOrder = 3
          OnClick = btncancelarClick
        end
      end
    end
  end
  object DSPesquisar: TDataSource
    Left = 460
    Top = 168
  end
  object PopupMenu1: TPopupMenu
    Left = 300
    Top = 160
    object Detalhar1: TMenuItem
      Caption = 'Detalhar'
      OnClick = btndetalharClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = btnexcluirClick
    end
  end
end
