module Prime
  class << self
    def generate
      range = 2...Float::INFINITY
    range.lazy.select(&:prime?)
    end
  end

  def prime?
    return false if self < 2

    trial_divisions = (2..Math.sqrt(self).to_i)
    trial_divisions.select { |d| self % d == 0 }.empty?
  end

end
