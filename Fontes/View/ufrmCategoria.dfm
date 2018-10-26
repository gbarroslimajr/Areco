inherited FrmCategoria: TFrmCategoria
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Categorias'
  ClientHeight = 433
  ClientWidth = 745
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnBarraRodape: TPanel
    Top = 392
    Width = 745
    ExplicitTop = 392
    ExplicitWidth = 745
  end
  inherited PagePrincipal: TPageControl
    Width = 745
    Height = 392
    ExplicitWidth = 745
    ExplicitHeight = 392
    inherited tbPesquisar: TTabSheet
      ExplicitWidth = 737
      ExplicitHeight = 364
      inherited pnBtnPesquisar: TPanel
        Top = 323
        Width = 737
        ExplicitTop = 323
        ExplicitWidth = 737
      end
      inherited pnFiltro: TPanel
        Width = 737
        ExplicitWidth = 737
      end
      inherited DBGrid1: TDBGrid
        Width = 731
        Height = 260
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        OnDblClick = nil
        Columns = <
          item
            Expanded = False
            FieldName = 'idcategoria'
            Title.Caption = 'ID Categoria'
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'codigo'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Width = 250
            Visible = True
          end>
      end
    end
    inherited tbDados: TTabSheet
      ExplicitWidth = 737
      ExplicitHeight = 364
      inherited Panel1: TPanel
        Top = 323
        Width = 737
        ExplicitTop = 323
        ExplicitWidth = 737
      end
      object edtID: TLabeledEdit
        Left = 24
        Top = 72
        Width = 121
        Height = 21
        Color = clInactiveBorder
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'ID Categoria'
        ReadOnly = True
        TabOrder = 1
      end
      object edtCodigo: TLabeledEdit
        Left = 24
        Top = 120
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo '
        Enabled = False
        MaxLength = 10
        TabOrder = 2
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
      end
      object edtDescricao: TLabeledEdit
        Left = 170
        Top = 120
        Width = 511
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        Enabled = False
        MaxLength = 50
        TabOrder = 3
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
      end
    end
  end
  inherited DSPesquisar: TDataSource
    DataSet = DMCategoria.CDSConsulta
    Left = 548
    Top = 64
  end
end
