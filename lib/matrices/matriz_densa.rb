
class Matriz_densa < Matriz 

  attr_reader :rows, :cols
  
  def initialize(rows, cols, ele)
    super(rows, cols)
    @mat=Array.new(ele)  
  end
  
  def pos(x,y)
    (x*@cols)+y
  end
  
  def [](x,y)
    @mat[pos(x,y)]
  end
  
  def []=(x,y,value)
    @mat[pos(x,y)] = value
  end 

  def ==(other)
    if (@rows != other.rows || @cols != other.cols)
      return false
    end
    for i in 0...@rows
      for j in 0...@cols
        if (@mat[pos(i,j)] != other[i,j])
          return false
        end
      end
    end
    return true
  end
  
end
