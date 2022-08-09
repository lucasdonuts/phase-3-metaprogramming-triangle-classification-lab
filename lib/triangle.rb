class Triangle
  @@triangle = []
  
  def initialize( s1, s2, s3 )
    @s1 = s1
    @s2 = s2
    @s3 = s3
    @@triangle = [@s1, @s2, @s3]
  end

  def kind
    if self.valid_triangle?
      triangle = [@s1, @s2, @s3]
      if triangle.uniq.length == 1
        return :equilateral
      elsif triangle.uniq.length == 2
        return :isosceles
      elsif triangle.uniq.length == 3
        return :scalene
      end
    else
      begin
        raise TriangleError
        puts TriangleError.message
      end
    end
  end

  def valid_triangle?
    @@triangle.each do |side|
      return false if @@triangle.sum - side <= side || side <= 0
    end
    return true
  end

  class TriangleError < StandardError
    def message
      "Triangle is invalid"
    end
  end

end