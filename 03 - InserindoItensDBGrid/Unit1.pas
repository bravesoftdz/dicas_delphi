unit Unit1;

interface

uses
  Data.DB,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,

  System.Classes,
  System.SysUtils,
  System.Variants,

  Vcl.ColorGrd,
  Vcl.Controls,
  Vcl.DBCGrids,
  Vcl.DBCtrls,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Vcl.Mask,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,

  Winapi.Messages,
  Winapi.Windows;

type
  TForm1 = class(TForm)
    FDConn: TFDConnection;
    QRY_ConsultaProdutos: TFDQuery;
    QRY_ConsultaProdutosPRO_CODIGO: TIntegerField;
    QRY_ConsultaProdutosPRO_NOMECOMPLETO: TStringField;
    QRY_ConsultaProdutosPRO_VLRVENDA: TFMTBCDField;
    TBL_itensGrid: TFDMemTable;
    dsItensGrid: TDataSource;
    TBL_itensGridpro_codigo: TIntegerField;
    TBL_itensGridpro_nome: TStringField;
    TBL_itensGridpro_qtd: TCurrencyField;
    TBL_itensGridpro_vlrunitario: TCurrencyField;
    TBL_itensGridpro_subtotal: TCurrencyField;
    DBGrid: TDBGrid;
    pnlSubTotal: TPanel;
    pnlLineTopo: TPanel;
    pnlTitulo: TPanel;
    lblTitVenda: TLabel;
    lblTotal: TLabel;
    lblVlrVenda: TLabel;
    lblMissao: TLabel;
    btnNovaVenda: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBGridColExit(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TBL_itensGridCalcFields(DataSet: TDataSet);
    procedure btnNovaVendaClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnNovaVendaClick(Sender: TObject);
begin
  if TBL_itensGrid.RecordCount > 0 then
    TBL_itensGrid.EmptyDataSet;

  TBL_itensGrid.Open;
  TBL_itensGrid.Insert;

  DBGrid.SetFocus;

end;

procedure TForm1.DBGridColExit(Sender: TObject);
begin

  if TBL_itensGrid.State = dsInsert then
  begin

    if DBGrid.SelectedIndex = 0 then
    begin

      QRY_ConsultaProdutos.Close;
      QRY_ConsultaProdutos.Params[0].AsInteger := TBL_itensGridpro_codigo.AsInteger;
      QRY_ConsultaProdutos.Open();

      if QRY_ConsultaProdutos.RecordCount > 0 then
      begin

        TBL_itensGridpro_nome.AsString       := QRY_ConsultaProdutosPRO_NOMECOMPLETO.AsString;
        TBL_itensGridpro_vlrunitario.AsFloat := QRY_ConsultaProdutosPRO_VLRVENDA.AsFloat;

      end
      else begin
        ShowMessage('Produto não encontrado.');
        DBGrid.SelectedIndex := 0;
        abort;
      end;

    end;

    if DBGrid.SelectedIndex = 2 then
    begin
    // valida a quantidade aqui...
      if TBL_itensGridpro_qtd.AsFloat < 1 then
      begin

        ShowMessage('Quantidade Inválida');
        DBGrid.SelectedIndex := 2;
        abort;

      end;

    end;

  end;


end;

procedure TForm1.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin //mudando a cor do fundo da grid ( focada )
  DBGrid.Canvas.Brush.Color := clWhite; // $00F8F8F8;
  DBGrid.Canvas.Font.Color  := clBlack;
  DBGrid.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TForm1.DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = VK_RETURN then // enter
  begin

    case DBGrid.SelectedIndex of
      0: begin  // codigo do intem
        DBGrid.SelectedIndex := 2;  // qtd
      end;

      2: begin // qtd. do item
        DBGrid.SelectedIndex := 3; // vlr. unit
      end;

      else begin
        DBGrid.SelectedIndex := 0;
        TBL_itensGrid.Insert;
      end;

    end;

  end;

  if key = VK_CANCEL then
  begin
    TBL_itensGrid.Cancel;
  end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin // show
  TBL_itensGrid.Open;
  TBL_itensGrid.Insert;
end;

procedure TForm1.TBL_itensGridCalcFields(DataSet: TDataSet);
begin
  TBL_itensGridpro_subtotal.AsFloat := TBL_itensGridpro_qtd.AsFloat
                                       * TBL_itensGridpro_vlrunitario.AsFloat;

end;

end.
