
class Matriz_densa < Matriz 

  attr_reader :rows, :cols
  
  def initialize(rows, cols, ele)
    super(rows, cols)
    @mat=Array.new(ele)
    @mat.map! {|e|; if e == e.elemento_nulo; e = 0; else e; end}
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
  
   def max
    aux=0
    for i in 0...@rows
      for j in 0...@cols
        if (@mat[pos(i,j)] > aux)
          aux=@mat[pos(i,j)]
        end
      end
    end
    aux
  end
  
  def min
    aux=99999999
    for i in 0...@rows
      for j in 0...@cols
        if (@mat[pos(i,j)] < aux)
          aux=@mat[pos(i,j)]
        end
      end
    end
    aux
  end
  
  
end
