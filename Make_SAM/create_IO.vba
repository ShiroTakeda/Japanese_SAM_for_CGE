
'----------------------------------------------------------
Sub IO表の作成()
'----------------------------------------------------------

'======================================================================
'
'   変数の宣言
'
'======================================================================

    Dim I As Integer                    'ループのカウンター
    Dim j As Integer
    Dim k As Integer
    Dim l As Integer
    
    Dim num_expo As Integer             '輸出の列番号
    Dim num_impo As Integer             '輸入の列番号
    Dim num_hhco As Integer             '家計消費の列番号
    Dim num_wage As Integer             '雇用者報酬の列番号
    Dim num_opse As Integer             '営業余剰の列番号
    
    Dim tax_con As Single               '消費税率の値
    Dim tax_lin As Single               '労働所得税率の値
    Dim tax_cin As Single               '資本所得税率の値
    
    Dim num_row As Integer              '財（行部門）の数
    Dim num_col As Integer              '部門（列部門）の数
    
    Dim num_add As Integer              '付加価値部門の数
    Dim num_fin As Integer              '最終需要部門の数
    
    Dim int_len_r As Integer            '行の数 = 財 + 付加価値部門
    Dim int_len_c As Integer            '列の数 = 部門 + 最終需要部門
    
    Dim row_index(600) As String        '行のindex
    Dim row_index_en(600) As String     '行のindex（英語）
    
    Dim col_index(600) As String        '列のindex
    Dim col_index_en(600) As String     '列のindex（英語）
    
    Dim i_row As Integer                '行用の変数
    Dim ii_row As Integer               '行用の変数
    Dim i_col As Integer                '列用の変数
    Dim ii_col As Integer               '列用の変数
    
    Dim cur_row As Integer              '現在の行番号（一番、下側の行番号を保持する）
    
    Dim dom_row As Integer              '国内への供給のデータの行番号
    
    Dim cell_t As String                'セルのアドレス
    Dim cell_s As String                '開始のアドレス
    Dim cell_f As String                '終了のアドレス
    Dim cell_ss As String                '開始のアドレス
    Dim cell_ff As String                '終了のアドレス
    
    Dim fl_ssce As Integer              '社会保障負担を労働所得に含めるのなら非ゼロ
    
    Dim data_Name As String
    
    
'======================================================================
'
'   Set_data シートからデータを読む
'
'======================================================================

    '部門数などを取得
    i_row = 4                           '初期値
    
    Sheets("Set_data").Select                 'indexシートを選択
        
    'データ名
    data_Name = Cells(1, 1).Value
    
    '財の数
    num_row = Application.WorksheetFunction.CountA(Range("A4:A600"))
    
    '部門の数
    num_col = Application.WorksheetFunction.CountA(Range("D4:D600"))
    
    '付加価値部門の数
    num_add = Application.WorksheetFunction.CountA(Range("G4:G600"))
    
    '最終需要部門の数
    num_fin = Application.WorksheetFunction.CountA(Range("J4:J600"))
    
    '行（財）のindexの取得
    i_row = 3
    i_col = 1
    
    For I = 1 To num_row
        
        row_index(I) = Cells(i_row + I, i_col + 1).Value
        row_index_en(I) = Cells(i_row + I, i_col).Value
    
    Next
    
    '行（付加価値部門）のindexの取得
    i_row = 3
    i_col = 7
    
    For I = 1 To num_add
        
        row_index(I + num_row) = Cells(i_row + I, i_col + 1).Value
        row_index_en(I + num_row) = Cells(i_row + I, i_col).Value
        
        If row_index_en(I + num_row) = "wage" Then
            num_wage = I + num_row
        End If
        
        If row_index_en(I + num_row) = "opse" Then
            num_opse = I + num_row
        End If
    Next
            
    '列（部門）のindexの取得
    i_row = 3
    i_col = 4
    
    For I = 1 To num_col
        col_index(I) = Cells(i_row + I, i_col + 1).Value
        col_index_en(I) = Cells(i_row + I, i_col).Value
    Next
    
    '列（最終需要部門）のindexの取得
    i_row = 3
    i_col = 10
    
    For I = 1 To num_fin
        
        col_index(I + num_col) = Cells(i_row + I, i_col + 1).Value
        col_index_en(I + num_col) = Cells(i_row + I, i_col).Value
        
        If col_index_en(I + num_col) = "expo" Then
            num_expo = I + num_col
        End If
        
        If col_index_en(I + num_col) = "impo" Then
            num_impo = I + num_col
        End If
        
        If col_index_en(I + num_col) = "hhco" Then
            num_hhco = I + num_col
        End If
    
    Next

    '行の数
    int_len_r = num_row + num_add
    
    '列の数
    int_len_c = num_col + num_fin


'======================================================================
'
'   設定シートからデータを読む
'
'======================================================================
    
    Dim ws As Worksheet
    Dim wsActive As Worksheet
    Dim my_flag As Boolean
    
    my_flag = False
    
    For Each ws In Worksheets
        If ws.Name = "設定" Then my_flag = True
    Next ws
    
    If my_flag = False Then
    
        MsgBox "設定シートがないのでデフォールト値を利用します。"
        
        fl_ssce = 0
        tax_lin = 0.3
        tax_cin = 0.1
        tax_con = 0
        
    Else
    
        Sheets("設定").Select
        
        '部門数などを取得
        i_row = 3
        i_col = 3
    
        fl_ssce = Cells(i_row, i_col).Value
        tax_lin = Cells(i_row + 1, i_col).Value
        tax_cin = Cells(i_row + 2, i_col).Value
        tax_con = Cells(i_row + 3, i_col).Value
    
    End If
    


'======================================================================
'
'   IOシートの作業
'
'======================================================================


'------------------------------------------------------------
'   IOシートの作成
'------------------------------------------------------------

    '既に「IO」シートがある場合は、それをクリアして使う。
    
    my_flag = False
   
    For Each ws In Worksheets
        If ws.Name = "IO" Then my_flag = True
    Next ws
    
    If my_flag = True Then
    
        '以下はIOシートがあるケース
        Sheets("IO").Select
        Cells.Clear
        Range("A1").Select
        Set wsActive = ActiveSheet
    
    Else
    
        '以下はIOシートがないケース
        Worksheets.Add After:=ActiveSheet   'シートの作成
        Set wsActive = ActiveSheet
    
        'シート名の設定
        wsActive.Name = "IO"
    
    End If
    
    '列の幅を変更
    Range(Columns(1), Columns(600)).ColumnWidth = 9
    
    
    With Range(Cells(1, 1), Cells(1500, 300)).Interior
        .Pattern = xlSolid
        .PatternColorIndex = xlAutomatic
        .ThemeColor = xlThemeColorDark1
        .TintAndShade = 0
        .PatternTintAndShade = 0
    End With
    
    
  

'------------------------------------------------------------
'   連関表のテンプレートの作成
'------------------------------------------------------------
    
    'A1セルにデータの名前
    Range("A1").Value = data_Name
    
    
    Range("A3").Value = "単位:10億円"
    
    '連関表のインデックスの入力（行方向）
    i_row = 6
    
    For I = 1 To int_len_r
        Cells(i_row, 1).Value = row_index_en(I)
        Cells(i_row, 2).Value = row_index(I)
        i_row = i_row + 1
    Next
    
    '最後の行番号
    cur_row = i_row - 1
    
    
    '連関表のインデックスの入力（列方向）
    i_col = 3
    For I = 1 To int_len_c
        Cells(4, i_col).Value = col_index_en(I)
        Cells(5, i_col).Value = col_index(I)
        i_col = i_col + 1
    Next
    
    'Value_data シートからデータをコピーする
    
    'コピー元のセルの指定
    cell_s = Cells(4, 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(int_len_r + 3, int_len_c + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    'セルのコピー
    Worksheets("Value_data").Range(cell_s, cell_f).Copy
    
    '貼り付け
    Range("C6").PasteSpecial Paste:=xlPasteValues


    '以下、連関表に色をつける。
    i_row = 4
    i_col = 1
    
    'セルの選択
    Range(Cells(i_row + 2, i_col + 2), Cells(cur_row, i_col + int_len_c + 1)).Interior.Color = RGB(221, 235, 247)
    
    '連関表に罫線を引く
    cur_row = cur_row + 1
    
    Range(Cells(i_row, i_col), Cells(cur_row, i_col + int_len_c + 2)).Select
    Draw_Keisen
    
    
    '不要な部分の色と罫線を消す。
    With Range(Cells(cur_row - num_add, i_col + int_len_c + 2 - num_fin), Cells(cur_row, i_col + int_len_c + 2))
    
        .Clear
        .Interior.Color = RGB(255, 255, 255)
        
    End With
   
'------------------------------------------------------------
'   合計欄を作成  sumの式（列）
'------------------------------------------------------------

    i_row = 6
    i_col = 3
    
    Range("B" & cur_row) = "列和"
    
    '最後のセル
    cell_s = Cells(cur_row - 1, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    
    With Range("C" & i_row + int_len_r)
        
        .Formula = "=SUM(C" & i_row & ":" & cell_s & " )"
        .AutoFill Destination:=.Resize(1, num_col)
    
    End With

    cell_s = Cells(i_row - 1, i_col + int_len_c).Address
    Range(cell_s).Value = "行和"

    '最後のセル
    cell_s = Cells(i_row, int_len_c + i_col - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '式を入れるセル
    cell_t = Cells(i_row, int_len_c + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        
        .Formula = "=SUM(D" & i_row & ":" & cell_s & " )"
        .AutoFill Destination:=.Resize(num_row, 1)
    
    End With
    
    'セルの書式を変更（数字　→　桁区切り入れて、小数点第1位のみ）
    With Range(Cells(6, 3), Cells(cur_row, int_len_c + 3))
        .Style = "Comma [0]"
        .NumberFormatLocal = "#,##0.0"
    End With
        
    
'------------------------------------------------------------
'   付加価値・最終需要チェック
'------------------------------------------------------------

    i_row = cur_row + 2
    ii_row = 6
    i_col = 3
    
    Range("B" & i_row) = "付加価値合計"
    Range("B" & i_row + 1) = "最終需要合計"
    Range("B" & i_row + 2) = "Check"
 
    '付加価値の合計
    
    '最初のセル
    cell_s = Cells(cur_row - num_add, i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '最後のセル
    cell_f = Cells(cur_row - 1, num_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range("C" & i_row) = "=SUM(" & cell_s & ":" & cell_f & " ) / 1000"
    
    '最終需要の合計
    cell_s = Cells(ii_row, num_col + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(ii_row + num_row - 1, int_len_c + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range("C" & i_row + 1) = "=SUM(" & cell_s & ":" & cell_f & " )/1000"
    
    '付加価値と最終需要の比較
    cell_s = Cells(i_row, i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(i_row + 1, i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range("C" & i_row + 2) = "=if(" & cell_s & "=" & cell_f & " ,""OK"",""NG"") "
    
    '最後の行番号
    cur_row = cur_row + 4
    
    'セルの書式を変更（数字　→　桁区切り入れて、小数点第1位のみ）
    With Range(Cells(cur_row - 2, 3), Cells(cur_row - 1, 3))
        .Style = "Comma [0]"
        .NumberFormatLocal = "#,##0.0"
    End With
    
    
    '罫線
    Range(Cells(i_row, 1), Cells(cur_row, 3)).Select
    Draw_Keisen
    

'------------------------------------------------------------
'   産出行列（財×部門）の作成
'------------------------------------------------------------

    i_row = cur_row + 3
    
    Range("A" & i_row) = "産出行列（財×部門）"
    
    '国内への供給のデータの行番号
    dom_row = i_row + 3
   
    
    '連関表のインデックスの入力
    'まずは行方向
    ii_row = i_row + 3
    
    For I = 1 To num_row
        Cells(ii_row, 1).Value = row_index_en(I)
        Cells(ii_row, 2).Value = row_index(I)
        ii_row = ii_row + 1
    Next
    
    cur_row = ii_row - 1
    
    
    '次は列方向
    i_col = 3
    ii_row = i_row + 1
    For I = 1 To num_col
        Cells(ii_row, i_col).Value = col_index_en(I)
        Cells(ii_row + 1, i_col).Value = col_index(I)
        i_col = i_col + 1
    Next
    
    
    'V_table_dataからデータをコピー
    
    'コピー元のセルの指定
    cell_s = Cells(4, 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(num_row + 3, num_row + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    'セルのコピー
    Worksheets("V_table_data").Range(cell_s, cell_f).Copy
    
    '貼り付け
    Cells(i_row + 3, 3).PasteSpecial Paste:=xlPasteValues
    
    
    '産出行列に色をつける。
    i_col = 3
    
    Range(Cells(i_row + 3, i_col), Cells(cur_row, i_col + num_col - 1)).Interior.Color = RGB(221, 235, 247)

    cur_row = cur_row + 1
    Cells(cur_row, 2).Value = "列和"
    
    Cells(i_row + 2, num_col + 3).Value = "総生産"
    Cells(i_row + 2, num_col + 5).Value = "国内への供給"

    '産出行列に罫線を引く
    i_col = 1
    
    '罫線を引く
    Range(Cells(i_row + 1, i_col), Cells(cur_row, i_col + num_col + 4)).Select
    Draw_Keisen
    
    
    Range("A1").Select
    
    'セルの書式を変更（数字　→　桁区切り入れて、小数点第1位のみ）
    With Range(Cells(i_row + 3, 3), Cells(cur_row, num_col + 5)).Select
        Selection.Style = "Comma [0]"
        Selection.NumberFormatLocal = "#,##0.0"
    End With
        

'------------------------------------------------------------
'   合計欄を作成 産出行列（財×部門） sumの式（列）
'------------------------------------------------------------

    'まず、列和
    ii_row = i_row + 3
    
    '最後のセル
    cell_s = Cells(cur_row - 1, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)

    With Range("C" & cur_row)
        
        .Formula = "=SUM(C" & ii_row & ":" & cell_s & " )"
        .AutoFill Destination:=.Resize(1, num_col)
    
    End With
    
    '次は行和
    
    '開始セル
    cell_s = Cells(ii_row, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '終了セル
    cell_f = Cells(ii_row, num_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '入力するセル
    cell_t = Cells(ii_row, num_col + 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
   
    With Range(cell_t)
        
        .Formula = "=SUM(" & cell_s & ":" & cell_f & " )"
        .AutoFill Destination:=.Resize(num_row, 1)
    
    End With
    
    '国内への供給
    i_row = 6
    i_col = 6
    
    '総生産
    cell_s = Cells(ii_row, num_col + 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '輸出
    cell_f = Cells(i_row, num_expo + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '国内への生産
    cell_t = Cells(ii_row, num_col + 5).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
    
        .Formula = "=" & cell_s & "-" & cell_f
        .AutoFill Destination:=.Resize(num_row, 1)
    
    End With

'------------------------------------------------------------
'   要素所得の作成
'------------------------------------------------------------

    i_row = cur_row + 3
    
    Range("A" & i_row) = "要素所得"
    
    Cells(i_row + 3, 2).Value = "労働所得"
    Cells(i_row + 4, 2).Value = "資本所得"
   
    'インデックスの挿入
    i_col = 3
    For I = 1 To num_col
8        Cells(i_row + 1, i_col).Value = col_index_en(I)
        Cells(i_row + 2, i_col).Value = col_index(I)
        i_col = i_col + 1
    Next
    
    
    '要素所得額の代入
    
    'まず、労働所得
    
    '社会保障負担を労働所得に含めるかどうかで場合分け。
    If fl_ssce = 0 Then
    
        With Range("C" & i_row + 3)
            .Formula = "=C" & num_wage + 5
        .AutoFill Destination:=.Resize(1, num_col)
        End With
    
    Else
    
        With Range("C" & i_row + 3)
            .Formula = "=C" & num_wage + 5 & "+C" & num_wage + 6
        .AutoFill Destination:=.Resize(1, num_col)
        End With
    
    End If
    
    '資本所得 = 営業余剰 + 固定資本減耗
    With Range("C" & i_row + 4)
        .Formula = "=C" & num_opse + 5 & "+C" & num_opse + 6
        .AutoFill Destination:=.Resize(1, num_col)
    End With

    '所得税用
    
    Cells(i_row + 6, 3).Value = "粗所得"
    Cells(i_row + 6, 4).Value = "税率"
    Cells(i_row + 6, 5).Value = "税額"
    Cells(i_row + 6, 6).Value = "純所得"
        
    Cells(i_row + 7, 2).Value = "労働所得"
    Cells(i_row + 8, 2).Value = "資本所得"
    
    
    '税率の設定
    Cells(i_row + 7, 4).Value = tax_lin
    Cells(i_row + 8, 4).Value = tax_cin
    
    'cur_row の値のアップデート
    cur_row = i_row + 8
    
    '合計値を代入するセル
    cell_t = Cells(i_row + 7, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '最初のセル
    cell_s = Cells(i_row + 3, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '最後のセル
    cell_f = Cells(i_row + 3, num_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)

    '所得の合計額
    With Range(cell_t)
        .Formula = "=SUM(" & cell_s & ":" & cell_f & " )"
        .AutoFill Destination:=.Resize(2, 1)
    End With
    
    '労働所得税率のセル
    cell_s = Cells(i_row + 7, 4).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '労働所得税額
    Cells(i_row + 7, 5).Value = "=" & cell_t & "*" & cell_s
    '労働所得税額のセル
    cell_f = Cells(i_row + 7, 5).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '純労働所得
    Cells(i_row + 7, 6).Value = "=" & cell_t & "-" & cell_f
    
        
    '合計値を代入するセル
    cell_t = Cells(i_row + 8, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    cell_s = Cells(i_row + 8, 4).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '資本所得税額
    Cells(i_row + 8, 5).Value = "=" & cell_t & "*" & cell_s
    '資本所得税額のセル
    cell_f = Cells(i_row + 8, 5).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '純資本所得
    Cells(i_row + 8, 6).Value = "=" & cell_t & "-" & cell_f
    
    'セルの書式を変更（数字　→　桁区切り入れて、小数点第1位のみ）
    With Range(Cells(i_row + 3, 3), Cells(i_row + 4, num_col + 2)).Select
        Selection.Style = "Comma [0]"
        Selection.NumberFormatLocal = "#,##0.0"
    End With
    
    With Range(Cells(i_row + 7, 3), Cells(i_row + 8, 6)).Select
        Selection.Style = "Comma [0]"
        Selection.NumberFormatLocal = "#,##0.0"
    End With
    
    '罫線
    Range(Cells(i_row + 1, 1), Cells(i_row + 4, num_col + 2)).Select
    Draw_Keisen
        
    
    Range(Cells(i_row + 7, 1), Cells(i_row + 8, 6)).Select
    Draw_Keisen
    
    
    '色を変更
    Range(Cells(i_row + 7, 3), Cells(i_row + 8, 3)).Interior.Color = RGB(221, 235, 247)
    Range(Cells(i_row + 7, 5), Cells(i_row + 8, 5)).Interior.Color = RGB(221, 235, 247)
    
    
    
'------------------------------------------------------------
'   消費税の作成
'------------------------------------------------------------
   
    i_row = cur_row + 3
    
    Range("A" & i_row) = "消費税"
    Range("B" & i_row + 1) = "消費税率 = "
    Range("C" & i_row + 3) = "家計消費額"
    Range("D" & i_row + 3) = "消費税額"
    
    '消費税率の挿入
    Range("C" & i_row + 1) = tax_con
    
    'インデックス
    ii_row = i_row + 4
    For I = 1 To num_row
        Cells(ii_row, 1).Value = row_index_en(I)
        Cells(ii_row, 2).Value = row_index(I)
        ii_row = ii_row + 1
    Next
    
    Cells(ii_row, 2).Value = "合計"
    
    cur_row = ii_row

    '家計消費額
    '代入先
    cell_t = Cells(i_row + 4, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    '消費税額のセル
    cell_s = Cells(6, num_hhco + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
  
    With Range(cell_t)
        .Formula = "=" & cell_s
        .AutoFill Destination:=.Resize(num_row, 1)
    End With
    
    '消費税額
    cell_t = Cells(i_row + 4, 4).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_s = Cells(i_row + 4, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(i_row + 1, 3).Address

    With Range(cell_t)
        .Formula = "=" & cell_s & "*" & cell_f
        .AutoFill Destination:=.Resize(num_row, 1)
    End With
    
    '消費税額の合計値の計算
    '最後のセル
    cell_s = Cells(cur_row - 1, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range("C" & cur_row)
        .Formula = "=SUM(C" & i_row + 4 & ":" & cell_s & " )"
        .AutoFill Destination:=.Resize(1, 2)
    End With
    
    'セルの書式を変更（数字　→　桁区切り入れて、小数点第1位のみ）
    With Range(Cells(i_row + 4, 3), Cells(cur_row, 4)).Select
        Selection.Style = "Comma [0]"
        Selection.NumberFormatLocal = "#,##0.0"
    End With
    
    '罫線
    Range(Cells(i_row + 1, 1), Cells(cur_row, 4)).Select
    Draw_Keisen
    
    
    '色を変更
    Range(Cells(cur_row, 3), Cells(cur_row, 4)).Interior.Color = RGB(221, 235, 247)
        

'------------------------------------------------------------
'   国内供給マトリックス（財x財）
'------------------------------------------------------------
 
    'インデックス
    i_row = cur_row + 3
    i_col = 2
    
    Range("A" & i_row) = "国内供給マトリックス（財x財）"
    
    For I = 1 To num_row
        Cells(i_row + I + 2, 1).Value = row_index_en(I)
        Cells(i_row + I + 2, 2).Value = row_index(I)
        Cells(i_row + 1, I + 2).Value = row_index_en(I)
        Cells(i_row + 2, I + 2).Value = row_index(I)
    Next
    
    cur_row = i_row
    
    'セルの中身
    i_row = cur_row + 3
    i_col = 3
    ii_col = num_col + 5
    
    For I = 1 To num_row
        For j = 1 To num_row
        
            '値をとってくるセル
            cell_t = Cells(dom_row + I - 1, ii_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)

            If I = j Then
                Cells(i_row + I - 1, i_col + j - 1).Value = "=" & cell_t
            Else
                Cells(i_row + I - 1, i_col + j - 1).Value = 0
            End If
                   
        Next
    Next
    
    cur_row = i_row + num_row - 1
    
    'セルの書式を変更（数字　→　桁区切り入れて、小数点第1位のみ）
    ' + 色づけ
    With Range(Cells(i_row, 3), Cells(cur_row, num_row + 2))
        .Style = "Comma [0]"
        .NumberFormatLocal = "#,##0.0"
        .Interior.Color = RGB(221, 235, 247)
        
    End With
    
    '罫線
    Range(Cells(i_row - 2, 1), Cells(cur_row, num_row + 2)).Select
    Draw_Keisen


   
'------------------------------------------------------------
'   貿易収支の作成
'------------------------------------------------------------
        
    i_row = cur_row + 3
    i_col = 1
        
    Range("A" & i_row) = "貿易データ"
    Range("B" & i_row + 1) = "輸出額"
    Range("B" & i_row + 2) = "輸入額（関税抜き）"
    Range("B" & i_row + 3) = "輸入額（関税込み）"
    Range("B" & i_row + 4) = "貿易収支（関税抜き）"
    Range("B" & i_row + 5) = "貿易収支（関税込み）"
        
    '輸出額の合計
    cell_s = Cells(6, num_expo + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(num_row + 5, num_expo + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range("C" & i_row + 1) = "=SUM(" & cell_s & ":" & cell_f & " )"
    
    '輸入額（関税抜き）の合計
    cell_s = Cells(6, num_impo + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(num_row + 5, num_impo + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_ss = Cells(6, num_impo + 4).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_ff = Cells(num_row + 5, num_impo + 4).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range("C" & i_row + 2) = "= - SUM(" & cell_s & ":" & cell_f & " ) - SUM(" & cell_ss & ":" & cell_ff & ")"
    
    '輸入額（関税込み）の合計
    cell_s = Cells(6, num_impo + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(num_row + 5, num_impo + 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range("C" & i_row + 3) = "= - SUM(" & cell_s & ":" & cell_f & " )"
    
    '貿易収支（関税抜き）
    cell_s = Cells(i_row + 1, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(i_row + 2, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range("C" & i_row + 4) = "=" & cell_s & "-" & cell_f
    
    '貿易収支（関税込み）
    cell_s = Cells(i_row + 1, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(i_row + 3, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range("C" & i_row + 5) = "=" & cell_s & "-" & cell_f
    
    cur_row = i_row + 5
        
       
    'セルの書式を変更（数字　→　桁区切り入れて、小数点第1位のみ）
    With Range(Cells(i_row + 1, 3), Cells(cur_row, 3)).Select
        Selection.Style = "Comma [0]"
        Selection.NumberFormatLocal = "#,##0.0"
    End With
    
    '罫線
    Range(Cells(i_row + 1, 1), Cells(cur_row, 3)).Select
    Draw_Keisen
    
    '色づけ
    Cells(i_row + 4, 3).Interior.Color = RGB(221, 235, 247)
    
    
    Range("A1").Select
    


End Sub


Function Draw_Keisen()
'
'   罫線を引くマクロ

    '上側の横線
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlThin
    End With
    '下側の横線
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlThin
    End With
    '内側の横線
    With Selection.Borders(xlInsideHorizontal)
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlThin
    End With

End Function





