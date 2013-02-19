class RowProcessor
  def initialize()
    @summarized_cols = {}
    @break_cols = {}
    super
  end

  def add_summarized_column(col)
    @summarized_cols[col] = SummarizedNumericColumn.new
  end

  def add_summarized_numeric_column(col)
    @summarized_cols[col] = SummarizedNumericColumn.new
  end

  def add_break_column(col, rest)
    @break_cols[col] = BreakColumn.new(col, rest)
  end

  def process_row(row)
    @break_cols.each do |k,bc| do
      bc.process_row(row[k])
    end
    @summarized_cols.each do |k,sc| do
      sc.process_row(row[k])
    end
  end
end