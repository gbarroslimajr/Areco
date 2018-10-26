inherited FrmItem: TFrmItem
  Caption = 'Item'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PagePrincipal: TPageControl
    inherited tbPesquisar: TTabSheet
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'iditem'
            Title.Caption = 'ID Item'
            Width = 100
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'nome'
            Title.Alignment = taCenter
            Title.Caption = 'Nome'
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Servico'
            Title.Alignment = taCenter
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'valorunitario'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 100
            Visible = True
          end>
      end
    end
    inherited tbDados: TTabSheet
      object Label1: TLabel [0]
        Left = 147
        Top = 89
        Width = 92
        Height = 13
        Caption = 'Selecione o Servi'#231'o'
      end
      object edtIDItem: TLabeledEdit
        Left = 3
        Top = 56
        Width = 121
        Height = 21
        Color = clInactiveBorder
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'ID Item'
        Enabled = False
        ReadOnly = True
        TabOrder = 1
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
      end
      object EdtCodigo: TLabeledEdit
        Left = 3
        Top = 104
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo Item'
        Enabled = False
        TabOrder = 2
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
      end
      object EdtNome: TLabeledEdit
        Left = 3
        Top = 152
        Width = 198
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        Enabled = False
        TabOrder = 4
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
      end
      object EdtDescricao: TLabeledEdit
        Left = 227
        Top = 152
        Width = 480
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        Enabled = False
        TabOrder = 5
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
      end
      object dbComboServico: TDBLookupComboBox
        Left = 147
        Top = 104
        Width = 198
        Height = 21
        Enabled = False
        KeyField = 'idservico'
        ListField = 'idservico'
        ListSource = DSServico
        TabOrder = 3
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
      end
      object edtValorUnitario: TLabeledEdit
        Left = 3
        Top = 200
        Width = 121
        Height = 21
        EditLabel.Width = 64
        EditLabel.Height = 13
        EditLabel.Caption = 'Valor Unit'#225'rio'
        Enabled = False
        TabOrder = 6
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
        OnKeyPress = edtValorUnitarioKeyPress
      end
      object edtPeso: TLabeledEdit
        Left = 147
        Top = 200
        Width = 121
        Height = 21
        EditLabel.Width = 23
        EditLabel.Height = 13
        EditLabel.Caption = 'Peso'
        Enabled = False
        TabOrder = 7
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
        OnKeyPress = edtValorUnitarioKeyPress
      end
      object edtAltura: TLabeledEdit
        Left = 283
        Top = 200
        Width = 121
        Height = 21
        EditLabel.Width = 29
        EditLabel.Height = 13
        EditLabel.Caption = 'Altura'
        Enabled = False
        TabOrder = 8
        OnEnter = EdtPesquisarEnter
        OnExit = EdtPesquisarExit
        OnKeyPress = edtValorUnitarioKeyPress
      end
      object edtidproduto: TEdit
        Left = 603
        Top = 3
        Width = 121
        Height = 21
        TabOrder = 9
        Text = 'edtidproduto'
        Visible = False
      end
    end
  end
  inherited DSPesquisar: TDataSource
    DataSet = DMItem.CDSConsulta
    Left = 668
    Top = 48
  end
  inherited PopupMenu1: TPopupMenu
    Left = 580
    Top = 48
  end
  object DSServico: TDataSource
    DataSet = DMItem.CDSServico
    Left = 668
    Top = 104
  end
end
