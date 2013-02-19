class BreakColumn
  def new(col, rest)
    @break_column = col
    @break_header = rest[:break_header] ? rest[:break_header] : blank_header_footer
    @break_footer = rest[:break_footer] ? rest[:break_footer] : blank_header_footer
    @break_detail = rest[:break_detail] ? rest[:break_detail] : blank_header_footer
    @last_col_value = nil
    @row_count = 0
    @summarized_columns = []
  end

  def blank_header_footer()
    Proc.new {true}
  end

  def process_row(row)
    if row[@break_column] != @last_col_value # have a column break
      call(@break_footer, @last_col_value, row)
      call(@break_header, row)
      @row_count = 0
      @last_col_value = row[@break_col]
    end
    @row_count = @row_count + 1
    call(@break_detail, row)
  end

end