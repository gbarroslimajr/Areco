inherited FrmServico: TFrmServico
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Servi'#231'o'
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
        Columns = <
          item
            Expanded = False
            FieldName = 'idServico'
            Title.Caption = 'Servi'#231'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idcategoria'
            Title.Caption = 'ID Categoria'
            Width = 100
            Visible = True
          end>
      end
    end
    inherited tbDados: TTabSheet
      ExplicitWidth = 737
      ExplicitHeight = 364
      object Label1: TLabel [0]
        Left = 216
        Top = 48
        Width = 104
        Height = 13
        Caption = 'Selecione a Categoria'
      end
      inherited Panel1: TPanel
        Top = 323
        Width = 737
        ExplicitTop = 323
        ExplicitWidth = 737
      end
      object edtidServico: TLabeledEdit
        Left = 64
        Top = 64
        Width = 121
        Height = 21
        Color = clInactiveBorder
        EditLabel.Width = 85
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo do servi'#231'o'
        TabOrder = 1
      end
      object dbComboCategoria: TDBLookupComboBox
        Left = 216
        Top = 64
        Width = 281
        Height = 21
        Enabled = False
        KeyField = 'idcategoria'
        ListField = 'nome'
        ListSource = DSCategoria
        TabOrder = 2
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
      end
    end
  end
  inherited DSPesquisar: TDataSource
    DataSet = DMServico.CDSConsulta2
    Left = 556
    Top = 112
  end
  inherited PopupMenu1: TPopupMenu
    Left = 564
  end
  object DSCategoria: TDataSource
    DataSet = DMServico.CDSCategoria
    Left = 628
    Top = 112
  end
end
