class SummarizedColumn
  def initialize
    @row_count = 0
  end

  def process_row(row)
    @row_count = @row_count + 1
  end

end