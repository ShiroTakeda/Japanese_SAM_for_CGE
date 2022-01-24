
'----------------------------------------------------------
Sub SAMの作成()
'----------------------------------------------------------

'======================================================================
'
'   変数の宣言
'
'======================================================================

    Dim I As Integer                    'ループのカウンター
    Dim j As Integer
    
    Dim tot_num As Integer              '行と列の総数
    Dim cur_row As Integer
    
    Dim first_index(9) As String        '1st index
    Dim first_index_beg(9) As Integer   '1st indexの始まる行番号
        
    Dim second_index(9, 600) As String  '2nd index
    Dim second_index_num(9) As Integer  '2nd indexの数
    
    Dim i_row As Integer                '行用の変数
    Dim i_col As Integer                '列用の変数
        
    Dim data_Name As String             'データの名前
    
    Dim num_com As Integer              '財の数
    Dim num_sec As Integer              '部門の数
    
    Dim com_index(600) As String        '財のindex
    Dim com_index_en(600) As String     '財のindex（英語）
    
    Dim sec_index(600) As String        '部門のindex
    Dim sec_index_en(600) As String     '部門のindex（英語）
    
    Dim cell_t As String                'セル用の変数
    Dim cell_s As String
    Dim cell_f As String
    
    Dim v_adjust As Double              '最後の調整用の変数
    Dim v_tradsur As Double             '貿易収支
    
    
'======================================================================
'
'   設定シートからデータを読む
'
'======================================================================
    
    Dim ws As Worksheet
    Dim wsActive As Worksheet
    Dim my_flag As Boolean
    
    Dim fl_ssce As Integer              '社会保障負担を労働所得に含めるのなら非ゼロ
    
    my_flag = False
    
    For Each ws In Worksheets
        If ws.Name = "設定" Then my_flag = True
    Next ws
    
    If my_flag = False Then
    
        MsgBox "設定シートがないのでデフォールト値を利用します。"
        
        fl_ssce = 0
        
    Else
    
        Sheets("設定").Select
        
        '部門数などを取得
        i_row = 3
        i_col = 3
    
        fl_ssce = Cells(i_row, i_col).Value
    
    End If

    
'======================================================================
'
'   Set_data シートからデータを読む
'
'======================================================================

    '部門数などを取得
    i_row = 4
    
    'indexシートを選択
    Sheets("Set_data").Select
        
    'データ名
    data_Name = Cells(1, 1).Value
    
    '財の数
    num_com = Application.WorksheetFunction.CountA(Range("A4:A600"))
    
    '部門の数
    num_sec = Application.WorksheetFunction.CountA(Range("D4:D600"))
    
    '行（財）のindexの取得
    i_row = 3
    i_col = 1
    
    For I = 1 To num_com
        
        com_index(I) = Cells(i_row + I, i_col + 1).Value
        com_index_en(I) = Cells(i_row + I, i_col).Value
    
    Next
    
    '列（部門）のindexの取得
    i_row = 3
    i_col = 4
    
    For I = 1 To num_sec
        sec_index(I) = Cells(i_row + I, i_col + 1).Value
        sec_index_en(I) = Cells(i_row + I, i_col).Value
    Next
    

'======================================================================
'
'   インデックスの作成
'
'======================================================================

    first_index(1) = "FACTOR"
    first_index(2) = "AGENT"
    first_index(3) = "TAX_FAC"
    first_index(4) = "TAX_FINC"
    first_index(5) = "TAX_OTH"
    first_index(6) = "SECTOR"
    first_index(7) = "DEALC"
    first_index(8) = "COM"
    first_index(9) = "OTH"
    
    second_index_num(1) = 2
    second_index_num(2) = 3
    second_index_num(3) = 2
    second_index_num(4) = 2
    second_index_num(5) = 3
    second_index_num(6) = num_sec
    second_index_num(7) = num_com
    second_index_num(8) = num_com
    second_index_num(9) = 3
    
    second_index(1, 1) = "LAB"
    second_index(1, 2) = "CAP"
    
    second_index(2, 1) = "HH"
    second_index(2, 2) = "GOV"
    second_index(2, 3) = "ROW"
    
    second_index(3, 1) = "LAB"
    second_index(3, 2) = "CAP"
    
    second_index(4, 1) = "LAB"
    second_index(4, 2) = "CAP"
    
    second_index(5, 1) = "OUT"
    second_index(5, 2) = "CON"
    second_index(5, 3) = "IMP"
    
    second_index(9, 1) = "CON"
    second_index(9, 2) = "INV"
    second_index(9, 3) = "GCN"


    For I = 1 To num_sec
        second_index(6, I) = UCase(sec_index_en(I))
    Next
    
    For I = 1 To num_com
        second_index(7, I) = UCase(com_index_en(I))
        second_index(8, I) = second_index(7, I)
    Next
    
    tot_num = 0
    
    For I = 1 To 9
        first_index_beg(I) = tot_num + 1
        tot_num = tot_num + second_index_num(I)
    Next
    

'======================================================================
'
'   SAMシートでの作業：SAMシートの作成
'
'======================================================================

    '一度IOシートを選択しておく
    Sheets("IO").Select

    '既に「SAM」シートがある場合は、それをクリアして使う。
    
    my_flag = False
    
    For Each ws In Worksheets
        If ws.Name = "SAM" Then my_flag = True
    Next ws
    
    If my_flag = True Then
    
        '以下はSAMシートがあるケース
        Sheets("SAM").Select
        Cells.Clear
        Range("A1").Select
        Set wsActive = ActiveSheet
    
    Else
    
        '以下はSAMシートがないケース
        Worksheets.Add After:=ActiveSheet   'シートの作成
        Set wsActive = ActiveSheet
    
        'シート名の設定
        wsActive.Name = "SAM"
    
    End If
    
    '列の幅を変更
    Range(Columns(1), Columns(600)).ColumnWidth = 9
    
    'セルの色をとりあえず白に
    With Range(Cells(1, 1), Cells(1000, 1000)).Interior
        .Pattern = xlSolid
        .PatternColorIndex = xlAutomatic
        .ThemeColor = xlThemeColorDark1
        .TintAndShade = 0
        .PatternTintAndShade = 0
    End With
    
    'セルの書式を変更（数字　→　桁区切り入れて、小数点第1位のみ）
    With Range(Cells(5, 4), Cells(tot_num + 10, tot_num + 10))
        .Style = "Comma [0]"
        .NumberFormatLocal = "#,##0.0"
    End With
 
  
'======================================================================
'
'   SAMシートでの作業：SAMのひな型の作成
'
'======================================================================

    'A1にデータ名を入れておく
    Range("A1").Value = data_Name
    
    Range("B2").Value = "単位:10億円"

    '連関表のインデックスの入力（行方向）
    i_row = 5
    i_col = 4
    ii_row = i_row
    ii_col = i_col
    
    'これは1から順に番号を振るための変数
    cur_row = 1
    
    For I = 1 To 9
    
        For j = 1 To second_index_num(I)
        
            Cells(i_row, 1).Value = cur_row
            Cells(i_row, 2).Value = first_index(I)
            Cells(i_row, 3).Value = second_index(I, j)
        
            Cells(2, i_col).Value = cur_row
            Cells(3, i_col).Value = first_index(I)
            Cells(4, i_col).Value = second_index(I, j)
            
            'セルに罫線
            If j = second_index_num(I) Then
                Range(Cells(ii_row, 2), Cells(i_row, tot_num + 3)).BorderAround Weight:=xlThin, LineStyle:=xlContinuous
                Range(Cells(3, ii_col), Cells(tot_num + 4, i_col)).BorderAround Weight:=xlThin, LineStyle:=xlContinuous
            End If

            '見出しセルに色付け
            If I Mod 2 = 0 Then
            
                '行に色付け
                Range(Cells(ii_row, 2), Cells(i_row, 3)).Interior.Color = RGB(232, 232, 232)
                
                '列に色付け
                Range(Cells(3, ii_col), Cells(4, i_col)).Interior.Color = RGB(232, 232, 232)
            
            End If
            
            i_row = i_row + 1
            i_col = i_col + 1
            cur_row = cur_row + 1
        
        Next
        
        ii_row = i_row
        ii_col = i_col
        
    Next
    
    '見出し行の中央添え
    Range(Cells(3, 2), Cells(4, tot_num + 3)).HorizontalAlignment = xlCenter
        
    '左上のセルに罫線
    Range(Cells(3, 2), Cells(4, 3)).BorderAround Weight:=xlThin, LineStyle:=xlContinuous


'------------------------------------------------------------
'   行和・列和
'------------------------------------------------------------

    i_row = 5
    i_col = 4
    
    '行和
    cell_s = Cells(i_row, i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(i_row + tot_num - 1, i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(i_row + tot_num, i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=sum(" & cell_s & ":" & cell_f & ")"
        .AutoFill Destination:=.Resize(1, tot_num), Type:=xlFillValues
    End With

    '列和
    cell_s = Cells(i_row, i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(i_row, i_col + tot_num - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(i_row, i_col + tot_num).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=sum(" & cell_s & ":" & cell_f & ")"
        .AutoFill Destination:=.Resize(tot_num, 1), Type:=xlFillValues
    End With
    
    '列和を行和の下にコピーで表示
    For I = 1 To tot_num
    
        cell_s = Cells(i_row + I - 1, i_col + tot_num).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        cell_t = Cells(i_row + tot_num + 1, i_col + I - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
        Range(cell_t).Formula = "=" & cell_s
    
    Next
    
    '行和・列和のチェック用の行
    cell_s = Cells(i_row + tot_num, i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(i_row + tot_num + 1, i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(i_row + tot_num + 3, i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=If(" & cell_s & "=" & cell_f & ",""◎""," & cell_s & "-" & cell_f & ")"
        .HorizontalAlignment = xlCenter
        .AutoFill Destination:=.Resize(1, tot_num)
    End With


'======================================================================
'
'   SAMシートでの作業：SAMの中身の作成
'
'======================================================================

'------------------------------------------------------------
'   A：投入行列

    i_row = 4
    i_col = 3
   
    cell_s = Cells(6, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(8) + i_row, first_index_beg(6) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=IO!" & cell_s
        .AutoFill Destination:=.Resize(num_com, 1), Type:=xlFillValues
        .AutoFill Destination:=.Resize(1, num_sec), Type:=xlFillValues
        .AutoFill Destination:=.Resize(num_com, num_sec), Type:=xlFillValues
    End With
    
    '色づけ
    cell_s = Cells(first_index_beg(8) + i_row, first_index_beg(6) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(8) + i_row + num_com - 1, first_index_beg(6) + i_col + num_sec - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(242, 220, 219)


'------------------------------------------------------------
'   B：要素への支払い

    '労働所得
    
    cell_s = Cells(num_com + 6, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(1) + i_row, first_index_beg(6) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    cell_f = Cells(num_com + 7, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)

    If fl_ssce = 0 Then
    
        With Range(cell_t)
            .Formula = "=IO!" & cell_s
            .AutoFill Destination:=.Resize(1, num_sec), Type:=xlFillValues
        End With
        
    Else
    
        With Range(cell_t)
            .Formula = "=IO!" & cell_s & "+IO!" & cell_f
            .AutoFill Destination:=.Resize(1, num_sec), Type:=xlFillValues
        End With
        
    End If
        
    '次、資本所得
    cell_s = Cells(num_com + 8, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(num_com + 9, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(1) + i_row + 1, first_index_beg(6) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=IO!" & cell_s & "+ IO!" & cell_f
        .AutoFill Destination:=.Resize(1, num_sec), Type:=xlFillValues
    End With
    
    '色づけ
    cell_s = Cells(first_index_beg(1) + i_row, first_index_beg(6) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(1) + i_row + 1, first_index_beg(6) + i_col + num_sec - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(255, 255, 225)


'------------------------------------------------------------
'   C：部門における税の支払い

    'まず社会保障雇主負担
    
    cell_s = Cells(num_com + 7, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(3) + i_row, first_index_beg(6) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        
    If fl_ssce = 0 Then
    
        With Range(cell_t)
           .Formula = "=IO!" & cell_s
           .AutoFill Destination:=.Resize(1, num_sec), Type:=xlFillValues
        End With
        
    Else
    
        With Range(cell_t)
           .Formula = 0
           .AutoFill Destination:=.Resize(1, num_sec), Type:=xlFillValues
        End With
        
    End If
    
    '産業側での資本への税はない
    cell_t = Cells(first_index_beg(3) + i_row + 1, first_index_beg(6) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = 0
        .AutoFill Destination:=.Resize(1, num_sec), Type:=xlFillValues
    End With
    
    '生産税
    cell_s = Cells(num_com + 10, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(num_com + 11, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(5) + i_row, first_index_beg(6) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=sum(IO!" & cell_s & ":" & "IO!" & cell_f & ")"
        .AutoFill Destination:=.Resize(1, num_sec), Type:=xlFillValues
    End With
    
    '色づけ
    cell_s = Cells(first_index_beg(3) + i_row, first_index_beg(6) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(5) + i_row, first_index_beg(6) + i_col + num_sec - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(220, 230, 241)
    

'------------------------------------------------------------
'   D: 国内生産（財×財）
    
    For I = 1 To num_com
        For j = 1 To num_sec
    
            cell_s = Cells(num_com + 22 + I - 1, 2 + j).Address(RowAbsolute:=False, ColumnAbsolute:=False)
            cell_t = Cells(first_index_beg(6) + i_row + j - 1, first_index_beg(7) + i_col + I - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        
            Range(cell_t).Formula = "=IO!" & cell_s
        
        Next
    Next
    
    '色づけ
    cell_s = Cells(first_index_beg(6) + i_row, first_index_beg(7) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(6) + i_row + num_sec - 1, first_index_beg(7) + i_col + num_com - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(218, 238, 243)


'------------------------------------------------------------
'   E: 輸出供給

    cell_s = Cells(6, num_sec + 9).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(7) + i_row, first_index_beg(2) + i_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=IO!" & cell_s
        .AutoFill Destination:=.Resize(num_com, 1), Type:=xlFillValues
    End With
    
    '色づけ
    cell_s = Cells(first_index_beg(7) + i_row, first_index_beg(2) + i_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(7) + i_row + num_com - 1, first_index_beg(2) + i_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(220, 230, 241)


'------------------------------------------------------------
'   F: 国内供給マトリックス
    
    ii_row = num_com * 3 + 46
    
    cell_s = Cells(ii_row, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(7) + i_row, first_index_beg(8) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=IO!" & cell_s
        .AutoFill Destination:=.Resize(num_com, 1), Type:=xlFillValues
        .AutoFill Destination:=.Resize(1, num_com), Type:=xlFillValues
        .AutoFill Destination:=.Resize(num_com, num_com), Type:=xlFillValues
    End With
    
    '色づけ
    cell_s = Cells(first_index_beg(7) + i_row, first_index_beg(8) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(7) + i_row + num_com - 1, first_index_beg(8) + i_col + num_com - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(228, 223, 236)
    
    
'------------------------------------------------------------
'   G: 輸入

    For I = 1 To num_com
    
        cell_s = Cells(6 + I - 1, num_sec + 10).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        cell_f = Cells(6 + I - 1, num_sec + 12).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        cell_t = Cells(first_index_beg(2) + i_row + 2, first_index_beg(8) + i_col + I - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        
        Range(cell_t).Formula = "=-IO!" & cell_s & "-IO!" & cell_f
    
    Next
    
    '色づけ
    cell_s = Cells(first_index_beg(2) + i_row + 2, first_index_beg(8) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(2) + i_row + 2, first_index_beg(8) + i_col + num_com - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(228, 223, 236)

    
'------------------------------------------------------------
'   H: 関税額
    
    For I = 1 To num_com
    
        cell_s = Cells(6 + I - 1, num_sec + 11).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        cell_t = Cells(first_index_beg(5) + i_row + 2, first_index_beg(8) + i_col + I - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        
        Range(cell_t).Formula = "=-IO!" & cell_s
    
    Next
    
    '色づけ
    cell_s = Cells(first_index_beg(5) + i_row + 2, first_index_beg(8) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(5) + i_row + 2, first_index_beg(8) + i_col + num_com - 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(253, 233, 217)


'------------------------------------------------------------
'   I：家計の消費需要

    'IOシートの消費の最初の行番号
    ii_row = num_com + num_com + 40

    cell_s = Cells(ii_row, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(8) + i_row, first_index_beg(9) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=IO!" & cell_s
        .AutoFill Destination:=.Resize(num_com, 1), Type:=xlFillValues
    End With

    '色づけ
    cell_s = Cells(first_index_beg(8) + i_row, first_index_beg(9) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(8) + i_row + num_com - 1, first_index_beg(9) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(242, 220, 219)


'------------------------------------------------------------
'   J：投資需要

    cell_s = Cells(6, num_sec + 6).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(6, num_sec + 8).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(8) + i_row, first_index_beg(9) + i_col + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=sum(IO!" & cell_s & ":IO!" & cell_f & ")"
        .AutoFill Destination:=.Resize(num_com, 1), Type:=xlFillValues
    End With
    
    '色づけ
    cell_s = Cells(first_index_beg(8) + i_row, first_index_beg(9) + i_col + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(8) + i_row + num_com - 1, first_index_beg(9) + i_col + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(197, 217, 241)


'------------------------------------------------------------
'   K：政府消費需要

    cell_s = Cells(6, num_sec + 4).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(6, num_sec + 5).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(8) + i_row, first_index_beg(9) + i_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=sum(IO!" & cell_s & ":IO!" & cell_f & ")"
        .AutoFill Destination:=.Resize(num_com, 1), Type:=xlFillValues
    End With
    
    '色づけ
    cell_s = Cells(first_index_beg(8) + i_row, first_index_beg(9) + i_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(8) + i_row + num_com - 1, first_index_beg(9) + i_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(224, 255, 255)
    
    
'------------------------------------------------------------
'   L：総投資額

    cell_s = Cells(6, num_sec + 6).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(num_com + 5, num_sec + 8).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(9) + i_row + 1, first_index_beg(2) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=sum(IO!" & cell_s & ":IO!" & cell_f & ")"
    End With

    '色づけ
    cell_s = Cells(first_index_beg(9) + i_row + 1, first_index_beg(2) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s).Interior.Color = RGB(255, 255, 225)


'------------------------------------------------------------
'   M：総消費税額
    
    'IOシートの消費税の行番号
    ii_row = num_com + num_com + num_com + 40
    
    cell_s = Cells(ii_row, 4).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(5) + i_row + 1, first_index_beg(9) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = "=IO!" & cell_s
    
    '色づけ
    Range(cell_t).Interior.Color = RGB(235, 241, 222)


'------------------------------------------------------------
'   N: 総家計消費額（消費税込み）
    
    'IOシートの消費額の合計の行番号
    ii_row = num_com + num_com + num_com + 40
    
    '総消費額（税込み）
    cell_s = Cells(ii_row, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(ii_row, 4).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(9) + i_row, first_index_beg(2) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = "=sum(IO!" & cell_s & ":IO!" & cell_f & ")"
    
    '色づけ
    Range(cell_t).Interior.Color = RGB(253, 233, 217)
    
    
'------------------------------------------------------------
'   O: 総政府消費額
    
    cell_s = Cells(6, num_sec + 4).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(5 + num_com, num_sec + 5).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(9) + i_row + 2, first_index_beg(2) + i_col + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = "=sum(IO!" & cell_s & ":IO!" & cell_f & ")"
    
    '色付け
    Range(cell_t).Interior.Color = RGB(218, 238, 243)


'------------------------------------------------------------
'   P: 海外貯蓄（or 海外からの投資）
    
    ii_row = num_com * 4 + 52

    v_tradsur = IO!
   
    cell_s = Cells(ii_row, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    '貿易収支の額を取得
    v_tradsur = Worksheets("IO").Range(cell_s).Value
    
    If v_tradsur > 0 Then
    
        cell_t = Cells(first_index_beg(2) + i_row + 2, first_index_beg(2) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        Range(cell_t).Formula = "=IO!" & cell_s
        
    Else
    
        cell_t = Cells(first_index_beg(2) + i_row, first_index_beg(2) + i_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        Range(cell_t).Formula = "=-IO!" & cell_s
    
    End If
        
    '色付け
    Range(cell_t).Interior.Color = RGB(253, 233, 217)
    
    
'------------------------------------------------------------
'   Q: 要素供給
    
    ii_row = num_com * 2 + 32
    
    '粗労働所得
    cell_s = Cells(ii_row, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(2) + i_row, first_index_beg(1) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = "=IO!" & cell_s
    
    '粗資本所得
    cell_s = Cells(ii_row + 1, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(2) + i_row, first_index_beg(1) + i_col + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = "=IO!" & cell_s
    
    '色づけ
    cell_s = Cells(first_index_beg(2) + i_row, first_index_beg(1) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(2) + i_row, first_index_beg(1) + i_col + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(242, 220, 219)
    

'------------------------------------------------------------
'   R: 要素所得への税
    
    ii_row = num_com * 2 + 32

    cell_s = Cells(ii_row, 5).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(4) + i_row, first_index_beg(2) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    With Range(cell_t)
        .Formula = "=IO!" & cell_s
        .AutoFill Destination:=.Resize(2, 1), Type:=xlFillValues
    End With
    
    '色づけ
    cell_s = Cells(first_index_beg(4) + i_row, first_index_beg(2) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(4) + i_row + 1, first_index_beg(2) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(220, 230, 241)
    
    
'------------------------------------------------------------
'   S: 各種の税の総額

    'まず生産税
    cell_s = Cells(num_com + 10, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(num_com + 11, num_sec + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(2) + i_row + 1, first_index_beg(5) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = "=sum(IO!" & cell_s & ":IO!" & cell_f & ")"

    '総消費額
    
    'IOシートの消費額の合計の行番号
    ii_row = num_com + num_com + num_com + 40
    
    cell_s = Cells(ii_row, 4).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(2) + i_row + 1, first_index_beg(5) + i_col + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = "=IO!" & cell_s

    '総関税額
    cell_s = Cells(6, num_sec + 11).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(6 + num_com, num_sec + 11).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(2) + i_row + 1, first_index_beg(5) + i_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = "=-sum(IO!" & cell_s & ":IO!" & cell_f & ")"
    
    '所得税
    ii_row = num_com * 2 + 32
    
    '労働所得税
    cell_s = Cells(ii_row, 5).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(2) + i_row + 1, first_index_beg(4) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = "=IO!" & cell_s

    '資本所得税
    cell_s = Cells(ii_row + 1, 5).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(2) + i_row + 1, first_index_beg(4) + i_col + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = "=IO!" & cell_s
    
    '社会保障負担
    cell_s = Cells(num_com + 7, 3).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(num_com + 7, num_sec + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_t = Cells(first_index_beg(2) + i_row + 1, first_index_beg(3) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    If fl_ssce = 0 Then
    
        Range(cell_t).Formula = "=sum(IO!" & cell_s & ":IO!" & cell_f & ")"
        
    Else
    
        Range(cell_t).Formula = 0
        
    End If
    
    '産業側での資本課税はなし
    cell_t = Cells(first_index_beg(2) + i_row + 1, first_index_beg(3) + i_col + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    
    Range(cell_t).Formula = 0
    
    '色づけ
    cell_s = Cells(first_index_beg(2) + i_row + 1, first_index_beg(3) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    cell_f = Cells(first_index_beg(2) + i_row + 1, first_index_beg(5) + i_col + 2).Address(RowAbsolute:=False, ColumnAbsolute:=False)
    Range(cell_s, cell_f).Interior.Color = RGB(235, 230, 210)

    
'------------------------------------------------------------
'   T: 調整用のセル
    
    cell_s = Cells(tot_num + i_row + 4, first_index_beg(2) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
   
   
    v_adjust = Range(cell_s).Value
    
    If v_adjust > 0 Then
    
        cell_t = Cells(first_index_beg(2) + i_row, first_index_beg(2) + i_col + 1).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        Range(cell_t).Value = v_adjust
        
    Else
    
        cell_t = Cells(first_index_beg(2) + i_row + 1, first_index_beg(2) + i_col).Address(RowAbsolute:=False, ColumnAbsolute:=False)
        Range(cell_t).Value = -v_adjust
    
    End If
        
    
    '色付け
    Range(cell_t).Interior.Color = RGB(235, 241, 222)
    
    
'======================================================================
'
'   その他
'
'======================================================================
    
    Range("A1").Select

End Sub

