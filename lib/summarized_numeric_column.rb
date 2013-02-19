class SummarizedNumericColumn  < SummarizedColumn

  # column with counts and sums
  def initialize
    @sum = 0
    super
  end

  def process_row(row)
    @sum = @sum +row[col]
    super
  end
end