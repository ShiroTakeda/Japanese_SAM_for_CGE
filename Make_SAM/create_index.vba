
'----------------------------------------------------------
Sub インデックスの作成()
'----------------------------------------------------------

'======================================================================
'
'   変数の宣言
'
'======================================================================

    Dim I As Integer                    'ループのカウンター
    Dim j As Integer
    
    Dim i_row As Integer
    Dim i_col As Integer
    Dim ii_row As Integer
    Dim ii_col As Integer
    
    Dim num_sec As Integer
    Dim num_reg As Integer
    Dim num_va As Integer
    Dim num_fd As Integer
    Dim num_fd_sub As Integer
    
    num_sec = 37
    num_reg = 47
    num_va = 6
    num_fd = 7
    num_fd_sub = 4
    
    Dim sec_index(40) As String
    Dim reg_index(60) As String
    Dim va_index(10) As String
    Dim fd_index(10) As String
    Dim fd_sub_index(10) As String
    
       
'======================================================================
'
'   Indexシートからデータを読む
'
'======================================================================

    'indexシートを選択
    Sheets("Index").Select
        
    '地域のindexの取得
    i_row = 5
    i_col = 2
    
    For I = 1 To num_reg
    
        reg_index(I) = Cells(i_row + I, i_col).Value
        
    Next
        
    '部門のindexの取得
    i_row = 5
    i_col = 5
    
    For I = 1 To num_sec
    
        sec_index(I) = Cells(i_row + I, i_col).Value
        
    Next
        
    'VA部門のindexの取得
    i_row = 5
    i_col = 8
    
    For I = 1 To num_va
    
        va_index(I) = Cells(i_row + I, i_col).Value
        
    Next
        
    'FD部門のindexの取得
    i_row = 5
    i_col = 11
    
    For I = 1 To num_fd
    
        fd_index(I) = Cells(i_row + I, i_col).Value
        
    Next
        
            
    'FD部門のindexの取得
    i_row = 5
    i_col = 14
    
    For I = 1 To num_fd_sub
    
        fd_sub_index(I) = Cells(i_row + I, i_col).Value
        
    Next
        
    

'======================================================================
'
'   ひな型の作成
'
'======================================================================


    my_flag = False
    
    For Each ws In Worksheets
        If ws.Name = "temp" Then my_flag = True
    Next ws
    
    If my_flag = True Then
    
        '以下はSAMシートがあるケース
        Sheets("temp").Select
        Cells.Clear
        Range("A1").Select
        Set wsActive = ActiveSheet
    
    Else
    
        '以下はSAMシートがないケース
        Worksheets.Add After:=ActiveSheet   'シートの作成
        Set wsActive = ActiveSheet
    
        'シート名の設定
        wsActive.Name = "temp"
    
    End If


    '連関表のインデックスの入力（行方向）
    i_row = 7
    i_col = 5

    
    For I = 1 To num_reg
    
        For j = 1 To num_sec
        
            Cells(i_row, i_col).Value = reg_index(I)
            Cells(i_row, i_col + 1).Value = sec_index(j)
            Cells(i_row, i_col - 1).Value = i_row - 6
            
            i_row = i_row + 1

        Next
        
    Next
    
    'VA用のインデックス
    For I = 1 To num_reg
    
        For j = 1 To num_va
        
            Cells(i_row, i_col).Value = reg_index(I)
            Cells(i_row, i_col + 1).Value = va_index(j)
            Cells(i_row, i_col - 1).Value = i_row - 6
            
            i_row = i_row + 1

        Next
        
    Next
    
    
    '連関表のインデックスの入力（列方向）
    i_row = 5
    i_col = 7

    
    For I = 1 To num_reg
    
        For j = 1 To num_sec
        
            Cells(i_row, i_col).Value = reg_index(I)
            Cells(i_row + 1, i_col).Value = sec_index(j)
            Cells(i_row - 1, i_col).Value = i_col - 6
            
            i_col = i_col + 1

        Next
        
    Next
    
    'FDインデックスの入力
    
    For I = 1 To num_reg
    
        For j = 1 To num_fd
        
            Cells(i_row, i_col).Value = reg_index(I)
            Cells(i_row + 1, i_col).Value = fd_index(j)
            Cells(i_row - 1, i_col).Value = i_col - 6
            
            i_col = i_col + 1

        Next
        
    Next
    
    'FD_SUBインデックスの入力
    
    For I = 1 To num_fd_sub
    
        Cells(i_row, i_col).Value = fd_sub_index(I)
        Cells(i_row + 1, i_col).Value = fd_sub_index(I)
        Cells(i_row - 1, i_col).Value = i_col - 6
            
        i_col = i_col + 1

    Next
    

End Sub
